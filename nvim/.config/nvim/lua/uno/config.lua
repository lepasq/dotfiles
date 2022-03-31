-- Global Options
-- vim.go.guicursor    = "block"
vim.go.termguicolors  = true
vim.go.hlsearch       = false
vim.go.hidden         = true
vim.go.errorbells     = false
vim.go.ignorecase     = true
vim.go.smartcase      = true
vim.go.scrolloff      = 12
vim.go.sidescrolloff  = 21
--  vim.go.completeopt  = "menuone,noinsert,preview"
vim.go.completeopt    = "menuone,noselect" 
vim.go.cmdheight      = 2
vim.go.mouse          = "a"
vim.go.clipboard      = "unnamedplus"
vim.go.wildmenu       = true
vim.go.wildmode       = "longest,list,full"
vim.go.undodir        = ".vim/undodir"
vim.go.backupdir      = ".vim/backups"
vim.go.backup         = true
vim.go.updatetime     = 100
vim.go.fillchars      = "eob: "

-- Window Options
vim.wo.relativenumber = true
vim.wo.nu             = true
vim.wo.wrap           = true
vim.wo.colorcolumn    = "100"
vim.wo.signcolumn     = "yes"
vim.wo.foldcolumn     = "2"

-- Buffer Options
vim.bo.tabstop        = 4
vim.bo.softtabstop    = 4
vim.bo.shiftwidth     = 4
vim.bo.expandtab      = true
vim.bo.smartindent    = true
vim.bo.swapfile       = false
vim.bo.undofile       = true

-- Global Variables
vim.g.mapleader            = " "
vim.g.python3_host_prog    = "/usr/bin/python3"
vim.g.NERDCreateDefaultMappings = 0
-- vim.g.colorizer_auto_color = 1  -- might not be needed

vim.cmd [[
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
]]

-- hide line numbers , statusline in specific buffers!
vim.api.nvim_exec(
    [[
   au BufEnter * highlight Normal guibg=0
   au BufEnter term://* setlocal nonumber
   au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif
   au BufEnter term://* set laststatus=0 

]],
    false
)

-- Format HTML on save
vim.api.nvim_exec([[ autocmd BufWritePre *.html :silent! Neoformat ]], false)

-- Format SQL on save
vim.api.nvim_exec([[ autocmd BufWritePre *.sql :silent! Neoformat pg_format ]], false)
