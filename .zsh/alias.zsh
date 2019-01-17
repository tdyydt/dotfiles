# alias

alias grep='grep --color'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ll='ls -l'

# C++
alias gpp='g++ -std=c++14 -Wall'

# if exists
# via: http://stackoverflow.com/questions/7522712/how-to-check-if-command-exists-in-a-shell-script

# use colordiff as diff
if type colordiff &> /dev/null; then
    alias diff='colordiff -u'
fi

# rlwrap
if type rlwrap > /dev/null; then
    alias ocaml='rlwrap ocaml'
    alias maxima='rlwrap maxima'
fi

# sudo の後で alias を有効にする
# alias sudo='sudo '
