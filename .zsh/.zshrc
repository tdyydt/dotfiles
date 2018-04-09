# en
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'


# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
# alias

alias grep='grep --color'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# use colordiff as diff, if exists
# via: http://stackoverflow.com/questions/7522712/how-to-check-if-command-exists-in-a-shell-script
if type colordiff &> /dev/null; then
    alias diff='colordiff -u'
fi


# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

# echo 等でも色を使用出来るようにする
# via: http://qiita.com/mollifier/items/40d57e1da1b325903659
autoload -Uz colors
colors

## keybinds like Emacs
bindkey -e

## Redo ??
# bindkey "" redo

## history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

## 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=-_;@:{},|"
zstyle ':zle:*' word-style unspecified


# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
# Completion

# zsh-completions: (brew install)
# additional completion definitions for zsh
# e.g.) sub-commands of git, ...

# Note: '/usr/local/share/zsh/site-functions'
# はデフォルトで $fpath にあった。
fpath=(/usr/local/share/zsh-completions $fpath)

# activate completion
autoload -Uz compinit
# compinit
# zsh-completions の関連。insecure とかいうエラーを出なくする。
compinit -u

# ignore case in completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# ../ の後は今いるディレクトリを補完しない
# TODO: seems not working
zstyle ':completion:*' ignore-parents parent pwd ..
# sudo の後ろでコマンド名を補完する
# zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
#                    /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


# auto rehash
zstyle ':completion:*' rehash true

# 補完を詰めて表示
# setopt list_packed

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
## Prompt
## %n : user
## %m : host
## %~ : path of current directory
PROMPT="%F{magenta}%n%f@%F{yellow}%m%f %~
%# "
# PROMPT="%F{magenta}%n%f@%F{yellow}%m%f [%D{%m/%d %H:%M}] %~
# %# "

## %F{color} : change color
## %f : reset color ??
## preferable colors: green, magenta

## VCS or Git
# show status on right prompt

autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg


# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
# options
# 日本語ファイル名を表示可能にする
# setopt print_eight_bit

setopt no_beep
# C-s が効かないのを、修正する。
# via: http://www.softantenna.com/wp/unix/zsh-history-search/
setopt no_flow_control

setopt ignore_eof               # do not exit with C-d
setopt interactive_comments

# ディレクトリ名だけで cd
# setopt auto_cd

# automatically pushd, after cd
# cd history by "cd -[TAB]"
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# コマンド名を間違えた時に、近い名前のコマンドを教えてくれる。
# setopt correct

# 同時に起動した zsh の間で history を共有する
setopt share_history
# 同じコマンドを history に残さない
setopt hist_ignore_all_dups
# スペースから始まるコマンド行は history に残さない
setopt hist_ignore_space
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
# setopt extended_glob

# ワイルドカード展開時に、いっぺんに全て展開しない
# 1つずつ提案するような挙動に
# via: http://superuser.com/questions/402989/how-do-i-get-zshs-autocomplete-to-complete-wildcards-like-bash-does
setopt glob_complete

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
# keybind

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする？
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

# sudo の後のコマンドでエイリアスを有効にする ?
# alias sudo='sudo '

# TODO:
# rlwrap の次にコマンド補完を有効にして欲しい！
# rlwrap rack [TAB]
# で racket が出ない！


# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
# others

# delete odd escape sequence in tex shell (?)
# via: https://github.com/syl20bnr/spacemacs/issues/3035
if [ -n "$INSIDE_EMACS" ]; then
    #export EDITOR=emacsclient
    unset zle_bracketed_paste  # This line
fi


## opam switch
eval `opam config env`
## OPAM configuration
. ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

## cabal
export PATH=$PATH:~/.cabal/bin


case ${OSTYPE} in
  darwin*)                      # mac
      . $ZDOTDIR/.zshrc.mac
      ;;
  linux*)                       # Ubuntu
      . $ZDOTDIR/.zshrc.linux
      ;;
esac
