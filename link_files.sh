#!/bin/bash

# Link files:

# read each line in files.txt to $file
while read file; do
    src="$(pwd)/$file"
    dst="$HOME/$file"
    # if file exists in dst position, ignore it.
    if [ -f "$dst" ] ; then
        echo "Ignored: $dst already exists."
    else
        # `set -x` to display executed commands
        # via: https://stackoverflow.com/questions/13195655/bash-set-x-without-it-being-printed
        (set -x ; ln -s $src $dst)
    fi
done < files.txt
