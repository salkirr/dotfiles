vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("styluagroup", { clear = true }),
  pattern = "*.lua",
  callback = function()
    if vim.fn.executable("stylua") ~= 1 then
      vim.notify("Stylua binary not found", vim.log.levels.WARN)
      return
    end

    ok, res = vim.fn.execute("!stylua %")
  end,
})
