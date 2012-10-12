function cd() {
    if [ "$*" == "" ]; then
        builtin cd ~ && ls --color -F --group-directories-first
    else
        builtin cd "$*" && ls --color -F --group-directories-first
    fi
}

short_pwd() {
    cwd=$(pwd)

    if [ $cwd == $HOME ]; then echo -n "~"; return; fi
    if [ $cwd == "/" ]; then echo -n "/"; fi

    for l in $(echo $cwd | tr "/" "\n"); do
        echo -n "/"
        echo -n ${l:0:1}
    done
    echo -n ${l:1}
}
