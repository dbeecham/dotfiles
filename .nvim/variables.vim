" utf-8

scriptencoding utf-8
set encoding=utf-8

" let g:airline_theme='bubblegum'

let g:AutoCloseExpandSpace = 0 " make iabbrev work again

" Not compatible with vi
set nocompatible

" Autoclose is off by default
let g:AutoCloseOn=0

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
"set cursorline cursorcolumn
"set cursorline

" Switching between buffers
set switchbuf=usetab

" number on by default
set number
set relativenumber

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

" Allow backspace over eol,tabs
set backspace=2

" Show (partial) commands
set showcmd

" Syntax highlighting / colors
if &t_Co > 2 || has("gui_running")
    syntax on
    set background=light
    set hlsearch
    "    color github
    if $TERM ==? "xterm-256color" || $TERM ==? "rxvt-256color"
    "    set t_Co=256
        "color grb256
    endif
endif

" Ruler is enabled (whenever statusline is not set)
set ruler

" Foldings set to marker (changed using autocmds)
set foldmethod=marker
set foldnestmax=2

" Text width
set textwidth=80

" Let vim set title
set title

" Emacs-style, Bash-like tab completion
set wildmode=longest:full,full
set wildmenu

" Same with ctrln, ctrlp
set completeopt=longest,menu

" Characters to use to represent hidden characters
set listchars=tab:»·,trail:·,extends:>,eol:$ " unicode
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
filetype plugin indent on

" vimclojure
let vimclojure#HighlightBuiltins = 1
let vimclojure#ParenRainbow = 1

" show mode
set showmode

let g:haddock_browser = "elinks"

" powerline fonts
let g:airline_powerline_fonts = 1

" vim-slime
let g:slime_target = "tmux"

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" show tab bar
set showtabline=2

" dark colors
"hi TabLineFill ctermfg=234
" disable the underline behind tabline words
"hi TabLine term=NONE cterm=NONE
"hi CursorLine term=NONE cterm=NONE ctermbg=234
"hi CursorColumn term=NONE cterm=NONE ctermfg=234
"hi LineNr ctermfg=244 ctermbg=234
"hi CursorLineNr ctermfg=244 ctermbg=235
"hi VertSplit ctermfg=247 ctermbg=234 cterm=NONE
"hi NonText ctermfg=231

" light colors
"hi TabLineFill ctermfg=255 ctermbg=255
" disable the underline behind tabline words
"hi TabLine term=NONE cterm=NONE
"hi CursorLine term=NONE cterm=NONE ctermbg=255
"hi CursorColumn term=NONE cterm=NONE ctermfg=255
"hi LineNr ctermfg=240 ctermbg=255
"hi CursorLineNr ctermfg=240 ctermbg=254
"hi VertSplit ctermfg=240 ctermbg=255 cterm=NONE
""hi NonText ctermfg=255
