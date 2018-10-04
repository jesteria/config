#
# include bin in PATH
#
source="${BASH_SOURCE[0]}"
git_directory=$(cd $(dirname $source) && pwd)
git_bin="$git_directory/bin"

if [[ ":$PATH:" != *":$git_bin:"* ]]; then
  export PATH="${PATH}:$git_bin"
fi

unset source git_directory git_bin

#
# tab-completion for scripts in bin
#
function _git_compare {
    __gitcomp_nl "$(__git_refs)"
}
