FROM=$(echo $SSH_CONNECTION | cut -f1 -d' ')
TO=$(echo $SSH_CONNECTION | cut -f3 -d' ')

if [ "" != "$TO" ]; then
    SSH_STRING="%{$fg_bold[blue]%}$FROM %{$fg[red]%}=> %{$fg_bold[blue]%}$TO%{$reset_color%}"
fi

PROMPT='%{$fg[blue]%}%D{%H:%M:%S} %{$reset_color%}'
PROMPT=$'%B┌─[%b %{$fg_bold[green]%}%n@%m %{$fg[white]%}%~%{$reset_color%} $(git_prompt_info)$SSH_STRING %B]\
└─>%b '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
