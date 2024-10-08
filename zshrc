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

export EDITOR=vim
export VISUAL=vim

# go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin":$PATH

# Locale
export LC_CTYPE="ja_JP.UTF-8"

# Android SDK
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# heroku toolbelt
export PATH="$PATH:/usr/local/heroku/bin"

# kubernetes
export KUBECONFIG="$HOME/.kube/config:$HOME/.kube/config-kyc"

# Postgres
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"

# MySQL
export PATH="$PATH:/usr/local/opt/mysql@5.7/bin"

# The next line updates PATH for the Google Cloud SDK.
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"

# The next line enables zsh completion for gcloud.
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# Applications Alias
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias diff="diff -u"

. /opt/homebrew/opt/asdf/libexec/asdf.sh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# Shopify Hydrogen alias to local projects
alias h2='$(npm prefix -s)/node_modules/.bin/shopify hydrogen'export PATH="/opt/homebrew/opt/mysql-client@8.0/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"

# direnv
eval "$(direnv hook zsh)"

. /opt/homebrew/opt/asdf/libexec/asdf.sh
