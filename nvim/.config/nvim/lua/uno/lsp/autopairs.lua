---- Nvim-autopairs Setup
local npairs = require("nvim-autopairs")
npairs.setup(
    {
        enable_check_bracket_line = false,
        check_ts = true,
        ts_config = {
            lua = {"string"},
            -- it will not add pair on that treesitter node
            javascript = {"template_string"},
            -- don't check treesitter on java
            java = false
        }
    }
)

local ts_conds = require("nvim-autopairs.ts-conds")

-- press % => %% is only inside comment or string
local Rule = require("nvim-autopairs.rule")
npairs.add_rules(
    {
        Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({"string", "comment"})),
        Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({"function"}))
    }
)

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({map_char = {tex = ""}}))

