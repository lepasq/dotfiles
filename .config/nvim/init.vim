" IMPORTANT CONFIGS "
set nocompatible              " be iMproved, required
filetype plugin on                  " required
let mapleader=" "


" PLUGINS
call plug#begin()

" File management
Plug 'preservim/NERDTree'
Plug 'francoiscabrol/ranger.vim'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

  " Git
Plug 'itchyny/vim-gitbranch'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mhinz/vim-signify'

  " Misc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'shime/vim-livedown'
Plug 'mileszs/ack.vim'
Plug 'preservim/nerdcommenter'
Plug 'rbgrouleff/bclose.vim'

  " Practice
Plug 'ThePrimeagen/vim-be-good'

  " Themes
Plug 'gruvbox-community/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'iCyMind/NeoSolarized'
Plug 'dylanaraps/wal.vim'

  " Bar
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
Plug 'sainnhe/gruvbox-material'

  " Visual
Plug 'chrisbra/colorizer'
Plug 'ryanoasis/vim-devicons'
call plug#end()


" VISUAL "

set number
set relativenumber
set laststatus=2
set t_Co=256
let g:rainbow_active = 1
set noshowcmd
set termguicolors

colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_contrast_light = 'soft'
let g:gruvbox_inverted_selections='0'

let g:lightline = {
      \ 'colorscheme': 'gruvbox_material',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }


autocmd StdinReadPre * let s:std_in=1


" EDITS "

syntax on
filetype on
filetype indent on
filetype plugin on
set clipboard=unnamedplus



" INDENTATION "

set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent



" SEARCH "
set ignorecase
set smartcase
set incsearch
set hlsearch

" SPLIT "

  " Simplify split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


  " More natural splits
set splitbelow          " Horizontal split below current
set splitright          " Vertical split to right of current


set backspace=indent,eol,start
nmap Q <Nop>


  " Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>


  " Change NERDTree Keybindings

silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>

let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"


  " Open NERDTree on the side like in most IDEs/Editors
map <Leader>pt :NERDTree <CR> :vertical resize 20<CR>

:
  " Set Spellchecking keybinding
map <F6> :setlocal spell! spelllang=en_us<CR>


  " Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

  " Remap Y to behave like C and D
nmap Y y$


" HTML keybindings

  " Skip to next <++> with double comma
  " Change to d4l, to stay in normal mode after double space
autocmd FileType html inoremap ,, <Esc>/<++><Enter>"_c4l

  " Generate <tag></tag> keybindings
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
let g:livedown_browser = $BROWSER



" FZF

nnoremap <Leader>pg :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader>pc :Colors<CR>
nnoremap <Leader>pw :Windows<CR>


" COC

nmap <leader>rr <Plug>(coc-rename)
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart
