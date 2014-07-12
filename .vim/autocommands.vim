" Comment out line
augroup comments
	autocmd!
	autocmd FileType javascript nnoremap <buffer> <leader>c I//
	autocmd FileType python     nnoremap <buffer> <leader>c I#
augroup END

" Auto-coding
augroup auto_code
	autocmd!
	autocmd FileType javascript iabbrev <buffer> iff if ()<left>
augroup END

" Restore Cursor Position
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

au VimLeave * ! echo; ls --color -F --group-directories-first

" Haskell compiler = ghc
au BufEnter *.hs compiler ghc
