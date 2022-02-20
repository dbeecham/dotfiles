unrandom() {
    local current_dir=$(dirname "$(readlink -f "$0")")
    export LD_PRELOAD=${LD_PRELOAD:+${LD_PRELOAD},}${current_dir}/libunrandom.so
    eval "$@"
}

unrandom "$@"
