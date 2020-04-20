" PLUGINS

set nocompatible              " be iMproved, required
filetype plugin on                  " required

call plug#begin()
Plug 'preservim/NERDTree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdcommenter'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-signify'
call plug#end()


" VISUAL "

set number 
set relativenumber
set laststatus=2
set t_Co=256
let g:rainbow_active = 1

let g:lightline = {
      \ 'colorscheme':'powerline',
      \ }



autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" EDITS "

syntax on
filetype on
filetype indent on
filetype plugin on

set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4

" SEARCH "

set ignorecase
set smartcase
set incsearch
set hlsearch


" KEYBINDINGS "

set backspace=indent,eol,start
nmap Q <Nop>
silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>

let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"
