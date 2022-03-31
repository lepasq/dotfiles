local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
    execute("packadd packer.nvim")
end

return require("packer").startup(
    function()
        -- Packer can manage itself
        use("wbthomason/packer.nvim")

        -- Telescope, fzf replacement fuzzy scanner
        use("folke/trouble.nvim")
        use("nvim-lua/popup.nvim")
        use("nvim-lua/plenary.nvim")
        use("nvim-telescope/telescope.nvim")
        use("nvim-telescope/telescope-fzy-native.nvim")
        use("nvim-telescope/telescope-project.nvim")

        -- Theming
        use("dylanaraps/wal.vim")
        use("deviantfero/wpgtk.vim")
        use("chrisbra/Colorizer")
        use("ryanoasis/vim-devicons")
        use("rktjmp/lush.nvim")
        use("akinsho/nvim-bufferline.lua")
        use("norcalli/nvim-colorizer.lua")
        use("glepnir/galaxyline.nvim")

        -- Software Devlopment
        -- TODO: Currntly doesn't support lsp and treesitter, check back later
        -- use {'fatih/vim-go', run = ':GoUpdateBinaries'}
        use("ekalinin/Dockerfile.vim")
        use("windwp/nvim-autopairs")
        use("alvan/vim-closetag")
        use("ray-x/lsp_signature.nvim")

        -- Nvim LSP
        use("neovim/nvim-lspconfig")
        use("williamboman/nvim-lsp-installer")
        -- remove
        -- use 'hrsh7th/nvim-compe'
        use("onsails/lspkind-nvim")
        use("tami5/lspsaga.nvim")

        -- LSP Completion
        use("hrsh7th/cmp-nvim-lsp")
        use("hrsh7th/cmp-buffer")
        use("hrsh7th/cmp-path")
        use("hrsh7th/cmp-cmdline")
        use("hrsh7th/nvim-cmp")
        use({"tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp"})
        use("L3MON4D3/LuaSnip")
        use("saadparwaiz1/cmp_luasnip")

        -- Nvim Treesitter
        use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})
        use("nvim-treesitter/playground")
        use("kyazdani42/nvim-web-devicons")

        -- Misc
        use("preservim/nerdcommenter")
        use("mhinz/vim-startify")
        use("kyazdani42/nvim-tree.lua")
        use("Pocco81/TrueZen.nvim")
        use("rktjmp/fwatch.nvim")
        use("sbdchd/neoformat")
        use("Chiel92/vim-autoformat")
        use("akinsho/nvim-toggleterm.lua")
        use {
          "folke/which-key.nvim",
          config = function()
            require("which-key").setup {
            }
          end
        }

        -- Golang
        use(
            {
                "ray-x/go.nvim",
                requires = {
                    "mfussenegger/nvim-dap", -- Debug Adapter Protocol
                    "rcarriga/nvim-dap-ui",
                    "theHamsta/nvim-dap-virtual-text",
                    "ray-x/guihua.lua"
                    --float term, gui support
                }
            }
        )

        -- Git stuff
        use("ThePrimeagen/git-worktree.nvim") -- look into how this works
        use("tpope/vim-fugitive") -- what is this again?
        use({"sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim"})

        use("ThePrimeagen/harpoon") -- what is this again?
        use("famiu/nvim-reload")

        use("lewis6991/gitsigns.nvim")

        -- use 'dstein64/vim-startuptime'
        use(
            {
                "glacambre/firenvim",
                run = function()
                    vim.fn["firenvim#install"](0)
                end
            }
        )
    end
)

