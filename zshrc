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

# pyenv
eval "$(pyenv init -)"
# rbenv
eval "$(rbenv init -)"
# nodenv
eval "$(nodenv init -)"

# hub command
eval "$(hub alias -s)"

# heroku toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Postgres
export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
source "/opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"

# The next line enables zsh completion for gcloud.
source "/opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# Applications Alias
alias chrome="open -a Google\ Chrome"
