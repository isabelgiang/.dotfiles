call plug#begin(stdpath('data') . '/plugged')
Plug 'morhetz/gruvbox'
Plug 'romainl/flattened'
Plug 'davidhalter/jedi-vim'
Plug 'vim-latex/vim-latex'
Plug 'rust-lang/rust.vim'

call plug#end()
syntax on
filetype plugin indent on
set termguicolors
color gruvbox

set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set smartindent
set smarttab
