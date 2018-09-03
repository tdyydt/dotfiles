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
        set -x                  # enable printing commands
        ln -s $src $dst
        set +x                  # disable printing
    fi
done < files.txt
