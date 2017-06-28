call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'flazz/vim-colorschemes'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'eagletmt/neco-ghc'
Plug 'vim-syntastic/syntastic'


" I've had issues with ultisnips snippets not showing up on tab completion;
" adding supertab to fix this.
Plug 'ervandew/supertab'

" To ease installation of vim/nvim, this plugin can install python libraries
" automatically.
Plug 'roxma/python-support.nvim'

" we need neovim python library on neovim
if has('nvim')
    let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'neovim')
    let g:python_support_python2_requirements = add(get(g:,'python_support_python3_requirements',[]),'neovim')
endif

" Trying this out as an alternative to YouCompleteMe
" YouCompleteMe is great, but it's a bit big, and takes a bit too long to
" set up.
Plug 'roxma/nvim-completion-manager'

" nvim-completion-manager has some python requirements...

" for python completions
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'jedi')
" language specific completions on markdown file
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'mistune')
" utils, optional
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'psutil')
let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'setproctitle')


" nvim-completion-manager has support for vim, but requires vim 8 with
" has('python') or has('python3'), and also requires the following plugin:
" Requires vim8 with has('python') or has('python3')
" Requires the installation of msgpack-python. (pip install msgpack-python)
if !has('nvim')
    Plug 'roxma/vim-hug-neovim-rpc'
endif

" Highlight marks in gutter. This makes marks usable, basically.
Plug 'kshenoy/vim-signature'

" Trying this out as an alternative for vim-easytags. This is supposedly
" asynchronous by default, has support for nvim-completion-manager,
" and gives me a reason to try gtags.
if executable('global')
    " disable ctags
    let g:loaded_gentags#ctags = 1

    " enable gtags
    let g:loaded_gentags#gtags = 0

    " enable gen_tags plugin
    Plug 'jsfaint/gen_tags.vim'
elseif executable('ctags')
    " disable ctags
    let g:loaded_gentags#ctags = 0

    " enable gtags
    let g:loaded_gentags#gtags = 1

    " enable gen_tags plugin
    Plug 'jsfaint/gen_tags.vim'
endif

" Remembers and restores last cursor position.
" Probably OK - the builtin functionality would
" mean some vim config anyway, and it does not open
" folds.
Plug 'farmergreg/vim-lastplace'


" Jag har kört utan vim-fugitive ett tag nu,
" men den gör väldigt stor skillnad till ens workflow,
" så jag vill ha den.
Plug 'tpope/vim-fugitive'


" vim-slime. Very useful.
" The easiest way to use this is to fire up tmux, and do a
" <C-a> :, followed by "list-panes<cr>". Look at the ID of the
" pane you have your CLI in (probably "%1").
" When you slime using <C-c><C-c>, use "%1" as slime target.
Plug 'jpalardy/vim-slime'

" writing tables is sometimes needed, and writing them yourself
" is a real PITA.
Plug 'dhruvasagar/vim-table-mode'

call plug#end()
