" This file is for registering language server protocol servers
"
" For C:
"   * bear make -B

" echo diagnostics when cursor is over an error
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_highlights_enabled = 0
let g:lsp_textprop_enabled = 1
let g:lsp_virtual_text_enabled = 1
let g:lsp_diagnostics_signs_enabled = 0
let g:lsp_highlight_references_enabled = 1
"let g:lsp_signs_error = {'text': 'XX'}
let g:lsp_insert_text_enabled = 0
let g:lsp_edit_text_enabled = 0
let g:lsp_signature_help_enabled = 0
let g:lsp_completion_documentation_enabled = 0

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

" Some note about this:
"   If you don't set 'completion' to 'detailedLabel: false', then I get type
"   information expanded using asyncomplete-lsp. It's really annoying. Maybe
"   there are smarter ways to do lsp expansion, but I made it work like this.
"   The 'lsRanges' thing should be able to do smarter semantic syntax stuff,
"   but I've yet to get it to work. Maybe some day. Right now though this is
"   working pretty well.
if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(
      \   lsp#utils#find_nearest_parent_file_directory(
      \     lsp#utils#get_buffer_path(), ['.ccls-cache', 'compile_commands.json', '.git/']))},
      \ 'initialization_options': {
      \   'cache': {'directory': '.ccls-cache' },
      \   'completion': #{detailedLabel: v:false},
      \   'highlight': {'lsRanges': v:true},
      \ },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc']
      \ })
endif


if executable('rust-analyzer')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'rust-analyzer',
      \ 'cmd': {server_info->['rust-analyzer']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(
      \   lsp#utils#find_nearest_parent_file_directory(
      \     lsp#utils#get_buffer_path(), ['Cargo.toml']))},
      \ 'whitelist': ['rust']
      \ })
endif


"" works awesomeness
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'allowlist': ['*'],
    \ 'blocklist': [],
    \ 'priority': 100,
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ 'config': {
    \     'max_buffer_size': 5242880,
    \ }
    \ }))

" i never got this to work. like, i never got the popups in my feed.
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#neosnippet#get_source_options({
    \ 'name': 'neosnippet',
    \ 'allowlist': ['*'],
    \ 'completor': function('asyncomplete#sources#neosnippet#completor'),
    \ }))

"au User asyncomplete_setups call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
"\ 'name': 'omni',
"\ 'allowlist': ['*'],
"\ 'blocklist': ['html', 'rl'],
"\ 'completor': function('asyncomplete#sources#omni#completor'),
"\ 'config': {
"\   'show_source_kind': 1 
"\ }
"\ }))

" Add `o` kind label to `'menu'`
