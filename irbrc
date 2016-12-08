# Auto indent on
IRB.conf[:AUTO_INDENT] = true

# Enable Autocompletion
require 'irb/completion'

# Save command history
IRB.conf[:SAVE_HISTORY] = 10000

# Use vim in irb
require 'rubygems'
require 'interactive_editor'

# Awesomeprint
require 'awesome_print'
AwesomePrint.defaults = {
  indent: 2
}
AwesomePrint.irb!
