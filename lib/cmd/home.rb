module Dotfiler
  def home
    puts ENV['DOTFILER_HOME']
  end
  def home_s
    ENV['DOTFILER_HOME']
  end
end
