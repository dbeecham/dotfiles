function _go_home {
    if test "$BUFFER" = ""; then
        echo
        cd
    else
        BUFFER="${BUFFER}gh"
        CURSOR=$(($CURSOR+2))
    fi
}
zle -N _go_home
bindkey 'gh' _go_home

function _mycd {
    if test "$BUFFER" = ""; then
        echo "abc";
    else
        echo "def";
    fi
}
zle -N _mycd
bindkey ',g' _mycd
