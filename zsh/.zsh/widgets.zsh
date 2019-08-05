# I never use these, and they just get in the way. They are cool though, and I might
# improve them in the future.
#
#function _go_home {
#    if test "$BUFFER" = ""; then
#        echo
#        cd
#    else
#        BUFFER="${BUFFER}gh"
#        CURSOR=$(($CURSOR+2))
#    fi
#}
#zle -N _go_home
#bindkey 'gh' _go_home
#
#function _mycd {
#    if test "$BUFFER" = ""; then
#        echo "abc";
#    else
#        echo "def";
#    fi
#}
#zle -N _mycd
#bindkey ',g' _mycd
