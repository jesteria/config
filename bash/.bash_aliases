alias ll='ls -ahlF'

alias lslast='ls -tr'

function xlast {
    local directory="${1:-.}"
    [ -d $directory ] || {
        echo "$directory is not a directory"
        return 2
    }

    local offset="${2:-0}"
    local pattern="^[0-9]+$"
    [[ "$offset" =~ $pattern ]] || {
        echo "$offset is not a numeric offset"
        return 2
    }

    ls -tr1 "$directory" | tail -$((offset+1)) | head -1 | xargs -I {} xdg-open "$directory/{}"
}

alias xopen=xdg-open

alias pose='docker-compose'
