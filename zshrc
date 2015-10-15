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

# vim
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"

# pyenv
eval "$(pyenv init -)"
# rbenv
eval "$(rbenv init -)"
# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# direnv
eval "$(direnv hook zsh)"

# hub command
eval "$(hub alias -s)"

# Locale
export LC_CTYPE="ja_JP.UTF-8"

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
