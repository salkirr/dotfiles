return {
  "fatih/vim-go",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  init = function()
    vim.g.go_fmt_command = "gofumpt"
    vim.g.go_fmt_options = {
      gofumpt = "--extra",
    }
  end,
}
