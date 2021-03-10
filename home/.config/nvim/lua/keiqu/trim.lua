local trim_trailing_space = function()
  local pos = vim.api.nvim_win_get_cursor(0)
  vim.cmd([[keepjumps keeppatterns silent! %s/\s\+$//e]])
  vim.api.nvim_win_set_cursor(0, pos)
end

local trim_trailing_lines = function()
  local pos = vim.api.nvim_win_get_cursor(0)
  vim.cmd([[keepjumps keeppatterns silent! %s/\($\n\s*\)\+\%$//]])

  -- This loop is needed for case when cursor is on the one of trailing lines.
  -- When this happens we get error because the line we try to put cursor on is deleted.
  -- Solution: try the line before until we stop getting an error.
  local row_num = pos[1]
  repeat
    pos[1] = row_num
    local ok = pcall(vim.api.nvim_win_set_cursor, 0, pos)
    if ok then
      break
    end

    row_num = row_num - 1
  until row_num <= 0
end

vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("trimgroup", { clear = true }),
  pattern = "*",
  callback = function()
    trim_trailing_space()
    trim_trailing_lines()
  end,
})
