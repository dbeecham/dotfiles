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
    local pubkey="-----BEGIN PUBLIC KEY-----
MHYwEAYHKoZIzj0CAQYFK4EEACIDYgAEAbZ+T2w+ASvYTw0h5OVtTmz6ttfBpXBn
cr8vUQ9PrEWM1SQ9347fsDTfkdwp/joJMls3JcqEnzB9z4Iyquy4lPHxFbBg7NnB
w0XzddAMGzalI+zgy2DjFa82k9GB0RHG
-----END PUBLIC KEY-----"

    mkdir -p ${dir}

    pubkeyfile=$(mktemp)
    trap "rm ${pubkeyfile}" EXIT
    tmpfile=$(mktemp)
    trap "rm ${tmpfile} ${pubkeyfile}" EXIT

    while read line; do printf "%s" "$line" > $tmpfile; done
    echo "${pubkey}" > ${pubkeyfile}

    # generate ephemeral key pair
    local key=$(openssl ecparam -genkey -param_enc explicit -name prime256v1)

    # derive key using ephemeral private key and target public key
    local dkey=$(openssl pkeyutl -derive -inkey <(echo "$key") -peerkey ${pubkeyfile} | openssl dgst -sha256 | cut -d ' ' -f 2)

    # generate random IV
    local iv="$(hexdump -n 16 -e '4/4 "%08X" 1 "\n"' /dev/urandom)"
    #local iv="00000000000000000000000000000000"

    # encrypt file using ephemeral key
    openssl enc -aes-256-ofb -iv "${iv}" -K "$dkey" -in $tmpfile -out $ciphertext

    # calculate mac
    mac=$(openssl dgst -sha256 -hmac $dkey "$ciphertext" | cut -d ' ' -f 2)

    # store mac and iv
    echo -n "$mac" > $macfile
    echo -n "$iv" > $ivfile

    # store emphemeral public key
    printf "%s" "$key" | openssl ec -param_enc explicit -pubout -out $ephemeralpubkeyfile
}

main "$@"
