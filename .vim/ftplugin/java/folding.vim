setlocal foldmethod=expr
setlocal foldexpr=JavaFoldlevel(v:lnum)

function! IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction

function! JavaFoldlevel(lnum)
    if getline(a:lnum) =~? "\v^\s*$"
        return '-1'
    end

    if IndentLevel(a:lnum) >= 2
        return '1'
    endif

    if IndentLevel(a:lnum + 1) >= 2
        return '1'
    endif

    if IndentLevel(a:lnum) >= 1 && getline(a:lnum) =~ "}$"
        return '1'
    endif

    return '0'
endfunction
