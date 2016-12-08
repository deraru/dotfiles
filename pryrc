# Integrate command history with irb history
Pry.config.history.file = '~/.irb_history'

# Use vim
Pry.config.editor = 'vim'

# Awesomeprint
begin
  require 'awesome_print'
  require 'awesome_print/ext/active_record'
  require 'awesome_print/ext/active_support'
  AwesomePrint.defaults = {
    indent: 2
  }
  AwesomePrint.pry!
end

# For Rails
if defined?(Rails)
  begin
    require "rails/console/app"
    require "rails/console/helpers"
  rescue LoadError => e
    require "console_app"
    require "console_with_helpers"
  end
end

# For debugger
if defined?(PryDebugger)
  Pry.config.commands.alias_command 'c', 'continue'
  Pry.config.commands.alias_command 's', 'step'
  Pry.config.commands.alias_command 'n', 'next'
  Pry.config.commands.alias_command 'f', 'finish'
end
