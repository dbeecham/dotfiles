function! ProjectByFilename()
    let l:filename = expand('%:t:r')
    if strlen(l:filename) == 0
        let l:filename = 'tmp'
    endif
    return split(l:filename, '_')[0]
endfunction

function! ProjectName()
    return expand('%:p:t:r')
    " return ProjectByFilename()
endfunction
