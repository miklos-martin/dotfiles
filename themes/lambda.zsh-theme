# ZSH Theme - Preview: http://cl.ly/350F0F0k1M2y3A2i3p1S
local ret_status="%(?:%{$fg[yellow]%}λ :%{$fg[red]%}λ )%{$reset_color%}"
PROMPT='${ret_status} %~/ $(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
