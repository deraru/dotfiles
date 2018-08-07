# shortcut
alias ll='ls -l'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

# rbenv
eval "$(rbenv init -)"

# yarn
export PATH="$PATH:`yarn global bin`"

# go
export PATH="$HOME/.go/bin":$PATH

# hub command
eval "$(hub alias -s)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Postgres
export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
source "/opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc"

# The next line enables bash completion for gcloud.
source "/opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc"
