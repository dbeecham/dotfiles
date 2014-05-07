if (( C == 256 )); then
#	autoload spectrum && spectrum
	autoload colors && colors
    export TERM=xterm-256color
fi

if (( C == 8 )); then
	autoload colors && colors
fi

chpwd() {
    CURDIR="$(pwd | awk -F '/' '{print $(NF)}' )"
	ls --color -F
	echo
}
