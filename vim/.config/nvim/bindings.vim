if exists(":let")
    let mapleader = ","
endif

" I'd like to search using -, since / is too slow.
nmap - /\v

" I think these are useful enough to be included.
nnoremap <leader>ve :vsplit ~/.vimrc<cr>
nnoremap <leader>vs :source ~/.vimrc<cr>

" this binding is in ftplugin
" nnoremap <leader>vn :vsplit ~/.vim/pack/completion/start/neosnippet-snippets/neosnippets/c.snip

" Back to previous file
" c-^ is super awkward on a swedish keyboard.
nnoremap <leader><leader> <c-^>

" Clear search buffer when hitting return
" Also a pretty trivial thing, so I'll allow it.
nnoremap <cr> :nohlsearch<cr>:pclose<cr>

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


" Enabling NERDTree over and over is a bit of a pain, same with the tagbar.
" You can't save them with mksession either, so it's definitely worth it.
nnoremap <leader>x :NERDTreeToggle<cr>
nnoremap <leader>X :TagbarToggle<cr>

function! TabComplete()
    " if we can expand a snippet, do it first
    if neosnippet#expandable()
        return "\<Plug>(neosnippet_expand)"
    endif

    " otherwise, if we have nothing selected in the pum, select the first one
    " we do this before jumpable(), because we'd rather select the first item
    " than jump to the next neosnippet
    if pumvisible() && complete_info().selected == -1
        return "\<C-n>"
    endif

    " lastly, if we can jump to the next item, do that. we don't use
    " expandable_or_jumpable, because sometimes we can't expand, we can jump,
    " but we don't want to jump - we want to select the first item in the pum.
    if neosnippet#jumpable()
      return "\<Plug>(neosnippet_jump)"
    endif

    " if nothing else, just insert a tab
    return "\<tab>"
endfunction

autocmd CompleteDone * if pumvisible() == 0 | silent! pclose | endif

"imap <expr><tab> neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : pumvisible() ? (complete_info().selected == -1 ? "\<C-n>" : "\<Plug>(neosnippet_expand_or_jump)") : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)" : "\<tab>")
imap <expr><tab> TabComplete()
smap <expr><tab> TabComplete()
"smap <expr><tab> neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : pumvisible() ? (complete_info().selected == -1 ? "\<C-n>" : "\<Plug>(neosnippet_jump_or_expand)") : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)" : "\<tab>")
"smap <expr><tab> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"

" FZF is very useful.
nnoremap <leader>f :Files<cr>
nnoremap <C-t> :Files<cr>
nnoremap <leader>b :Buffers<cr>

" I've been using this for a while now, and grown to use it. It makes a
" difference when tags are not available.
nnoremap <leader>l :Lines<cr>


" Fold function - gotten used to this one now
nnoremap <leader>Ff V$%j%zfzz
" and this to fold block
nnoremap <leader>Fb V$%zf


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


" stage this hunk
nnoremap <leader>s :GitGutterStageHunk<cr>


" for brookhong/cscope
"nnoremap <leader>ca :call CscopeFindInteractive(expand('<cword>'))<CR>
"nnoremap <leader>l :call ToggleLocationList()<CR>

" <C-\> is impossible on a Swedish keyboard, which makes pressing <C-\><C-N>
" to exit terminal mode in neovim very hard.
if has("nvim")
    tnoremap <C-x> <C-\><C-n>
endif

" lets try these out...
nnoremap ö :cprev<cr>
nnoremap Ö :cfirst<cr>
nnoremap ä :cnext<cr>
nnoremap Ä :clast<cr>


" let's try these out as well!
nnoremap <leader>sal :call writefile(["<C-r><C-w>	" . expand('%') . "	" . (line('.') + 1) . ";\"	l"], "tags", "a")<cr>:call ltaghighlight#init()<cr>
nnoremap <leader>sai :call writefile(["<C-r><C-w>	" . expand('%') . "	" . (line('.') + 1) . ";\"	i"], "tags", "a")<cr>:call ltaghighlight#init()<cr>
nnoremap <leader>sak :call writefile(["<C-r><C-w>	" . expand('%') . "	" . (line('.') + 1) . ";\"	k"], "tags", "a")<cr>:call ltaghighlight#init()<cr>
nnoremap <leader>saf :call writefile(["<C-r><C-w>	" . expand('%') . "	" . (line('.') + 1) . ";\"	f"], "tags", "a")<cr>:call ltaghighlight#init()<cr>
