set fish_greeting ""

fish_vi_mode

set PATH $HOME/.nix-profile/bin /usr/local/bin $HOME/.cabal/bin $PATH $HOME/bin/
set PATH /opt/ghc-mod/dist/build/ghc-mod /opt/ghc-mod/dist/build/ghc-modi/ $PATH 

function chpwd --on-variable PWD
    status --is-command-substitution; and return
    ls
end

set -xg DARK (cat ~/.dark)
