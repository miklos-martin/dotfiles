# ZSH Theme - Preview: http://cl.ly/350F0F0k1M2y3A2i3p1S
local ret_status="%(?:%{$fg[yellow]%}λ %{$fg[cyan]%}ᕕ( ᐛ %)ᕗ:%{$fg[red]%}λ %{$fg[cyan]%}¯\_(ツ%)_/¯)"
PROMPT='${ret_status}%{$reset_color%} %~/ $(git_prompt_info)%'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
