let mapleader = ","

" Don't use arrow keys.
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

nnoremap J 5j
nnoremap K 5k
vnoremap J 5j
vnoremap K 5k


nnoremap - /

""" neocomplete 
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


" The idea is you want to make it easier to make it easier to edit text
nnoremap <leader>ve :vsplit $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>
nnoremap gf :e <cfile><CR>

" NERDTree
nnoremap <leader>x :NERDTreeToggle<CR>
" Move around splits with <c-hjkl>
"nnoremap <m-h> <c-w>h
"nnoremap <m-j> <c-w>j
"nnoremap <m-k> <c-w>k
"nnoremap <m-l> <c-w>l

let g:tmux_navigator_no_mappings = 1

noremap <silent> h :TmuxNavigateLeft<cr>
noremap <silent> j :TmuxNavigateDown<cr>
noremap <silent> k :TmuxNavigateUp<cr>
noremap <silent> l :TmuxNavigateRight<cr>
noremap <silent> <M-h> :TmuxNavigateLeft<cr>
noremap <silent> <M-j> :TmuxNavigateDown<cr>
noremap <silent> <M-k> :TmuxNavigateUp<cr>
noremap <silent> <M-l> :TmuxNavigateRight<cr>

noremap <silent> <M-o> :bnext<cr>
noremap <silent> o :bnext<cr>

noremap <silent> <M-i> :bprev<cr>
noremap <silent> i :bprev<cr>


" and resize them with <s-hjkl>
nnoremap <s-h> :vertical resize -5<cr>
nnoremap <s-l> :vertical resize +5<cr>
" conflicts with 5j 5k
"nnoremap <s-j> :resize -5<cr>
"nnoremap <s-k> :resize +5<cr>

" quit!
nnoremap Q :qa!<cr>

" ; is easier to do then :
nnoremap ; :

" wq annoyance...
command! WQ wq
command! Wq wq
command! W w
command! Q q

" Can't be bothered to understand ESC vs <c-c> in insert mode
imap <c-c> <esc>

" Clear search buffer when hitting return
nnoremap <CR> :nohlsearch<CR>

" Back to previous file
nnoremap <leader><leader> <c-^>

" Other window
nnoremap <leader>w <c-w><c-w>

" tags
nnoremap gj <C-]>


" make (bake)
nnoremap <leader>b :Make<cr>:cw<cr>

" splitting
noremap <C-g> :vsp<cr>
noremap <C-b> :sp<cr>

" man
nnoremap <leader>m K

" ctrl-p -> command-t
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>s :CtrlPTag<cr>

nnoremap <leader>T :TagbarToggle<cr>

nnoremap <leader>t :CtrlPCommandPalette<cr>

" ctrl-n, new buffer
nnoremap <c-n> :enew<cr>

" close buffers with c-d
nnoremap <c-d> :bdelete<cr>

" tabularize
"if exists(":Tabularize")
"    nmap <leader>a= :Tabularize /=<CR>
"    vmap <leader>a= :Tabularize /=<CR>
"    nmap <leader>a: :Tabularize /:\zs<CR>
"    vmap <leader>a: :Tabularize /:\zs<CR>
"endif

" https://gist.github.com/tpope/287147
" inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

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
