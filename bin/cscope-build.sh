#!/bin/sh

if test -r cscope.files; then
    mv cscope.files cscope.files.$(date +"%y%m%d%H%M%S").bak
fi

## Add all sources from current directory into cscope.files
find . -name "*.c" -o -name "*.h" -o -name "*.rl" > cscope.files

## Find all referenced header files in sources
HEADERS=$(grep -Poh '#include [<"]\K[^">]*' */** | sort | uniq)

for header in ${HEADERS}; do
    if test -r /usr/include/$header; then
        readlink --canonicalize /usr/include/$header >> cscope.files
    elif test -r /usr/include/x86_64-linux-musl/$header; then
        readlink --canonicalize /usr/include/x86_64-linux-musl/$header >> cscope.files
    elif test -r /usr/include/x86_64-linux-gnu/$header; then
        readlink --canonicalize /usr/include/x86_64-linux-gnu/$header >> cscope.files
    fi
done
