" utf-8
scriptencoding utf-8
set encoding=utf-8

" Not compatible with vi
set nocompatible

" Show mode ("-- INSERT --")
set showmode

" Allow unsaved background buffers and remember marks/undo for them
set hidden

" History
set history=10000

" Global indent settings, overridden in autocmds
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set autoindent
set smartindent

" Don't automatically wrap
set nowrap

" Show statusline
set laststatus=2

" Search settings
set showmatch
set incsearch
" set hlsearch " set at syntax settings
set ignorecase
set smartcase

" Show cursor line, column
set cursorline cursorcolumn

" Switching between buffers
set switchbuf=usetab

" No numbers by default
set nonumber

" Tab line visible when more then one tab is open
set showtabline=1

" Minimum window size
set winwidth=80

" Stop clearing screen at exit
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

" Keep more context when working off the end of a buffer
set scrolloff=3

" Keep backups (always a good idea.)
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Allow backspace over everything
set backspace=2

" Show (partial) commands
set showcmd

" Syntax highlighting / colors
if &t_Co > 2 || has("gui_running")
    syntax on
    set background=dark
    set hlsearch
    if $TERM ==? "xterm-256color" || $TERM ==? "rxvt-256color"
        set t_Co=256
        color grb256
    endif
endif

" Ruler is enabled (whenever statusline is not set)
set ruler

" Foldings set to marker (changed using autocmds)
set foldmethod=marker

" Text width
set textwidth=80

" Let vim set title
set title

" Emacs-style, Bash-like tab completion
set wildmode=longest,list
set wildmenu

" Characters to use to represent hidden characters
set listchars=tab:»·,trail:·,extends:> " unicode
"set listchars=tab:.\ ,trail:~,extends:> " ascii

" Keep a viminfo file
set viminfo='20,\"500   " Keep a .viminfo file.

" When doing tab completion, give the following files lower priority. You may
" wish to set 'wildignore' to completely ignore files, and 'wildmenu' to enable
" enhanced tab completion. These can be done in the user vimrc file.
set suffixes+=.info,.aux,.log,.dvi,.bbl,.out,.o,.lo

" When displaying line numbers, don't use an annoyingly wide number column. This
" doesn't enable line numbers -- :set number will do that. The value given is a
" minimum width to use for the number column, not a fixed size.
if v:version >= 700
    set numberwidth=3
endif

" NERDTree settings
let NERDTreeWinSize=18
let NERDTreeWinPos="right"
let NERDTreeMinimalUI=1

" Filetype plugin settings
if isdirectory(expand("$VIMRUNTIME/ftplugin"))
    filetype plugin on
    filetype indent on
endif
