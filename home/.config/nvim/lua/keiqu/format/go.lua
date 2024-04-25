vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("goformat", { clear = true }),
  pattern = "*.go",
  callback = function() require("go.format").goimports() end,
})
