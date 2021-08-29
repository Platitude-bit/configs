let mapleader=" "

call plug#begin('~/.config/nvim/plugged')

Plug 'Raimondi/delimitMate' 
Plug 'tpope/vim-surround'
Plug 'ap/vim-css-color'

call plug#end()

set nu
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noswapfile
set splitbelow splitright
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
set wildmode=longest,list,full
set guicursor=i:block
set clipboard+=unnamedplus
hi Comment ctermfg=green
