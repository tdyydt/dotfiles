## PATH
export PATH
# Path for Homebrew (only for Mac ??)
PATH=/usr/local/bin:/usr/local/sbin:$PATH
PATH=$PATH:~/dotfiles/.zsh.d/script
PATH=$PATH:~/.cabal/bin

# $PATH の重複を削除
typeset -U path PATH

# lang
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

## opam
eval `opam config env`
