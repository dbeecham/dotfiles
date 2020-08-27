if test "$COLORTERM" = "gnome-terminal" -o "$TERM" = "rxvt-unicode" -o "$TERM" = "rxvt-unicode-256color"; then
    export TERM="xterm-256color"
fi

# So I ran `execsnoop | ts` to optimize my zsh bootup time, and I found that this
# command takes like 0.4 seconds to run. That's pretty slow in my opinion. I'm
# just running this on 256 color capable terminals, so I'm just going to set that
# directly, and deal with the consequences when they arrive.
#C=$(tput colors)
C=256

export PATH=~/bin:$PATH

# LS Colors
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

# Enable completion system.
autoload -Uz compinit && compinit

# Enable Colors (is done in separate file)
#autoload -U colors && colors

# Enables additional prompt extentions
setopt prompt_subst

# extended globbing, ^file, file.???, [...], etc.
setopt extended_glob

# Change directory without 'cd' command.
setopt auto_cd

# Autocorrect - is mostly annoying, i just press no anyway, and it always corrects
# "gits tatus" to "git tatus" which isn't correct anyway
#setopt correct

# using !command with verification
setopt histverify

# history setting
# I like to search through my history later using 'fc -lf 10000'.

# history size and save history size
export HISTSIZE=9999999
export SAVEHIST=$HISTSIZE

# when searching through history, ignore duplicates
setopt hist_find_no_dups

# this guy ignores duplicate entries in the history file. I can
# imagine that it slows down the appending of entries, but really,
# I think I want duplicates in my logs so I know what I was doing.
#setopt histignoredups

# save commands beginning timestamp (unix timestamp) and duration (seconds) to
# the history file
setopt extended_history


# this uses fcntl locking instead of some ad-hoc locking (if available). that
# seems like a good idea to me.
setopt hist_fcntl_lock

# ignore empty commands (?) 
# does this include comments? maybe I can use command line comments to guide
# my logging...
# setopt histignorespace

# share_history, append_history and inc_append_history are mutually exclusive
unsetopt share_history
unsetopt append_history

# EXTENDED_GLOB "treat the ?#?, ?~? and ?^? characters as part of patterns for
# filename generation, etc. (An initial unquoted ?~? always produces named
# directory expansion.)"
# but I like to be able to write `nix shell nixpkgs#package` so I'm unsetting
# this. It's also possible to do `disable -p '#'` here, but I'm not using the
# other functions of extended glob.
unsetopt EXTENDED_GLOB

# this option makes history lines written to file as soon as they are entered
# (more specifically, when the command has finished).
setopt inc_append_history_time

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

# use emacs mode in shell
bindkey -e

# By default, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'

# GO
export GOROOT="$HOME/go"

# nix
if test -e ~/.nix-profile/etc/profile.d/nix.sh; then
    source ~/.nix-profile/etc/profile.d/nix.sh
fi

# add local plejd to nix repos
if test -d ${HOME}/plejd-nixpkgs; then
    export NIX_PATH=$NIX_PATH:plejd=${HOME}/plejd-nixpkgs/
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
export FZF_DEFAULT_COMMAND='fd --type d'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="find . \( -path ./sources -o -path ./MATLAB -o -path ./.dropbox-dist -o -path '*/node_modules/*' -o -path '*/.npm/*' -o -path '*/.git/*' \) -prune -o -type d -print 2>/dev/null"
