PROMPT_ROOT="%{$fg_bold[black]%}<%{$fg_bold[yellow]%}root%{$fg_bold[black]%}>"
PROMPT_HOSTNAME="%{$fg_bold[black]%}(%{$fg_bold[yellow]%}infect%{$fg_bold[black]%})"
PROMPT_ERROR="%(?.. %{$fg_bold[black]%}[%{$fg_bold[red]%}%?%{$fg_bold[black]%}])"
PROMPT_CWD="%{$fg_bold[black]%}[$fg_bold[white]%30<...<%~$fg_bold[black]]"
PROMPT_ENDBRACKET="%{$fg_bold[yellow]%}>"
PROMPT="$PROMPT_ERROR $PROMPT_HOSTNAME $PROMPT_CWD $PROMPT_ENDBRACKET %{$reset_color%}"
