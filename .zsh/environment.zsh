if test "$COLORTERM" = "gnome-terminal"; then
    export TERM="xterm-256color"
fi

C=$(tput colors)

# Set up vi bindings.
bindkey -v

# shorter delay between mode switch
export KEYTIMEOUT=1

# LS Colors
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

# grep colors
export GREP_OPTIONS="--color"

# Enable completion system.
autoload -Uz compinit && compinit

# Enable Colors
autoload -U colors && colors

# Enables additional prompt extentions
setopt prompt_subst

# extended globbing, ^file, file.???, [...], etc.
setopt extended_glob

# Change directory without 'cd' command.
setopt auto_cd

# Autocorrect
setopt correct

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
export PATH="$HOME/bin:$PATH"
export EDITOR="/usr/bin/vim"
export PAGER="/usr/bin/less"
 
# GNU Screen sets -o vi if EDITOR=vi, so we have to force it back.
#set -o emacs

# By default, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'

# GO
export PATH="$PATH:/home/dbe/go/bin"
export GOROOT="$HOME/go"

# Makes sure less displays escape characters right.
export LESS="-FXRS"

# fish-like syntax highlighting
#source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh sets xterm title
case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
esac
