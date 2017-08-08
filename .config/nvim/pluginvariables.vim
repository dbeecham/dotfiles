" plug:vim-slime

if exists(":let")

" Set up slime to use tmux instead of screen which is default.
let g:slime_target = "tmux"

" As of tmux 2.2, tmux does no longer accept input from stdin;
" instead, a file needs to be used as pipe. See
" https://github.com/jpalardy/vim-slime.
let g:slime_paste_file = "$HOME/.slime_paste"

endif
