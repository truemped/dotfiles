PROMPT=$'
%{$fg[blue]%}%c%{$reset_color%} $(git_prompt_info)%{$fg[grey]%}[%n@%m]%{$reset_color%} %{$fg[grey]%}[%T]%{$reset_color%}
%{$fg[black]%}>%{$reset_color%} '

PROMPT2="%{$fg[black]%}%_> %{$reset_color%}"

GIT_CB="git::"
ZSH_THEME_SCM_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_PREFIX=$ZSH_THEME_SCM_PROMPT_PREFIX$GIT_CB
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
