# Common commands and aliases.
alias g="git"
alias ls="ls --color -F --group-directories-first"
alias la="ls -a --color -F --group-directories-first"
alias ll="ls -al --color -F --group-directories-first"
alias lsof="lsof -Pn"
alias mmv='noglob zmv -W'
alias -g ...="../.."
alias -g ....="../../.."
alias -g .....="../../../.."
alias pgr="vimpager"
alias rm="trash -v"
alias mv="mv -v"
alias ds="dirs -v"
alias ps='ps af -o pid,user,tty,command'
alias pc="pacman-color"
alias oct="octave --silent"
alias hs="ghci"
alias v="vim"
alias c="cd"
#alias o="cd"
alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"
alias grep="grep --color"
alias packers="packer --noconfirm --noedit"
alias nixe="nix-env -f ~/nixpkgs -j 5 --cores 4 --option extra-binary-caches http://hydra.nixos.org --option extra-binary-caches http://hydra.cryp.to "
