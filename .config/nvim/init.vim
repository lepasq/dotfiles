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
Plug 'shime/vim-livedown'
Plug 'morhetz/gruvbox'
Plug 'itchyny/vim-gitbranch'
call plug#end()


" VISUAL "


set number
set relativenumber
set laststatus=2
set t_Co=256
let g:rainbow_active = 1
set noshowcmd

colorscheme gruvbox
set background=dark


let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
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


" Simplify split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

set backspace=indent,eol,start
nmap Q <Nop>
silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>


 " Change NERDTree Keybindings
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"


" Set Spellchecking keybinding
map <F6> :setlocal spell! spelllang=en_us<CR>


" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e


" HTML keybindings
" Change to d4l, to stay in normal mode after double space
autocmd FileType html inoremap <Space><Space> <Esc>/<++><Enter>"_c4l

autocmd FileType html inoremap ;p <p></p><Enter><++><Esc>ki
autocmd FileType html inoremap ;b <b></b><Space><++><Esc>FbT>i
autocmd FileType html inoremap ;1 <h1></h1><Enter><++><Esc>kli
autocmd FileType html inoremap ;d <div></div><Enter><++><Esc>k2li


" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0

" should the browser window pop-up upon previewing
let g:livedown_open = 1

" the port on which Livedown server will run
let g:livedown_port = 1337

" the browser to use, can also be firefox, chrome or other, depending on your executable
let g:livedown_browser = "firefox"

