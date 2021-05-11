augroup cview
    autocmd!
    autocmd BufWritePost *.c mkview
    autocmd BufWinLeave *.c mkview
    autocmd BufWinEnter *.c silent! loadview
augroup END
