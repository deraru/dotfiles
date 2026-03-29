# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Homebrew (static — avoids ~22ms eval on every shell startup)
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
path=(/opt/homebrew/bin /opt/homebrew/sbin $path)
[ -z "${MANPATH-}" ] || export MANPATH=":${MANPATH#:}"
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"

# Editor
export EDITOR=vim
export VISUAL=vim

# Language
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi
export LC_CTYPE="ja_JP.UTF-8"

# PATH
export ASDF_DATA_DIR="$HOME/.asdf"

path=(
  $ASDF_DATA_DIR/shims
  /opt/homebrew/opt/libpq/bin(N)
  /opt/homebrew/opt/mysql-client@8.0/bin
  /opt/homebrew/share/google-cloud-sdk/bin
  $path
)

# --- AI agent early return ---
if [[ -n "$CLAUDECODE" || -n "$CODEX_SANDBOX" || -n "$CODEX_CI" ]]; then
  return
fi

# --- Human-only (login) settings below ---
path=($HOME/.antigravity/antigravity/bin $path)
export BROWSER='open'
export LESS='-g -i -M -R -S -w -X -z-4'
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi
