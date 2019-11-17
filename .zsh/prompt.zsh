## -- Show VCS status (git branch)

autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

setopt PROMPT_SUBST
add-zsh-hook precmd vcs_info


## -- Prompt

# single quote (not double) for vcs_info to work!!
PROMPT='${fg_bold[magenta]}%n${reset_color}@${fg_bold[yellow]}%m${reset_color} %~ ${vcs_info_msg_0_}
%# '

## %n : user
## %m : host
## %~ : path of current directory
## %F{color} : change color
## %f : reset color ??
## Preferable colors for me: green, magenta
## %D{%m/%d %H:%M}
