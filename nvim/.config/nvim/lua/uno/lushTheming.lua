-- In cool_name/lua/lush_theme/cool_name.lua

-- require lush
local lush = require('lush')

-- lush() will parse the spec and
-- return a table containing all color information.
-- We return it for use in other files.

-- vim.go.background = "dark"
-- vim.g.colors_name = "wpgtk"
-- package.loaded['themes.wpgtk'] = nil
-- lush(require('themes.wpgtk'))
--
vim.cmd("colorscheme pywal")
package.loaded['themes.pywal'] = nil

require('lush')(require('themes.pywal'))
require('lush')(require('themes.pywal'))
require("colorizer").setup()

local fwatch = require('fwatch')
fwatch.watch("/home/tyler/.cache/wal/colors", {
  -- when file changes
  on_event = function()
    -- wait 200ms then
    vim.defer_fn(function()
      -- reapply the colorscheme
      package.loaded['themes.pywal'] = nil
      require('lush')(require('themes.pywal'))
      -- vim.cmd("colorscheme pywal")
    end, 200)
  end
})

