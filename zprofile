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
