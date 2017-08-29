local ret_status="%(?:%{$fg_bold[green]%}[OK]:%{$fg_bold[red]%}[%?])"

PROMPT='%B%{${ret_status}%} %F{yellow}%~$(git_prompt_info)'$'\n''%F{cyan}%n %F{blue}%h %f%b$ '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[magenta]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=") %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=")"
