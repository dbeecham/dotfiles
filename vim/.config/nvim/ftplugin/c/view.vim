augroup cview
    autocmd!
    autocmd BufWinLeave *.c mkview
    autocmd BufWinEnter *.c silent! loadview
augroup END
