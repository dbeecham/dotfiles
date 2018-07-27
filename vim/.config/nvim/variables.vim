" enable syntax highlighting
if exists(":syntax")
    syntax enable
endif

" CTRL-d and CTRL-u scroll by 6 lines
set scroll=6

" not compatible with vi
set nocompatible


if has('mouse')
    " I scroll sometimes
    set mouse=a
endif

" Show fold information in gutter
set foldcolumn=1

" Show mode ("-- INSERT --")
set showmode

" Global indent settings, overridden in autocmds
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set autoindent
set nosmartindent  " smartindent makes comments in python ignore indentation rules

" Don't automatically wrap
set nowrap

" Show statusline
set laststatus=2

" Search settings
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase

" Allow backspace over eol,tabs
set backspace=2

" Show (partial) commands
set showcmd

" Let vim set title
set title

" min width for current window
set winwidth=80
" min width, not current window
set winminwidth=20
" min height for current window
set winheight=12
" min height, not current window
set winminheight=4

" Emacs-style, Bash-like tab completion
set wildmode=longest:full,full
set wildmenu

" Same with ctrln, ctrlp
set completeopt=longest,menu

" Keep a viminfo file
set viminfo='20,\"500   " Keep a .viminfo file.

" When doing tab completion, give the following files lower priority. You may
" wish to set 'wildignore' to completely ignore files, and 'wildmenu' to enable
" enhanced tab completion. These can be done in the user vimrc file.
set suffixes+=.info,.aux,.log,.dvi,.bbl,.out,.o,.lo

" When doing CTRL-R CTRL-F to expand current filename, I had the issue that
" file names were VARIABLE=/path/im/interested/in. Making = not part of file
" names makes these expansions work properly.
set isfname-==

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class

" number on by default
set number

" and relative numbers if support exists
if v:version >= 703
    set relativenumber
endif

" When displaying line numbers, don't use an annoyingly wide number column. This
" doesn't enable line numbers -- :set number will do that. The value given is a
" minimum width to use for the number column, not a fixed size.
if v:version >= 700
    set numberwidth=3
endif


if exists(":filetype")
    " Filetype plugin settings
    filetype plugin indent on
endif
