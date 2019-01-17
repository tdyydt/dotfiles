## history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# share history, among the shells working simultaneously
setopt share_history
# don't add same commands in history
setopt hist_ignore_all_dups
# don't add commands beginning with space character, in history
setopt hist_ignore_space
# reduce redundant whitespaces when adding to history
setopt hist_reduce_blanks


# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする？
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
