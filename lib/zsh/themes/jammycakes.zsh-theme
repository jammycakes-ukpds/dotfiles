local ret_status="%(?:%{$fg_bold[green]%} :%{$fg_bold[red]%}%? )"

PROMPT='%B%F{green}%n %F{yellow}%~$(git_prompt_info)${ret_status}'$'\n''%F{blue}%h %f%b$ '


ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[magenta]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=") %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=")"
