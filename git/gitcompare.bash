#!/bin/bash

function commits() {
    if [ -z "$2" ]
    then
        echo $1: none
	return
    fi

    echo -e "========\n$1\n========\n"
    printf "$2\n\n"
}

echo -e "compare $1\n"

incoming=$(git log ..$1)
outgoing=$(git log $1..)

commits incoming "$incoming"
[[ "$incoming" || "$outgoing" ]] && echo ""
commits outgoing "$outgoing"
