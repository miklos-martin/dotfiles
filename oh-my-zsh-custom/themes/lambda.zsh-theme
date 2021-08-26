nix_info () {
  if [[ -n "$IN_NIX_SHELL" ]]; then
      echo "nix> "
  fi
}

local ret_status="%(?:%{$fg[yellow]%}λ %{$fg[cyan]%}ᕕ( ᐛ %)ᕗ:%{$fg[red]%}λ %{$fg[cyan]%}¯\_(ツ%)_/¯)"
PROMPT='$(nix_info)${ret_status}%{$reset_color%} %~/ %{$fg[yellow]%}$(tf_prompt_info)%{$reset_color%} $(git_prompt_info)%'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
