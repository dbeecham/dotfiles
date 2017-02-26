export LANG="en_US.UTF-8"
export EDITOR="vim"
export PAGER="less"
export LESS="-R"

if test "$COLORTERM" = "gnome-terminal" -o "$TERM" = "rxvt-unicode"; then
    export TERM="xterm-256color"
fi

# If nix is installed, source it.
if test -e ~/.nix-profile/etc/profile.d/nix.sh; then
    source ~/.nix-profile/etc/profile.d/nix.sh
fi

# I like when FZF picks up on .ignore, .gitignore, etc.
# It's only a couple of environment variables anyway.
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
