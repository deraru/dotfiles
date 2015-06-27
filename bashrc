# shortcut
alias ll='ls -l'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

# pyenv
eval "$(pyenv init -)"
# rbenv
eval "$(rbenv init -)"

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
