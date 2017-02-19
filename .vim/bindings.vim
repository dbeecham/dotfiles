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

" Ultisnips is very useful.
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" So is fzf
nnoremap <leader>f :Files<cr>

" Not a big change, but makes life so much easier.
nnoremap J 5j
nnoremap K 5k
