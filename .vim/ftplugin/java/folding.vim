setlocal foldmethod=expr
setlocal foldexpr=JavaFoldlevel(v:lnum)

function! IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction

function! LineIsEmpty(lnum)
    return !LineIsNotEmpty(a:lnum)
endfunction

function! LineIsNotEmpty(lnum)
    return getline(a:lnum) =~? '\v\S'
endfunction

function! NextNonBlankLine(lnum)
    let numlines = line('$')
    let current = a:lnum + 1

    while current <= numlines
        if !LineIsEmpty(current)
            return current
        endif

        let current += 1
    endwhile

    return -2
endfunction

function! JavaFoldlevel(lnum)
    if LineIsEmpty(a:lnum)
        let next = NextNonBlankLine(a:lnum)
        if IndentLevel(next) >= 2
            return '1'
        endif

        if IndentLevel(next) >= 1 && getline(next) =~ '\v\}\s*$'
            return '1'
        endif
    endif

    if getline(a:lnum) =~? "\v^\s*$"
        return '-1'
    end

    if IndentLevel(a:lnum) >= 2
        return '1'
    endif

    if IndentLevel(a:lnum + 1) >= 2
        return '1'
    endif

    " An indented }
    if IndentLevel(a:lnum) >= 1 && getline(a:lnum) =~ '\v\}\s*$'
        return '1'
    endif


    return '0'
endfunction
