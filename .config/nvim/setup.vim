if exists(":call")
    call plug#begin('~/.config/nvim/plugged')
endif

if exists("g:loaded_plug")
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
" I've replaced this with vim's 'views'. They are
" pretty cool. Here's how you would use them:
" You can make a view using :mkview. This will by default create a view in
" 'viewdir'. Then, you can open up that view using :loadview. This can be
" automated using an autocmd group (augroup) like this:
"     augroup myview
"         autocmd!
"         autocmd BufWinLeave *.py mkview
"         autocmd BufWinEnter *.py silent! loadview
"     augroup END
" NOTE: 'viewoptions' control what get's saved in a view. This can include the
" 'options' key, which will also save your key maps! I find this pretty wierd;
" then, when you change your binds in .vimrc, they won't apply in
" already-opened files. You can fix this behaviour by setting
"     set viewoptions-=options
"
" Another nifty feature is vim's sessions. They can be created using
" :mksession. That will create a Session.vim in the current directory. Then,
" you can run 'vim -S Session.vim' to open up that session again - complete
" with tabs, window splits, function definitions and everything else you could
" wish. One important note though: vim sessions create views as well, and
" thus also 'suffer' from the above 'options saves keymaps' problem.
" Plug 'farmergreg/vim-lastplace'


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

" searching for a word, then mistyping, you'll get send back to
" where you began. I find that pretty annoying.
Plug 'haya14busa/incsearch.vim'

call plug#end()

endif
