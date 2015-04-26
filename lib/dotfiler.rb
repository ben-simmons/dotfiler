# load the lib files
require 'pathname'
DOTFILER_LIBRARY_PATH = Pathname.new(__FILE__).realpath.parent
$:.unshift(DOTFILER_LIBRARY_PATH.to_s)
require 'global'

# handle version flag and switch
if ARGV.first == '--version'
  puts DOTFILER_VERSION
  exit 0
elsif ARGV.first == '-v'
  puts "Dotfiler #{DOTFILER_VERSION}"
  ARGV << ARGV.shift
  exit 0 if ARGV.length == 1
end

begin
  # restore Ctrl-C handler
  trap("INT", std_trap)
  
  aliases = {}
  empty_argv = ARGV.empty?
  help_regex = /(-h$|--help$|--usage$|-\?$|^help$)/
  help_flag = false
  cmd = nil

  # parse the command from input
  ARGV.dup.each_with_index do |arg, i|
    if help_flag && cmd
      break
    elsif arg =~ help_regex
      help_flag = true
    elsif !cmd
      cmd = ARGV.delete_at(i)
    end
  end

  # get the relevant command file
  cmd = aliases[cmd] if aliases[cmd]
  internal_cmd = require? DOTFILER_LIBRARY_PATH.join('cmd', cmd) if cmd

  # print usage
  if empty_argv || (help_flag && (cmd.nil? || internal_cmd))
    # TODO `dotfiler help cmd` should display subcommand help
    require 'cmd/help'
    puts ARGV.usage
    exit ARGV.any? ? 0 : 1
  end

  # execute the given command
  if internal_cmd
     Dotfiler.send cmd.to_s.gsub('-', '_').downcase
  elsif which "dotfiler-#{cmd}"
    exec "dotfiler-#{cmd}", *ARGV
  else
    onoe "Unknown command: #{cmd}"
    exit 1
  end
rescue SystemExit
  puts "Kernel.exit" if ARGV.verbose?
  raise
rescue Interrupt => e
  # handle the Ctrl-C interrupt
  puts
  exit 130
rescue RuntimeError, SystemCallError => e
  raise if e.message.empty?
  onoe e
  puts e.backtrace if ARGV.debug?
  exit 1
rescue Exception => e
  onoe e
  puts "Unknown bug!"
  puts e.backtrace
  exit 1
end
