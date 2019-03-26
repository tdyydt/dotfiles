# primary configurations including PATH

# en
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

## -- PATH --

# Homebrew
if [[ "$OSTYPE" == "darwin"* ]]; then
    export PATH=/usr/local/bin:/usr/local/sbin:$PATH
fi

# cabal
export PATH=$PATH:~/.cabal/bin

# opam
if type opam > /dev/null; then
    # eval $(opam env)
    eval `opam config env`      # old?
    . ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
fi

# ruby
if type rbenv > /dev/null; then
    eval "$(rbenv init -)"
fi

# Go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

## -- Load $ZDOTDIR/.zshrc
export ZDOTDIR=$HOME/.dotfiles/.zsh
