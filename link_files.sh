#!/bin/bash

# bash -x or set -x
# 実行されたコマンドの表示

# for file in files; do
#     # ln -s [src] [dst]
#     ln -s "$(pwd)/$file" "$HOME/$file"
# done

# files.txt の各行のファイルを $file に読む
while read file; do
    set -x
    ln -s "$(pwd)/$file" "$HOME/$file"
    set +x
done < files.txt
