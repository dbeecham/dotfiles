function! ltaghighlight#init()
    let l:tags = readfile('tags')
    for l:line in l:tags
        if l:line[0] == '!'
            continue
        endif
        let l:parts = split(l:line, '\t')
        let l:tag = l:parts[0]
        let l:file = l:parts[1]
        let l:source = split(l:parts[2], ';')[0]
        let l:type = l:parts[3]

        if l:type == 'd'
            execute "syntax keyword Keyword " . l:tag
            continue
        endif

        if l:type == 'e'
            execute "syntax keyword Keyword " . l:tag
            continue
        endif

        if l:type == 'f'
            execute "syntax keyword Function " . l:tag
            continue
        endif

        if l:type == 's'
            execute "syntax keyword Structure " . l:tag
            continue
        endif

        if l:type == 'l'
            execute "syntax keyword LocalVariable " . l:tag
            continue
        endif

        if l:type == 'm'
            execute "syntax keyword Member " . l:tag
            continue
        endif

        if l:type == 't'
            execute "syntax keyword Type " . l:tag
            continue
        endif

        if l:type == 'g'
            execute "syntax keyword Identifier " . l:tag
            continue
        endif

    endfor
endfunction
