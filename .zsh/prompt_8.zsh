PROMPT_ERROR="%(?.. %{$fg_bold[black]%}[%{$fg_bold[red]%}%?%{$fg_bold[black]%}])"
PROMPT_CWD="%{$fg_bold[black]%}[%30<...<%~]"
PROMPT_ENDBRACKET="%{$fg_bold[yellow]%}>"
PROMPT="$PROMPT_ERROR $PROMPT_CWD $PROMPT_ENDBRACKET %{$reset_color%}"
