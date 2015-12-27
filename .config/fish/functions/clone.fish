function clone
    git clone (echo $argv[1] | sed -E "/^[[:alnum:]]+\/[[:alnum:]]+\$/{
        s/^/git:\/\/github.com\//
    }")
end

