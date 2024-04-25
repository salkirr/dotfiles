vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("jsonformatgroup", { clear = true }),
  pattern = "*.json",
  callback = function()
    if vim.fn.executable("jq") ~= 1 then
      vim.notify("jq binary not found", vim.log.levels.WARN)
      return
    end

    -- TODO
    -- -- Get content of current buffer
    -- local content = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    -- -- Run jq on this content
    -- local res = vim.fn.nvim_call_function("system", {"jq .", table.concat(content, "\n")}
    -- -- Catch output and check if it's an error (jq: parse error*)
    -- if string.match(res, "jq: parse error") then
    --   vim.notify("jq: parse error", vim.log.levels.ERROR)
    --   return
    -- end

    -- -- If not then rewrite the buffer with the formatted JSON
    -- vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(res, "\n"))
  end,
})
