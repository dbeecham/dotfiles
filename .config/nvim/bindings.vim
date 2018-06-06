if exists(":let")
    let mapleader = ","
endif

" I'd like to search using -, since / is too slow.
nmap - <Plug>(incsearch-forward)
nmap _ <Plug>(incsarch-backward)

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
" I'm not sure about this one either. I've gotten the habit of using 'gt' to
" 'go to tag', but I've also got the habit of using it to switch tab. I place
" preference in built-in shortcuts, so I'll try to alter my habits here.
" nnoremap gt <C-]>
nnoremap <leader>t <C-]>

" Tag search. My brain has gotten used to this, so might
" as well.
" Here too, I need to change my habits. I used to use <leader>t to 'search
" tag', but now I need it for 'go to tag'. <leader>T is a natural extension
" though, this might be natural enough that I get used to it quickly.
nnoremap <leader>T :Tags<cr>

nnoremap <A-o> :tabnext<cr>
nnoremap <A-i> :tabprev<cr>



" Ultisnips is very useful.
" See setup.vim on this. I might not use Ultisnips any more; it's replaced by
" vim-snipmate.
"if exists(":let")
"    let g:UltiSnipsExpandTrigger="<C-l>"
"    let g:UltiSnipsJumpForwardTrigger="<C-j>"
"    let g:UltiSnipsJumpBackwardTrigger="<C-k>"
"endif

" So is fzf
nnoremap <leader>f :Files<cr>
nnoremap <C-t> :Files<cr>

" I've been using this for a while now, and grown to use it. It makes a
" difference when tags are not available.
nnoremap <leader>l :Lines<cr>

" My brain wants to press enter to expand a snippet, so I'll bind it.
" This turned out to be surprisingly annoying. The biggest reason is that it
" shows a match even if it's complete; i.e. if you're on 
"     let x = this_long_variabl[e]
" then pressing enter won't get you a newline, because you match
" 'this_long_variable'.
" imap <expr> <cr> pumvisible() ? "<C-l>" : "<cr>"

" Not a big change, but makes life so much easier.
nnoremap J 5j
nnoremap K 5k
vnoremap J 5j
vnoremap K 5k


" <C-\> is impossible on a Swedish keyboard, which makes pressing <C-\><C-N>
" to exit terminal mode in neovim very hard.
if has("nvim")
    tnoremap <C-x> <C-\><C-n>
endif
