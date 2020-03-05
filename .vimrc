" PLUGINS

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'frazrepo/vim-rainbow'
let g:rainbow_active = 1

Plugin 'itchyny/lightline.vim'
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'preservim/nerdcommenter'
Plugin 'mileszs/ack.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'tpope/vim-fugitive'


call vundle#end()            " required
filetype plugin indent on    " required


" VISUAL "

set number 
set relativenumber
set laststatus=2

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
