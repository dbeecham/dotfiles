set fish_greeting ""

set PATH ~/.nix-profile/bin /usr/local/bin $PATH

function chpwd --on-variable PWD
    status --is-command-substitution; and return
    ls
end
