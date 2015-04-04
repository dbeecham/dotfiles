#!/bin/sh
curl --fail --location --output ~/.nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugUpdate
