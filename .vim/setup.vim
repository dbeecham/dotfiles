call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'flazz/vim-colorschemes'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'eagletmt/neco-ghc'
Plug 'vim-syntastic/syntastic'

" Remembers and restores last cursor position.
" Probably OK - the builtin functionality would
" mean some vim config anyway, and it does not open
" folds.
Plug 'farmergreg/vim-lastplace'
call plug#end()
