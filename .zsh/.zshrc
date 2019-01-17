# configurations not written in .zshenv

# Emacs-like keybinds
bindkey -e
# do not exit with C-d
setopt ignore_eof

setopt no_beep

# C-s が効かないのを修正
# via: http://www.softantenna.com/wp/unix/zsh-history-search/
setopt no_flow_control

setopt interactive_comments

# コマンド名を間違えた時に、近い名前のコマンドを教えてくれる。
# setopt correct

# 日本語ファイル名を表示可能にする
# setopt print_eight_bit

# echo 等でも色を使用 (?)
# via: http://qiita.com/mollifier/items/40d57e1da1b325903659
autoload -Uz colors
colors

# change dir only with directory name (without cd)
# setopt auto_cd


## -- pushd

# automatically pushd, after cd
# View history by: `cd - [TAB]` or `dirs -v`
setopt auto_pushd
# don't push duplicate directories
setopt pushd_ignore_dups


## -- expand

# Use rich wildcard features (?)
# setopt extended_glob

# ワイルドカード展開時に、いっぺんに全て展開しない (1つずつ提案させる)
# via: http://superuser.com/questions/402989/how-do-i-get-zshs-autocomplete-to-complete-wildcards-like-bash-does
setopt glob_complete


## -- 単語区切り

autoload -Uz select-word-style
select-word-style default
# 単語の区切り文字を指定
zstyle ':zle:*' word-chars " /=-_;@:{},|"
zstyle ':zle:*' word-style unspecified


## -- emacs shell

# delete odd escape sequence inside emacs (e.g. tex shell)
# via: https://github.com/syl20bnr/spacemacs/issues/3035
if [ -n "$INSIDE_EMACS" ]; then
    #export EDITOR=emacsclient
    unset zle_bracketed_paste  # This line
fi


## --- Load files ---

. $ZDOTDIR/alias.zsh
. $ZDOTDIR/completion.zsh
. $ZDOTDIR/history.zsh
. $ZDOTDIR/prompt.zsh

case ${OSTYPE} in
  darwin*)                      # mac
      . $ZDOTDIR/darwin.zsh
      ;;
  linux*)                       # Ubuntu
      . $ZDOTDIR/linux.zsh
      ;;
esac
