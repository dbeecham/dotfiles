augroup tfview
    autocmd!
    autocmd BufWritePost *.c mkview
    autocmd BufWinLeave *.tf mkview
    autocmd BufWinEnter *.tf silent! loadview
augroup END
