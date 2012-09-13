# Stop some apparently interactive shells such as scp and rcp.
if [[ $- != *i* ]] ; then
    return
fi

B=~/.bash

source $B/environment.bash
source $B/functions.bash
source $B/prompt.bash
source $B/aliases.bash
