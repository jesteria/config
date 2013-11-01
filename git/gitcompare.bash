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

if [ -z "$1" ]
then
    ref=$(git symbolic-ref HEAD)
    ref=origin/${ref##refs/heads/}
else
    ref="$1"
fi

echo -e "compare $ref\n"

incoming=$(git log ..$ref)
outgoing=$(git log $ref..)

commits incoming "$incoming"
[[ "$incoming" || "$outgoing" ]] && echo ""
commits outgoing "$outgoing"
