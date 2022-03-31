--local function eslint_config_exists()
  --local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)
  --if not vim.tbl_isempty(eslintrc) then
    --return true
  --end
  --return false
--end


vim.cmd("autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll")
