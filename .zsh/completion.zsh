# Completion

# zsh-completions: (brew install)
# additional completion definitions for zsh
# e.g.) sub-commands of git, ...

# Note: '/usr/local/share/zsh/site-functions' was in $fpath, by default
fpath=(/usr/local/share/zsh-completions $fpath)

# activate completion
autoload -Uz compinit
compinit -u

# ignore case in completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# ../ の後は今いるディレクトリを補完しない (seems not working??)
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
# zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
#                    /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# auto rehash
# (e.g. when installing a command in another window.)
zstyle ':completion:*' rehash true

# 補完を詰めて表示
# setopt list_packed
