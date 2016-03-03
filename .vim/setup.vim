set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'Shougo/vimproc'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'godlygeek/tabular'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
"Plug 'Shougo/neocomplete.vim'
"Plug 'Shougo/neosnippet.vim'
"Plug 'Shougo/neosnippet-snippets'
"Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
"Plug 'vim-scripts/closetag.vim'
Plug 'Raimondi/delimitMate'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'jpalardy/vim-slime'
Plug 'majutsushi/tagbar'
Plug 'dbeecham/ctrlp-commandpalette.vim'
Plug 'vim-scripts/restore_view.vim'
Plug 'mhinz/vim-signify'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'benekastah/neomake'
Plug 'tpope/vim-fugitive'
Plug 'amiorin/vim-project'
Plug 'mhinz/vim-startify'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'kshenoy/vim-signature'

" visual
Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'edkolev/promptline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'enomsg/vim-haskellConcealPlus'
Plug 'terryma/vim-multiple-cursors'

" languages
Plug 'lambdatoast/elm.vim'
Plug 'raichoo/purescript-vim'
Plug 'vim-scripts/VimClojure'
Plug 'kchmck/vim-coffee-script'
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'
Plug 'dag/vim-fish'
Plug 'LnL7/vim-nix'
Plug 'rust-lang/rust.vim'
Plug 'derekwyatt/vim-scala'
Plug 'dansomething/vim-eclim'

" build systems
Plug 'mklabs/grunt.vim'
Plug 'tpope/vim-dispatch'

call plug#end()
