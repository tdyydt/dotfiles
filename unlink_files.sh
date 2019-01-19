#!/bin/bash

# Unlink files:

while read file; do
    # `set -x` to display executed commands
    (set -x ; unlink "$HOME/$file")
done < files.txt
