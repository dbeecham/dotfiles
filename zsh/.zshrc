source ~/.zsh/setup.zsh
source ~/.zsh/environment.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/widgets.zsh
#source ~/.zsh/prompt_256.zsh
#source ~/.zsh/ohmy.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/binds.zsh


# This file contains some private variables I use; I currently expect these
# variables:
#  * $PLUSPOLE_NATSD_HOST
#  * $PLUSPOLE_NATSD_PORT
#  * $PLUSPOLE_NATSD_USER
#  * $PLUSPOLE_NATSD_PASS
#  * $PUSHOVER_API_TOKEN
#  * $PUSHOVER_USER_KEY
if test -r ~/.zsh/private.zsh; then
	source ~/.zsh/private.zsh
fi

# I never got around to learn fasd, and when I'm not using it, it just slows
# down my shell. Some day, I'll learn how fasd works and actually use it.
#source ~/.zsh/fasd.zsh

source ~/.zsh/zsh-histdb/sqlite-history.zsh

source ~/.zsh/themes/myfishy.zsh-theme

# For some reason, oh-my-zsh overwrites some environment variables.
# I don't know why it does this, and I'm not sure I'm safe sourcing
# environment.zsh after sourcing ohmy.zsh. For now, fixing some
# environment here:

export LESS="-FXRS"

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# unalias d
