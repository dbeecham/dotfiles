set fish_greeting ""

fish_vi_mode

set PATH $HOME/.nix-profile/bin /usr/local/bin $HOME/.cabal/bin $PATH $HOME/bin/
set PATH /opt/ghc-mod/dist/build/ghc-mod /opt/ghc-mod/dist/build/ghc-modi/ $PATH 

function chpwd --on-variable PWD
    status --is-command-substitution; and return
    ls
end

set -xU LESS_TERMCAP_mb (printf "\e[01;31m")      # begin blinking
set -xU LESS_TERMCAP_md (printf "\e[01;31m")      # begin bold
set -xU LESS_TERMCAP_me (printf "\e[0m")          # end mode
set -xU LESS_TERMCAP_se (printf "\e[0m")          # end standout-mode
set -xU LESS_TERMCAP_so (printf "\e[01;44;33m")   # begin standout-mode - info box
set -xU LESS_TERMCAP_ue (printf "\e[0m")          # end underline
set -xU LESS_TERMCAP_us (printf "\e[01;32m")      # begin underline

set -xg DARK (cat ~/.dark)
