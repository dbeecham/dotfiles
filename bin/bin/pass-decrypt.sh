#/usr/bin/env bash

set -euo pipefail

main() {
    set -x
    local name=$1
    local dir=~/.password-store/${name}
    local ciphertext=${dir}/cip
    local ephemeralpubkeyfile=${dir}/ephemeral-pubkey
    local macfile=${dir}/hmac
    local ivfile=${dir}/iv

    local privkey=$1
    local ephemeralpubkey=$2
    local ciphertextfile=$3
    local macfile=$4
    local ivfile=$5
    local plaintextfile=$6
    local dkey=$(openssl pkeyutl -derive -inkey $privkey -peerkey ${ephemeralpubkey} | openssl dgst -sha256 | cut -d ' ' -f 2)

    #local iv="00000000000000000000000000000000"

    mac=$(openssl dgst -sha256 -hmac $dkey "$ciphertextfile" | cut -d ' ' -f 2)

    # make sure mac is correct
    if test "$mac" != "$(cat $macfile)"; then
        printf "incorrect mac\n" >&2
        exit 1
    fi

    openssl enc -d -aes-256-ofb -iv "$(cat ${ivfile})" -K "$dkey" -in $ciphertextfile -out $plaintextfile
}

main "$@"
