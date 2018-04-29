" plug:vim-slime

if exists(":let")

" netrw settings
" use tree view
let g:netrw_liststyle=3
" netrw can occupy 20% of vim window
let g:netrw_winsize=20
" disable banner
let g:netrw_banner = -1
" make netrw split to 'open previous window' when opening file
let g:netrw_browse_split = 4

" Set up slime to use tmux instead of screen which is default.
let g:slime_target = "tmux"

" As of tmux 2.2, tmux does no longer accept input from stdin;
" instead, a file needs to be used as pipe. See
" https://github.com/jpalardy/vim-slime.
let g:slime_paste_file = "$HOME/.slime_paste"


" if table mode uses <leader>t, then <leader>t is slow, because it's waiting
" for possible input...
" <tm_prefix>m starts table mode
let g:table_mode_map_prefix = "<Leader>m"

endif
