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

function! CompileHaskell()
    if !empty(glob("*cabal"))
        execute ':Dispatch cabal build'
    elseif filereadable("Makefile")
        execute ':Make'
    else
        echo "No way to build."
    endif
endfunction


nnoremap <leader>g :call RunHaskellRepl()<cr>
nnoremap <leader>b :call CompileHaskell()<cr>

nnoremap <leader>a :GhcModType<cr>


set hlsearch
nnoremap <cr> :nohlsearch<cr>:GhcModTypeClear<cr>

