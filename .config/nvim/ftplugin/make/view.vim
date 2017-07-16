augroup make_view
    autocmd!
    autocmd BufWinLeave Makefile mkview
    autocmd BufWinEnter Makefile silent! loadview
augroup END
