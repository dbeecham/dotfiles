C=$(tput colors)

# Set up EMACS bindings.
bindkey -e

# Enable completion system.
autoload -Uz compinit && compinit

# Enable Colors
autoload -U colors && colors

# Enables additional prompt extentions
setopt prompt_subst

# Change directory without 'cd' command.
setopt auto_cd

# Autocorrect
setopt correct

DIRSTACKSIZE=16
setopt autopushd pushdminus pushdsilent pushdtohome

# using !command with verification
setopt histverify

# history setting
setopt histignoredups
setopt histignorespace

# Why is this setting even a thing?!
setopt interactivecomments

# Don't want to accidentally overwrite a file. Can use >! to overwrite, or !!.
setopt noclobber

# I can't believe I actually want this option.
setopt sunkeyboardhack

# Set up language.
export LANG="en_GB.UTF-8"

# I want my bin folder in my path.
export PATH="/home/zhaozhou/bin:$PATH"
export EDITOR="/usr/bin/vim"
export PAGER="/usr/bin/less"

# GO
export PATH="$PATH:/usr/local/go/bin"
export GOROOT="/home/zhaozhou/go"

# Makes sure less displays escape characters right.
export LESS="-R"

# fish-like syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
