command! -nargs=1 Silent
    \ | execute ':silent !'.<q-args>
    \ | execute ':redraw!'

function! RunHaskellRepl()
    if !empty(glob("*cabal"))
        execute ':Silent cabal repl'
    else
        execute ':Silent ghci %'
    endif
endfunction

nnoremap <leader>G :call RunHaskellRepl()<cr>
