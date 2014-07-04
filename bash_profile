if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# The next line updates PATH for the Google Cloud SDK.
source "${ZDOTDIR:-$HOME}/google-cloud-sdk/path.bash.inc"

# The next line enables bash completion for gcloud.
source "${ZDOTDIR:-$HOME}/google-cloud-sdk/completion.bash.inc"
