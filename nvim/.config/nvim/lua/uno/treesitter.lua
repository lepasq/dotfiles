local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
    ensure_installed = {
        "javascript",
        "typescript",
        "dockerfile",
        "tsx",
        "html",
        "css",
        "bash",
        "lua",
        "json",
        "python",
        "yaml",
        "go",
        "gomod",
        "graphql",
        "r",
        "regex",
        "latex",
        "php",
        "scss"
    },
    highlight = {
        enable = true,
        use_languagetree = true,
        custom_captures = {
            -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
            ["function.decorator"] = "TSDecorator",
            ["docstring"] = "TSDocString"
        }
    },
    autopairs = {
        enable = true
    }
}
