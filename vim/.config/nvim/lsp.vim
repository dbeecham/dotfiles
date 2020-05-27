" This file is for registering language server protocol servers
"
" For C:
"   * bear make -B

" echo diagnostics when cursor is over an error
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_highlights_enabled = 1
let g:lsp_textprop_enabled = 1
let g:lsp_virtual_text_enabled = 0
let g:lsp_signs_enabled = 1
let g:lsp_highlight_references_enabled = 1
let g:lsp_signs_error = {'text': 'XX'}

"let g:lsp_log_verbose = 1
"let g:lsp_log_file = expand('~/vim-lsp.log')
"let g:asyncomplete_log_file = expand('~/asyncomplete.log')

"
"" works very well, pip instal python-language-server.
"if executable('pyls')
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'pyls',
"        \ 'cmd': {server_info->['pyls']},
"        \ 'whitelist': ['python'],
"        \ })
"endif
"
"" works awesomeness
"au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
"    \ 'name': 'file',
"    \ 'whitelist': ['*'],
"    \ 'priority': 10,
"    \ 'completor': function('asyncomplete#sources#file#completor')
"    \ }))

au User lsp_setup call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
    \ 'name': 'ultisnips',
    \ 'whitelist': ['*'],
    \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
    \ }))
