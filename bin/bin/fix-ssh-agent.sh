#!/usr/bin/env sh

OPENSC_LIB="$(nix-store --realise $(nix-instantiate --expr '(import <nixpkgs> {}).opensc' 2>/dev/null) 2>/dev/null)/lib/opensc-pkcs11.so"

pkill gpg-agent
pkill ssh-agent
eval $(ssh-agent -a"${SSH_AUTH_SOCK}" -P"${OPENSC_LIB}")
ssh-add -s "${OPENSC_LIB}"
