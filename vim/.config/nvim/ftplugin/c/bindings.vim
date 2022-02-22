function! ReloadVimConfig()
    source ~/.vimrc
    NeoSnippetSource ~/.vim/pack/completion/start/neosnippet-snippets/neosnippets/c.snip
endfunction
nnoremap <leader>vs :call ReloadVimConfig()<cr>
nnoremap <leader>vn :vsplit ~/.vim/pack/completion/start/neosnippet-snippets/neosnippets/c.snip<cr>
