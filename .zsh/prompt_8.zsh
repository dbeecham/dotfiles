PROMPT_ROOT="%{$fg_bold[black]%}<%{$fg_bold[yellow]%}root%{$fg_bold[black]%}>"
PROMPT_HOSTNAME="%{$fg_bold[black]%}(%{$fg_bold[yellow]%}%m%{$fg_bold[black]%})"
PROMPT_ERROR="%(?.. %{$fg_bold[black]%}[%{$fg_bold[red]%}%?%{$fg_bold[black]%}])"
PROMPT_CWD="%{$fg_bold[black]%}[%{$fg_bold[white]%}%30<...<%~%{$fg_bold[black]%}]"
PROMPT_ENDBRACKET="%{$fg_bold[yellow]%}>"

if [[ `whoami` == "root" ]]; then
	PROMPT="$PROMPT_ERROR $PROMPT_ROOT $PROMPT_HOSTNAME $PROMPT_CWD $PROMPT_ENDBRACKET %{$reset_color%}"
else
	PROMPT="$PROMPT_ERROR $PROMPT_HOSTNAME $PROMPT_CWD $PROMPT_ENDBRACKET %{$reset_color%}"
fi
