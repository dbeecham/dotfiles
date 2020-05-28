if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': {'cache': {'directory': '/tmp/ccls/cache' }},
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })

    set foldmethod=expr foldexpr=lsp#ui#vim#folding#foldexpr() foldtext=lsp#ui#vim#folding#foldtext()


    " for fzf_ext cscope
    " find c Symbol
    nnoremap <silent> <Leader>cs :LspDeclaration<CR>
    " find function Definition
    nnoremap <silent> <Leader>cd :LspDefinition<CR>
    " Peek definition
    nnoremap <silent> <Leader>cp :LspPeekDefinition<CR>
    " find functions called by
    nnoremap <silent> <Leader>cx :call Cscope('2', expand('<cword>'))<CR>
    " find functions calling
    nnoremap <silent> <Leader>cc :call Cscope('3', expand('<cword>'))<CR>
    " find Text string
    nnoremap <silent> <Leader>ct :call Cscope('4', expand('<cword>'))<CR>
    " Egrep
    nnoremap <silent> <Leader>ce :call Cscope('6', expand('<cword>'))<CR>
    " find File
    nnoremap <silent> <Leader>cf :call Cscope('7', expand('<cword>'))<CR>
    " Including this file
    nnoremap <silent> <Leader>ci :call Cscope('8', expand('<cword>'))<CR>
    " assignments To this
    nnoremap <silent> <Leader>ct :call Cscope('9', expand('<cword>'))<CR>
    " find all c Symbol
    nnoremap <silent> <Leader>cas :call CscopeQuery('0')<CR>
    " find all function Definition
    nnoremap <silent> <Leader>cad :call CscopeQuery('1')<CR>
    " find all functions called by
    nnoremap <silent> <Leader>cax :call CscopeQuery('2')<CR>
    " find all functions calling
    nnoremap <silent> <Leader>cac :call CscopeQuery('3')<CR>
    " find all Text string
    nnoremap <silent> <Leader>cat :call CscopeQuery('4')<CR>
    " all Egrep
    nnoremap <silent> <Leader>cae :call CscopeQuery('6')<CR>
    " all find File
    nnoremap <silent> <Leader>caf :call CscopeQuery('7')<CR>
    " all Including this file
    nnoremap <silent> <Leader>cai :call CscopeQuery('8')<CR>
    " all assignments To this
    nnoremap <silent> <Leader>cat :call CscopeQuery('9')<CR>

else

    " for fzf_ext cscope
    " find c Symbol
    nnoremap <silent> <Leader>cs :call Cscope('0', expand('<cword>'))<CR>
    " find function Definition
    nnoremap <silent> <Leader>cd :call Cscope('1', expand('<cword>'))<CR>
    " find functions called by
    nnoremap <silent> <Leader>cx :call Cscope('2', expand('<cword>'))<CR>
    " find functions calling
    nnoremap <silent> <Leader>cc :call Cscope('3', expand('<cword>'))<CR>
    " find Text string
    nnoremap <silent> <Leader>ct :call Cscope('4', expand('<cword>'))<CR>
    " Egrep
    nnoremap <silent> <Leader>ce :call Cscope('6', expand('<cword>'))<CR>
    " find File
    nnoremap <silent> <Leader>cf :call Cscope('7', expand('<cword>'))<CR>
    " Including this file
    nnoremap <silent> <Leader>ci :call Cscope('8', expand('<cword>'))<CR>
    " assignments To this
    nnoremap <silent> <Leader>ct :call Cscope('9', expand('<cword>'))<CR>
    " find all c Symbol
    nnoremap <silent> <Leader>cas :call CscopeQuery('0')<CR>
    " find all function Definition
    nnoremap <silent> <Leader>cad :call CscopeQuery('1')<CR>
    " find all functions called by
    nnoremap <silent> <Leader>cax :call CscopeQuery('2')<CR>
    " find all functions calling
    nnoremap <silent> <Leader>cac :call CscopeQuery('3')<CR>
    " find all Text string
    nnoremap <silent> <Leader>cat :call CscopeQuery('4')<CR>
    " all Egrep
    nnoremap <silent> <Leader>cae :call CscopeQuery('6')<CR>
    " all find File
    nnoremap <silent> <Leader>caf :call CscopeQuery('7')<CR>
    " all Including this file
    nnoremap <silent> <Leader>cai :call CscopeQuery('8')<CR>
    " all assignments To this
    nnoremap <silent> <Leader>cat :call CscopeQuery('9')<CR>

endif


