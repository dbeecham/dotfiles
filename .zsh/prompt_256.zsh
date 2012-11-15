PROMPT_ROOT="%{$fg_bold[red]%}@"
PROMPT_ERROR="%(?..%{$fg_bold[white]%}[%{$fg_bold[red]%}%?%{$fg_bold[white]%}])"
PROMPT_CWD="%{$fg_bold[white]%}%30<...<%~"
PROMPT_ENDBRACKET="%{$fg_bold[white]%}%#"

HOST_IDENTIFIER="%{$fg_bold[blue]%}#"

if [[ `whoami` == "root" ]]; then
    PROMPT="
$PROMPT_ERROR%{$fg_bold[white]%}($PROMPT_ROOT$HOST_IDENTIFIER%{$fg_bold[white]%}) $PROMPT_CWD $PROMPT_ENDBRACKET "
#   PROMPT="$PROMPT_ERROR $PROMPT_ROOT $PROMPT_HOSTNAME $PROMPT_CWD $PROMPT_ENDBRACKET %{$reset_color%}"
else
    PROMPT="
$PROMPT_ERROR%{$fg_bold[white]%}($HOST_IDENTIFIER%{$fg_bold[white]%}) $PROMPT_CWD $PROMPT_ENDBRACKET "
    #PROMPT="$PROMPT_ERROR $PROMPT_HOSTNAME $PROMPT_CWD $PROMPT_ENDBRACKET %{$reset_color%}"
fi
