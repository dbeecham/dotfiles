C=$(tput colors)

# Set up EMACS bindings.
bindkey -e

# Enable completion system.
autoload -Uz compinit && compinit

# Enable Colors
autoload -U colors && colors

# Enables additional prompt extentions
setopt prompt_subst

DIRSTACKSIZE=16
setopt autopushd pushdminus pushdsilent pushdtohome

# using !command with verification
setopt histverify

# Set up language.
export LANG="en_GB.UTF-8"

# I want my bin folder in my path.
export PATH="/home/zhaozhou/bin:$PATH"

# WAF
export WAFDIR="/usr/local/lib"

# VIM is awesome.
export EDITOR="/usr/bin/vim"
#export PAGER="/usr/bin/vimmanpager"
export PAGER="/usr/bin/less"

export PATH="$PATH:/usr/local/go/bin"

# Makes sure less displays escape characters right.
export LESS="-R"

# I don't like Color Wrappers randomize, I want my CW grey.
export CW_COLORIZE="grey"
