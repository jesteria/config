source="${BASH_SOURCE[0]}"
git_directory=$(cd $(dirname $source) && pwd)
git_bin="$git_directory/bin"
if [[ ":$PATH:" != *":$git_bin:"* ]]; then
  export PATH="${PATH}:$git_bin"
fi
