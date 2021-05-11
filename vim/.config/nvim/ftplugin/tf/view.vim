augroup cview
    autocmd!
    autocmd BufWinLeave *.tf mkview
    autocmd BufWinEnter *.tf silent! loadview
augroup END
