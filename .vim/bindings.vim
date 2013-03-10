let mapleader = ","

" Don't use arrow keys.
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

" The idea is you want to make it easier to make it easier to edit text
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap gf :e <cfile><CR>

" Quote selected text
vnoremap <Leader>" c"<C-r>""<Esc>
vnoremap <Leader>' c'<C-r>"'<Esc>

" NERDTree
nnoremap <Leader>b :NERDTreeToggle<CR>

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Can't be bothered to understand ESC vs <c-c> in insert mode
imap <c-c> <esc>

" Clear surch buffer when hitting return
nnoremap <CR> :nohlsearch<CR>

" Need to figure this out...
nnoremap <Leader><Leader> <c-^>

" Indent if we're at the beginning of a line, else, do completion.
"   function! InsertTabWrapper()
"       let col = col('.') - 1
"       if !col || getline('.')[col - 1] !~ '\k'
"           return "\<tab>"
"       else
"           return "\<c-p>"
"       endif
"   endfunction
"   inoremap <tab> <c-r>=InsertTabWrapper()<cr>
"   inoremap <s-tab> <c-n>

" Rename file
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>r :call RenameFile()<cr>

" Show numbers
map <leader>n :set number!<cr>

" Show list
map <leader>l :set list!<cr>

" make
nnoremap <leader>m :make<cr>:cw<cr>

" ctrl-p -> command-t
nnoremap <leader>t :CtrlP<CR>
