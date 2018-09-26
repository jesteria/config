#
# Functions
#

# FIXME: joinparam or join_by?
function joinparam {
    # $1 is sep
    # $2... are the elements to join
    local sep=$1 ret=$2
    shift 2 || shift $(($#))
    printf "%s" "$ret${@/#/$sep}"
}

function join_by {
  local IFS="$1"
  shift
  echo "$*"
}

function contains {
  local item
  for item in "${1[@]}"
  do
    [ "$item" = "$2" ] && return 0
  done
  return 1
}

# 1Pass CLI
# my-signin() {
#   eval $(op signin my)
# }
#
# clip-private() {
#   [ -z "$OP_SESSION_my" ] && my-signin
#   op get item "private directory" | jq -r '.details.password' | xsel -ib
# }


#
# Exports
#

export EDITOR=vim
export GPGKEY=29D00FD4

true_source=$(readlink -f "${BASH_SOURCE[0]}")

export DOTFILES_ROOT=$(dirname $(dirname $true_source))

unset true_source

if [[ ! ":$PATH:" =~ :"$HOME"/.local/bin/?: ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

if [[ ! ":$PATH:" =~ :"$HOME"/bin/?: ]]; then
  export PATH="$HOME/bin:$PATH"
fi

#
# Includes
#

source "$DOTFILES_ROOT"/git/path.bash.inc

if [ -d /opt/google/cloud ]; then
  . /opt/google/cloud/path.bash.inc
  . /opt/google/cloud/completion.bash.inc
fi


#
# App set-up
#

# pyenv
if [ -d "$HOME/.pyenv/bin" ]; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# direnv
if $(command -v direnv &> /dev/null); then
  eval "$(direnv hook bash)"
fi
