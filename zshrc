# --- AI agent early return ---
if [[ -n "$CLAUDECODE" || -n "$CODEX_SANDBOX" ]]; then
  export PAGER=cat
  export GIT_PAGER=cat
  export GH_PAGER=cat
  export NO_COLOR=1
  export GIT_TERMINAL_PROMPT=0
  export GH_PROMPT_DISABLED=1
  return
fi

# --- Human-only settings below ---

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

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# History search keybindings
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "^r" history-incremental-search-backward
bindkey "^s" history-incremental-search-forward

# direnv
eval "$(direnv hook zsh)"

# Alias
alias ls="ls -G"
alias ll="ls -la"
alias la="ls -A"
alias mkdir="mkdir -p"
alias grep="grep --color=auto"
alias diff="diff -u --color=auto"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# gcloud completion
if [ -f '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc'; fi

# Context7
export CONTEXT7_API_KEY=$(security find-generic-password -s "CONTEXT7_API_KEY" -w 2>/dev/null)

# tmux: attach or create session named after current directory
# t     -> 3 panes (even-vertical)
# t 6   -> 6 panes (3x2 tiled)
t() {
  if [[ -n "$TMUX" ]]; then
    echo "Already inside tmux" >&2
    return 1
  fi
  if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    tmux new-session
    return
  fi
  local base=$(basename "$(git rev-parse --show-toplevel)")
  local name="$base"
  local i=2
  while tmux has-session -t "=$name" 2>/dev/null; do
    name="${base}-${i}"
    ((i++))
  done
  local panes=${1:-3}
  tmux new-session -d -s "$name"
  if [[ "$panes" == "6" ]]; then
    tmux split-window -v -t "$name"
    tmux split-window -v -t "$name"
    tmux select-layout -t "$name" even-vertical
    tmux select-pane -t "$name:0.0" && tmux split-window -h -t "$name"
    tmux select-pane -t "$name:0.2" && tmux split-window -h -t "$name"
    tmux select-pane -t "$name:0.4" && tmux split-window -h -t "$name"
    tmux select-layout -t "$name" tiled
  else
    tmux split-window -v -t "$name"
    tmux split-window -v -t "$name"
    tmux select-layout -t "$name" even-vertical
  fi
  tmux select-pane -t "$name:0.0"
  tmux attach -t "$name"
}
