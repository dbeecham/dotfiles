function psa
    ps af -o pid,user,tty,command $argv
end
