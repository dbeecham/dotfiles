export LANG="en_US.UTF-8"
export EDITOR="/usr/bin/vim"
export PAGER="/usr/bin/less"
export LESS="-R"
export PACMAN="/usr/bin/pacman-color"
export GOPATH="~/go"

if test -e /etc/arch-release; then
    export DIST="arch"
elif test -e /etc/alpine-release; then
    export DIST="alpine"
elif test -e /etc/gentoo-release; then
    export DIST="gentoo"
else
    export DIST="custom"
fi
