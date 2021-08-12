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

" Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set smarttab	

if has("autocmd")
    " If the filetype is Makefile, do not expand tabs into spaces
    autocmd FileType make set noexpandtab
endif

set undolevels=1000	
set backspace=indent,eol,start	

filetype plugin on
let g:tex_flavor='latex'
let g:asyncrun_open = 6

" Install vim-plug if it hasn't been installed yet
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install sierra colorscheme if it doesn't exist yet
if empty(glob('~/.vim/colors/sierra.vim'))
    silent !curl -fLo ~/.vim/colors/sierra.vim --create-dirs
        \ https://raw.githubusercontent.com/AlessandroYorba/Sierra/master/colors/sierra.vim
endif

call plug#begin('~/.vim/plugged')

" Plug 'davidhalter/jedi-vim'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" TypeScript
Plug 'leafgarland/typescript-vim'

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components'


" Python
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }

" LaTeX
Plug 'vim-latex/vim-latex'

" Golang
Plug 'fatih/vim-go'

" Rust
Plug 'rust-lang/rust.vim'

" Racket
Plug 'wlangstroth/vim-racket'

" C#
Plug 'OmniSharp/omnisharp-vim'

" AutoComplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" YCM vim-plug support: https://github.com/ycm-core/YouCompleteMe/issues/1751
" Uninstalling due to being poorly performing. Maybe try again later...
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Terraform
Plug 'hashivim/vim-terraform'

" C/C++
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }

" Task system for edit-compile-test cycle
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'


call plug#end()

" add Motorola 68000 syntax highlights to Easy68k file extensions
augroup filetypedetect
    au BufRead,BufNewFile *.X68 setfiletype asm68k
    au BufRead,BufNewFile *.X68 setfiletype asm68k
augroup END

filetype plugin indent on
syntax on
colorscheme sierra


