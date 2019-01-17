# Homebrew
export PATH=PATH=/usr/local/bin:/usr/local/sbin:$PATH

# gls (brew install coreutils)
alias ls='gls --color=auto -AF'

# Set LS_COLORS for gls
eval $(gdircolors ~/Documents/iTerm/dircolors-solarized/dircolors.ansi-universal)

# zsh の補完候補にも色を付ける
# LS_COLORS を補完に対応させる
# via: http://qiita.com/yuyuchu3333/items/84fa4e051c3325098be3
if [ -n "$LS_COLORS" ]; then
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi
