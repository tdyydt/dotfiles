#!/bin/bash

# None of dst files should exist.
# (You should move these files before running this script.)
# If exists, print these files, and exit without doing anything.

any_file_already_exists=false

while read file; do
    dst="$HOME/$file"
    # if file exists in dst position:
    if [ -f "$dst" ] ; then
        # if that file is the first one:
        if [ "$any_file_already_exists" = false ]; then
            echo "The following files already exist:"
            any_file_already_exists=true
        fi
        echo "$dst"
    fi
done < files.txt

if [ "$any_file_already_exists" = true ] ; then
    echo "Link files: failed."
    exit 1
fi

# Link files:
echo "Link files: start."

# read each line in files.txt to $file
while read file; do
    src="$(pwd)/$file"
    dst="$HOME/$file"
    set -x                      # enable printing commands
    ln -s $src $dst
    set +x                      # disable printing
done < files.txt
