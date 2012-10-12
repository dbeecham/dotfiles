alias ls="ls --color -F --group-directories-first"
alias lsof="lsof -Pn"
alias rm="rm -v"
alias mv="mv -v"
alias ps="ps af -o pid,user,tty,command"

if test $DIST == "arch"; then
    alias add="packer -S"
    alias del="$PACMAN -Rs"
    alias search="packer -Ss"
    alias info="packer -Si"
elif test $DIST == "gentoo"; then
    alias add="emerge"
    alias del="emerge --unmerge"
    alias search="qsearch"
    alias info="emerge --info"
elif test $DIST == "alpine"; then
    alias add="apk add"
    alias del="apk del"
    alias search="apk search"
    alias info="apk info"
    # IS ALPINE AWESOME OR WHAT?!
fi
