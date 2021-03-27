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
 
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set smartindent
set smarttab	
 
set undolevels=1000	
set backspace=indent,eol,start	

filetype plugin on
let g:tex_flavor='latex'

" Install vim-plug if it doesn't installed yet
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'rust-lang/rust.vim'
Plug 'davidhalter/jedi-vim'
Plug 'fatih/vim-go'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'romainl/flattened'
Plug 'morhetz/gruvbox'
Plug 'vim-latex/vim-latex'
Plug 'rust-lang/rust.vim'

call plug#end()

filetype plugin indent on
syntax on
colorscheme sierra
