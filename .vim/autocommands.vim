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

" Closetag
augroup filetype_html
    autocmd!
    autocmd FileType html,xml,xsl source ~/.vim/scripts/closetag.vim
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
