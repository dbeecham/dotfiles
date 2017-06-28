call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'flazz/vim-colorschemes'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'eagletmt/neco-ghc'
Plug 'vim-syntastic/syntastic'

" Highlight marks in gutter. This makes marks usable, basically.
Plug 'kshenoy/vim-signature'

" vim-misc is needed for vim-easytags.
Plug 'xolox/vim-misc'

" generating tags is annoying;
" automatically generate them with vim-easytags.
Plug 'xolox/vim-easytags'

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
