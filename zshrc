#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# vim
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"

# rbenv
eval "$(rbenv init -)"

# hub command
eval "$(hub alias -s)"

# heroku toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Postgres
export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

# MySQL
export PATH="/usr/local/mysql/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
source "${ZDOTDIR:-$HOME}/google-cloud-sdk/path.zsh.inc"

# The next line enables zsh completion for gcloud.
source "${ZDOTDIR:-$HOME}/google-cloud-sdk/completion.zsh.inc"