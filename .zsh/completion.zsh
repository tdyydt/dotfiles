# -- zsh-completions --
# (brew install zsh-completions)
# additional completion definitions for zsh
# e.g.) sub-commands of git

# Note: '/usr/local/share/zsh/site-functions' was in $fpath, by default
fpath=(/usr/local/share/zsh-completions $fpath)

# -- Completion

# activate completion
autoload -Uz compinit
compinit -u

# 補完リストを詰めて表示
setopt list_packed
# ディレクトリ選択時に最後の/を残す
setopt no_auto_remove_slash

# Ignore case in completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 候補のハイライト・矢印キーで候補選択
zstyle ':completion:*:default' menu select=2

# キャッシュの使用 (?)
zstyle ':completion:*' use-cache true

# auto rehash
# (e.g. when installing a command in another window.)
zstyle ':completion:*' rehash true

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
