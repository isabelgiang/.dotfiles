set number	
set linebreak	
set showbreak=+++	
set textwidth=100	
set showmatch	 
set visualbell 
 
set hlsearch	
set smartcase	
set ignorecase	
set incsearch	
 
set autoindent	
set smarttab	
set softtabstop=4	
 
set undolevels=1000	
set backspace=indent,eol,start	

filetype plugin on
let g:tex_flavor='latex'


call plug#begin('~/.vim/plugged')

Plug 'rust-lang/rust.vim'
Plug 'davidhalter/jedi-vim'
Plug 'fatih/vim-go'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

