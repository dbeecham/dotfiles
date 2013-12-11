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

" Clear search buffer when hitting return
nnoremap <CR> :nohlsearch<CR>

" Back to previous file
nnoremap <Leader><Leader> <c-^>

" Toggle autoclosing of {(["'
nnoremap <Leader>a :execute "normal \<Plug>ToggleAutoCloseMappings"<cr>

" Other window
nnoremap ,w <c-w><c-w>

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

" tabularize
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" https://gist.github.com/tpope/287147
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
