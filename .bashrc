# Stop some apparently interactive shells such as scp and rcp.
if [[ $- != *i* ]] ; then
    return
fi

source ~/.bash/environment.bash
source ~/.bash/functions.bash
source ~/.bash/aliases.bash
