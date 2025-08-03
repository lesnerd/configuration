syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set hlsearch
set ruler
highlight Comment ctermfg=green

call plug#begin('~/.vim/plugged')

" Install NERDTree
Plug 'preservim/nerdtree'

" (Optional) Add some useful icons
Plug 'ryanoasis/vim-devicons'

call plug#end()
