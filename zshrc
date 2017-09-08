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

# zsh history
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=5000000
export SAVEHIST=5000000
setopt share_history
setopt append_history
setopt extended_history
setopt inc_append_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_expand
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "^r" history-incremental-search-backward
bindkey "^s" history-incremental-search-forward

# ctags
alias ctags="`brew --prefix`/bin/ctags"

# go
export GOPATH="$HOME/.go"

# rbenv
eval "$(rbenv init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

# yarn
export PATH="$PATH:`yarn global bin`"

# hub command
eval "$(hub alias -s)"

# Locale
export LC_CTYPE="ja_JP.UTF-8"

# Android SDK
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# heroku toolbelt
export PATH="$PATH:/usr/local/heroku/bin"

# Postgres
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"

# The next line updates PATH for the Google Cloud SDK.
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"

# The next line enables zsh completion for gcloud.
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# Applications Alias
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias diff="diff -u"
