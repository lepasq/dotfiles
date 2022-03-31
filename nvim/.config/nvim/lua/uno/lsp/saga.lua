-- LSP Saga
require("lspsaga").init_lsp_saga(
    {
        use_saga_diagnostic_sign = true,
        error_sign = "",
        warn_sign = "",
        hint_sign = "",
        infor_sign = "",
        diagnostic_header_icon = "   ",
        code_action_icon = " ",
        code_action_prompt = {
            enable = true,
            sign = true,
            sign_priority = 20,
            virtual_text = true
        },
        finder_definition_icon = "  ",
        finder_reference_icon = "  ",
        max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
        finder_action_keys = {
            open = "o",
            vsplit = "s",
            split = "i",
            quit = "q",
            scroll_down = "<C-f>",
            scroll_up = "<C-b>" -- quit can be a table
        },
        code_action_keys = {
            quit = "q",
            exec = "<CR>"
        },
        rename_action_keys = {
            quit = "<C-c>",
            exec = "<CR>" -- quit can be a table
        },
        definition_preview_icon = "  ",
        -- "single" "double" "round" "plus"
        border_style = "single",
        rename_prompt_prefix = "➤"
        -- if you don't use nvim-lspconfig you must pass your server name and
        -- the related filetypes into this table
        -- like server_filetype_map = {metals = {'sbt', 'scala'}}
        -- server_filetype_map = {}
    }
)

vim.api.nvim_set_keymap("n", "gh", ":lua require'lspsaga.provider'.lsp_finder()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap(
    "n",
    "<Leader>ca",
    ":lua require('lspsaga.codeaction').code_action()<CR>",
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    "v",
    "<Leader>ca",
    ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>",
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    "n",
    "H",
    ":lua require('lspsaga.hover').render_hover_doc()<CR>",
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    "n",
    "<C-f>",
    ":lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>",
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    "n",
    "<C-b>",
    ":lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>",
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    "n",
    "gs",
    ":lua require('lspsaga.signaturehelp').signature_help()<CR>",
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    "n",
    "<Leader>gd",
    ":lua require'lspsaga.provider'.preview_definition()<CR>",
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    "n",
    "<Leader>cd",
    ":lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>",
    {noremap = true, silent = true}
)
