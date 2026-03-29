# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Browser
export BROWSER='open'

# Language
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# Less
export LESS='-g -i -M -R -S -w -X -z-4'
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# Editor
export EDITOR=vim
export VISUAL=vim

# Locale
export LC_CTYPE="ja_JP.UTF-8"

# PATH
export GOPATH="$HOME/go"
export ASDF_DATA_DIR="$HOME/.asdf"

path=(
  $HOME/.antigravity/antigravity/bin
  $HOME/.local/bin
  $ASDF_DATA_DIR/shims
  $GOPATH/bin
  /opt/homebrew/opt/libpq/bin(N)
  /opt/homebrew/opt/mysql-client@8.0/bin
  /opt/homebrew/share/google-cloud-sdk/bin
  $path
)
