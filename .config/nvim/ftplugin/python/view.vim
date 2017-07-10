augroup pyview
    autocmd!
    autocmd BufWinLeave *.py mkview
    autocmd BufWinEnter *.py silent! loadview
augroup END
