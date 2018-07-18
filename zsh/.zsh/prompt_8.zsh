PROMPT_ROOT="%{$fg_bold[red]%}@%{$reset_color%}"
PROMPT_ERROR="%(?..[%{$fg_bold[red]%}%?%{$reset_color%}])"
PROMPT_CWD="%30<...<%~%<<"
PROMPT_ENDBRACKET="%#"

HOST_IDENTIFIER="%{$fg_bold[blue]%}#%{$reset_color%}"

if [[ `whoami` == "root" ]]; then
    PROMPT="
$PROMPT_ERROR($PROMPT_ROOT$HOST_IDENTIFIER) $PROMPT_CWD $PROMPT_ENDBRACKET "
else
    PROMPT="
$PROMPT_ERROR($HOST_IDENTIFIER) $PROMPT_CWD $PROMPT_ENDBRACKET "
fi
