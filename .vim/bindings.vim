let mapleader = ","

" I'd like to search using -, since / is too slow.
nmap - /
nmap _ ?

" I think these are useful enough to be included.
nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

" Back to previous file
" c-^ is super awkward on a swedish keyboard.
nnoremap <leader><leader> <c-^>

" Clear search buffer when hitting return
" Also a pretty trivial thing, so I'll allow it.
nnoremap <cr> :nohlsearch<cr>

" Go to tag under cursor
" C-] is impossible on swedish keyboard
nnoremap <leader>t <C-]>
