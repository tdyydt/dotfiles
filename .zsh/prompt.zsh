## -- Prompt

## %D{%m/%d %H:%M}

# PROMPT="%F{magenta}%n%f@%F{yellow}%m%f %~
# %# "
PROMPT="${fg_bold[magenta]}%n${reset_color}@${fg_bold[yellow]}%m${reset_color} %~
%# "

## %n : user
## %m : host
## %~ : path of current directory
## %F{color} : change color
## %f : reset color ??
## Preferable colors: green, magenta

## -- Show VCS status on right prompt

autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg
