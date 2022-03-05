" IMPORTANT CONFIGS "
set nocompatible              " be iMproved, required
filetype plugin on                  " required
let mapleader=" "


" PLUGINS
call plug#begin()

" File management
Plug 'preservim/NERDTree'
Plug 'mhinz/vim-startify'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

  " Git
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'


" Debugging
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

" Misc
Plug 'folke/which-key.nvim'
Plug 'preservim/nerdcommenter'
Plug 'rbgrouleff/bclose.vim'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update


  " Themes
Plug 'gruvbox-community/gruvbox'
Plug 'dylanaraps/wal.vim'


  " Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

  " Language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go'
Plug 'shime/vim-livedown'
Plug 'hashivim/vim-terraform'


  " Visual
Plug 'chrisbra/colorizer'
Plug 'ryanoasis/vim-devicons'
call plug#end()


set number
set relativenumber
set laststatus=2
set t_Co=256
set noswapfile
"set termguicolors

colorscheme wal
set background=dark
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'soft'
let g:gruvbox_inverted_selections='0'

syntax on
filetype on
filetype indent on
filetype plugin on
set clipboard=unnamedplus

set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent

set ignorecase
set smartcase
set incsearch
set hlsearch

" AIRLINE
" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" enable powerline fonts
 let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Switch to your current theme
let g:airline_theme = 'wal'

" Always show tabs
set showtabline=2

" We don't need to see things like -- INSERT -- anymore
set noshowmode

autocmd StdinReadPre * let s:std_in=1

" colorizer active by default in html&css, otherwise :ColorHighlight manually
let g:colorizer_auto_filetype='css,html'

  " Simplify split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


  " More natural splits
set splitbelow          " Horizontal split below current
set splitright          " Vertical split to right of current

set backspace=indent,eol,start

" Common fixes
nmap Q <Nop>
nmap <F1> <nop>
imap <F1> <nop>
nmap K <nop>

nmap <C-P> <nop>
imap <C-P> <nop>

" Move lines around
nnoremap <silent><A-j> :m .+1<CR>==
nnoremap <silent><A-k> :m .-2<CR>==
inoremap <silent><A-j> <Esc>:m .+1<CR>==gi
inoremap <silent><A-k> <Esc>:m .-2<CR>==gi
vnoremap <silent><A-j> :m '>+1<CR>gv=gv
vnoremap <silent><A-k> :m '<-2<CR>gv=gv

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

  " Open NERDTree on the side like in most IDEs/Editors
map <Leader>pt :NERDTreeToggle <CR> :vertical resize 25<CR>

" Move by line
"nnoremap j gj
"nnoremap k gk

" Go to column, not just line
nnoremap ' `

  " Set Spellchecking keybinding
map <F6> :setlocal spell! spelllang=en_us<CR>


  " Remove trailing whitespace on save
autocmd BufWritePre *.tex %s/\s\+$//e

  " Remap Y to behave like C and D
nmap Y y$

"better visual
vnoremap < <gv
vnoremap > >gv


" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Close all buffers except this one
command! BufCloseOthers %bd|e#

nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>bad :BufCloseOthers<CR>

" alias :Q and :W to :q and :w respectively
command! Q q
command! W w


  " MARKDOWN PREVIEW

  " should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0
  " should the browser window pop-up upon previewing
let g:livedown_open = 1
let g:livedown_port = 1337
let g:livedown_browser = $BROWSER


" Find files using Telescope command-line sugar.
nnoremap <leader>gf <cmd>Telescope find_files<cr>
nnoremap <Leader>ff <cmd>lua require'telescope.builtin'.git_files{}<CR>

nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <Leader>gg <cmd>lua require'telescope.builtin'.git_files{}<CR> " to be replaced by git grep in the future

nnoremap <Leader>; <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>



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

 " Fugitive
map <leader>gs :Gdiff<CR>
map <leader>gb :Git blame<CR>


 " Go
 " Import missing packages on save
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_textobj_enabled = 0


" Debugger remaps
nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint


 " Nerdcommenter
" nmap <C-_> <plug>NERDCommenterToggle
" vmap <C-_> <plug>NERDCommenterToggle
" Doesn't work -> use <leader>c<leader>



if has('nvim')
	nnoremap <silent><A-t> :call TermToggle(12)<CR>
	inoremap <silent><A-t> <Esc>:call TermToggle(12)<CR>
	tnoremap <silent><A-t> <C-\><C-n>:call TermToggle(12)<CR>
	nnoremap <silent><A-r> :call TermToggle(50)<CR>
	inoremap <silent><A-r> <Esc>:call TermToggle(50)<CR>
	tnoremap <silent><A-r> <C-\><C-n>:call TermToggle(50)<CR>
endif


" Terminal Function
    let s:term_buf = 0
    let s:term_win = 0

    function! TermToggle(height)
        if win_gotoid(s:term_win)
            hide
        else
            new terminal
            exec "resize ".a:height
            try
                exec "buffer ".s:term_buf
                exec "bd terminal"
            catch
                call termopen($SHELL, {"detach": 0})
                let s:term_buf = bufnr("")
                setlocal nonu nornu scl=no nocul
            endtry
            startinsert!
            let s:term_win = win_getid()
        endif
    endfunction

