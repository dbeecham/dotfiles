if (( C == 256 )); then
#	autoload spectrum && spectrum
	autoload colors && colors
fi

if (( C == 8 )); then
	autoload colors && colors
fi

#function zle-line-init zle-keymap-select {
#    RPS1="${${KEYMAP/vicmd/[ INSERT ]}/(main|viins)/}"
#    zle reset-prompt
#}

#zle -N zle-line-init
#zle -N zle-keymap-select

chpwd() {
	ls --color -F
	echo
}

ppid () { ps -p ${1:-$$} -o ppid=; }
