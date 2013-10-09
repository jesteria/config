#!/bin/bash

echo -e "compare $1\n"

incoming=$(git log ..$1)
outgoing=$(git log $1..)

[ -z $incoming ] && incoming=none
echo incoming: $incoming

[ -z $outgoing ] && outgoing=none
echo outgoing: $outgoing
