" based on work done by amitab:
" https://gist.github.com/amitab/cd051f1ea23c588109c6cfcb7d1d5776

function! Cscope(option, query)
  let color = '{ x = $1; $1 = ""; z = $3; $3 = ""; printf "\033[34m%s\033[0m:\033[31m%s\033[0m\011\033[37m%s\033[0m\n", x,z,$0; }'
  let opts = {
  \ 'source':  "cscope -dL" . a:option . " " . a:query . " | awk '" . color . "'",
  \ 'options': ['--ansi', '--prompt', '> ',
  \             '--multi', '--bind', 'alt-a:select-all,alt-d:deselect-all',
  \             '--color', 'fg:188,fg+:222,bg+:#3a3a3a,hl+:104'],
  \ 'down': '40%'
  \ }
  function! opts.sink(lines) 
    let data = split(a:lines)
    let file = split(data[0], ":")
    execute 'e ' . '+' . file[1] . ' ' . file[0]
  endfunction
  call fzf#run(opts)
endfunction

function! CscopeQuery(option)
  call inputsave()
  if a:option == '0'
    let query = input('Assignments to: ')
  elseif a:option == '1'
    let query = input('Functions calling: ')
  elseif a:option == '2'
    let query = input('Functions called by: ')
  elseif a:option == '3'
    let query = input('Egrep: ')
  elseif a:option == '4'
    let query = input('File: ')
  elseif a:option == '6'
    let query = input('Definition: ')
  elseif a:option == '7'
    let query = input('Files #including: ')
  elseif a:option == '8'
    let query = input('C Symbol: ')
  elseif a:option == '9'
    let query = input('Text: ')
  else
    echo "Invalid option!"
    return
  endif
  call inputrestore()
  if query != ""
    call Cscope(a:option, query)
  else
    echom "Cancelled Search!"
  endif
endfunction


"nnoremap <silent> <Leader><Leader>ca :call CscopeQuery('0')<CR>
"nnoremap <silent> <Leader><Leader>cc :call CscopeQuery('1')<CR>
"nnoremap <silent> <Leader><Leader>cd :call CscopeQuery('2')<CR>
"nnoremap <silent> <Leader><Leader>ce :call CscopeQuery('3')<CR>
"nnoremap <silent> <Leader><Leader>cf :call CscopeQuery('4')<CR>
"nnoremap <silent> <Leader><Leader>cg :call CscopeQuery('6')<CR>
"nnoremap <silent> <Leader><Leader>ci :call CscopeQuery('7')<CR>
"nnoremap <silent> <Leader><Leader>cs :call CscopeQuery('8')<CR>
"nnoremap <silent> <Leader><Leader>ct :call CscopeQuery('9')<CR>
