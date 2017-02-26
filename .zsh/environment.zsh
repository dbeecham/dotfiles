if test "$COLORTERM" = "gnome-terminal"; then
    export TERM="xterm-256color"
fi

if test "$(cat ~/.dark)" = "1"; then
    export DARK=1
else
    export DARK=0
fi

C=$(tput colors)

export PATH=~/bin:$PATH

# Set up EMACS bindings.
bindkey -e

# LS Colors
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

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
export LANG="en_US.UTF-8"

# I want my bin folder in my path.
export EDITOR="vim"
export PAGER="less"
 
set -o vi

# By default, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'

# GO
export GOROOT="$HOME/go"

# nix
if test -e ~/.nix-profile/etc/profile.d/nix.sh; then
    source ~/.nix-profile/etc/profile.d/nix.sh
fi

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

# I like when FZF picks up on .ignore, .gitignore, etc.
# It's only a couple of environment variables anyway.
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
