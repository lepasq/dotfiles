function common_on_attach(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = {noremap = true, silent = true}

    buf_set_keymap("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts)
    -- buf_set_keymap("n", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<leader>wa", ":lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<leader>wr", ":lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<leader>wl", ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    buf_set_keymap("n", "<leader>D", ":lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<leader>e", ":lua vim.diagnostic.open_float()<CR>", opts)
    buf_set_keymap("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<leader>q", ":lua vim.diagnostic.set_loclist()<CR>", opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<leader>f", ":lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<leader>f", ":lua vim.lsp.buf.range_formatting()<CR>", opts)
    else
        buf_set_keymap("n", "<leader>f", ":Neoformat<CR>", opts)
    end

    -- Seems redundant with LSP Saga Signature Help
    -- require "lsp_signature".on_attach(
    --     {
    --         bind = false, -- This is mandatory, otherwise border config won't get registered.
    --         handler_opts = {
    --             border = "single"
    --         },
    --         use_lspsaga = true
    --     }
    -- )
end

-- lspInstall + lspconfig stuff
local function setup_servers()
    -- lspconfig variables, not used now
    local lspconfig = require("lspconfig")
    local configs = require("lspconfig.configs")

    -- lsp installer to manager servers
    local lsp_installer = require("nvim-lsp-installer")

    local servers = {
        -- "ansiblels",
        "bashls",
        "cmake",
        "cssls",
        "denols",
        "dockerls",
        "eslint",
        "gopls",
        "graphql",
        --"grammarly",
        -- "remark_ls",
        "zeta_note",
        "html",
        "jsonls",
        "jdtls", -- java
        "ltex",
        "sumneko_lua",
        -- "pyright",
        "jedi_language_server",
        "sqls",
        "tsserver",
        "yamlls"
    }

    for _, name in pairs(servers) do
        local ok, server = lsp_installer.get_server(name)
        -- Check that the server is supported in nvim-lsp-installer
        if ok then
            if not server:is_installed() then
                print("Installing " .. name)
                server:install()
            end
        end
    end

    -- Register a handler that will be called for all installed servers.
    lsp_installer.on_server_ready(
        function(server)
            local opts = {
                on_attach = common_on_attach
            }

            -- Setup cmp for all servers
            opts.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

            -- (optional) Customize the options passed to the server
            -- if server.name == "tsserver" then
            --     opts.root_dir = function() ... end
            -- end

            if server.name == "eslint" then
                opts.on_attach = function(client, bufnr)
                    -- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
                    -- the resolved capabilities of the eslint server ourselves!
                    client.resolved_capabilities.document_formatting = true
                    common_on_attach(client, bufnr)
                end
                opts.settings = {
                    format = {enable = true} -- this will enable formatting
                }
                vim.bo.tabstop = 2
                vim.bo.shiftwidth = 2
                vim.bo.softtabstop = 2
            end
            if server.name == "sumneko_lua" then
                opts.settings = {
                    Lua = {
                        diagnostics = {
                            globals = {"vim", "use"}
                        },
                        workspace = {
                            preloadFileSize = 1000,
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true
                            }
                        },
                        telemetry = {
                            enable = false
                        }
                    }
                }
            end
            if server.name == "denols" then
                opts.root_dir = lspconfig.util.root_pattern(".deno")
                vim.bo.tabstop = 2
                vim.bo.shiftwidth = 2
            end
            if server.name == "tsserver" then
                vim.bo.tabstop = 2
                vim.bo.shiftwidth = 2
            end
            if server.name == "html" then
                opts.filetypes = {"html", "eta"}
            end
            if server.name == "ansiblels" then
                opts.root_dir = lspconfig.util.root_pattern("ansible.cfg")
            end

            -- This setup() function is exactly the same as lspconfig's setup function.
            -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
            server:setup(opts)
        end
    )
end

setup_servers()

-- OUTDATED:
-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
-- require "lspinstall".post_install_hook = function()
--     setup_servers() -- reload installed servers
--     vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
-- end

-- LSP Signature
-- require "lsp_signature".setup()

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
    "<c-Space>",
    ":lua require('lspsaga.codeaction').code_action()<CR>",
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    "v",
    "<c-Space>",
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

-- replace the default lsp diagnostic letters with prettier symbols
vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})
