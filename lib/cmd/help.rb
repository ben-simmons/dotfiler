DOTFILER_HELP = <<-EOS
Example usage:
  dotfiler install SNAPSHOT_URL [file]
  dotfiler uninstall FILE
  dotfiler home
EOS

module Dotfiler
  def help
    puts DOTFILER_HELP
  end
  def help_s
    DOTFILER_HELP
  end
end
