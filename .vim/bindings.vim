let mapleader = ","

" Don't use arrow keys.
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

nnoremap J 5j
nnoremap K 5k

" The idea is you want to make it easier to make it easier to edit text
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap gf :e <cfile><CR>

" Quote selected text
vnoremap <leader>" c"<C-r>""<Esc>
vnoremap <leader>' c'<C-r>"'<Esc>

" NERDTree
nnoremap <leader>x :NERDTreeToggle<CR>
" Move around splits with <c-hjkl>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" and resize them with <s-hjkl>
nnoremap <s-h> :vertical resize -5<cr>
nnoremap <s-l> :vertical resize +5<cr>
" conflicts with 5j 5k
"nnoremap <s-j> :resize -5<cr>
"nnoremap <s-k> :resize +5<cr>

" close tabs with c-d
nnoremap <c-d> :close<cr>

" Easier surround
nnoremap <leader>s ys

command -nargs=1 Silent
            \ | execute ':silent !'.<q-args>
            \ | execute ':redraw!'

" ghci
nnoremap <leader>g :Silent ghci<cr>

" ghci open file
nnoremap <leader>G :Silent ghci %<cr>

" quit!
nnoremap Q :q!<cr>

" ; is easier to do then :
nnoremap ; :

" wq annoyance...
command WQ wq
command Wq wq
command W w
command Q q

" Can't be bothered to understand ESC vs <c-c> in insert mode
imap <c-c> <esc>

" Clear search buffer when hitting return
nnoremap <CR> :nohlsearch<CR>

" Back to previous file
nnoremap <leader><leader> <c-^>

" Toggle autoclosing of {(["'
nnoremap <leader>a :AutoCloseToggle<cr>

" Toggle syntax
nnoremap <leader>h :if exists("g:syntax_on") <bar> syntax off <bar> else <bar> syntax enable <bar> endif<cr>

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

" make (bake)
nnoremap <leader>b :make<cr>:cw<cr>

" man
nnoremap <leader>m K

" ctrl-p -> command-t
nnoremap <leader>t :CtrlP<CR>

" ctrl-n, new tab
nnoremap <c-n> :tabnew<cr>

" tabularize
if exists(":Tabularize")
    nmap <leader>a= :Tabularize /=<CR>
    vmap <leader>a= :Tabularize /=<CR>
    nmap <leader>a: :Tabularize /:\zs<CR>
    vmap <leader>a: :Tabularize /:\zs<CR>
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
