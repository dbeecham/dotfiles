if (( C == 256 )); then
#	autoload spectrum && spectrum
	autoload colors && colors
fi

if (( C == 8 )); then
	autoload colors && colors
fi

chpwd() {
	ls --color -F
	echo
}
