" plug:vim-slime

if exists(":let")

" netrw settings
" use tree view
let g:netrw_liststyle=3
" netrw can occupy 20% of vim window
let g:netrw_winsize=20
" disable banner
let g:netrw_banner = 0
" make netrw split to 'open previous window' when opening file
let g:netrw_browse_split = 4

" Set up slime to use tmux instead of screen which is default.
let g:slime_target = "tmux"

" As of tmux 2.2, tmux does no longer accept input from stdin;
" instead, a file needs to be used as pipe. See
" https://github.com/jpalardy/vim-slime.
let g:slime_paste_file = "$HOME/.slime_paste"


" Tell neosnippet about my snippets
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#neosnippets_directory='~/.vim/plugged/vim-snippets/snippets'

" I dont care about cscope updating my db
let g:cscope_silent = 1


" if table mode uses <leader>t, then <leader>t is slow, because it's waiting
" for possible input...
" <tm_prefix>m starts table mode
let g:table_mode_map_prefix = "<Leader>m"

" This is here to make table mode do rst tables.
" TODO: move this out to a filetype-specific place.
let g:table_mode_corner_corner='|'
"let g:table_mode_header_fillchar='='

" dont use cache dir for gen_tags - it puts the ctags in
" ~/.cache/tags_dir/something/prj_tags, but I havent looked into getting fzf
" to find this file.
let g:gen_tags#use_cache_dir = 0

" let fzf ignore files specified in gitinore
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Use syntax highlighting in in code blocks in markdown
let g:markdown_fenced_languages = ['c']
let g:markdown_minlines = 1000

" asyncomplete
let g:asyncomplete_auto_popup = 1
"let g:asyncomplete_auto_completeopt = 1
"set completeopt=menuone,noinsert,noselect,preview
" automatically close the preview when done
"autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

endif
