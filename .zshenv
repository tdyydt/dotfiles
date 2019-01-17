# en
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

## -- PATH

# cabal
export PATH=$PATH:~/.cabal/bin

# opam switch
eval $(opam env)
# opam config
. ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# ruby
if type rbenv > /dev/null; then
    eval "$(rbenv init -)"
fi

## -- Load $ZDOTDIR/.zshrc
export ZDOTDIR=$HOME/.dotfiles/.zsh
