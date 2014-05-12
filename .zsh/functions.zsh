if (( C == 256 )); then
#	autoload spectrum && spectrum
	autoload colors && colors
    export TERM=xterm-256color
fi

if (( C == 8 )); then
	autoload colors && colors
fi

chpwd() {
	ls --color -F
	echo
}

o() {
    if test -z $1; then
        cd
        return
    fi
    if test -d $1; then
        cd $1
        return
    fi
    vim $1
}
