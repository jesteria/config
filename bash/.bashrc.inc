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

# Tmux TERM
# Necessary?
# [ -n "$TMUX" ] && TERM=screen-256color-bce

DOTFILES_ROOT=$(dirname $(cd $(dirname "${BASH_SOURCE[0]}") && pwd))


#
# Includes
#

source "$DOTFILES_ROOT"/git/path.bash.inc

# . /opt/google/google-cloud-sdk/path.bash.inc
# . /opt/google/google-cloud-sdk/completion.bash.inc


#
# App set-up
#

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# direnv
eval "$(direnv hook bash)"
