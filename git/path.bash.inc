source="${BASH_SOURCE[0]}"
git_directory=$(cd $(dirname $source) && pwd)
git_bin="$git_directory/bin"
export PATH="${PATH}:$git_bin"
