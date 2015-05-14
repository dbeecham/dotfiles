set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'Shougo/vimproc'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'godlygeek/tabular'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'vim-scripts/closetag.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'jpalardy/vim-slime'
Plug 'majutsushi/tagbar'
Plug 'dbeecham/ctrlp-commandpalette.vim'
Plug 'vim-scripts/restore_view.vim'

" visual
Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'edkolev/promptline.vim'

" languages
Plug 'lambdatoast/elm.vim'
Plug 'raichoo/purescript-vim'
Plug 'vim-scripts/VimClojure'
Plug 'kchmck/vim-coffee-script'
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'

" build systems
Plug 'mklabs/grunt.vim'
Plug 'tpope/vim-dispatch'

call plug#end()
