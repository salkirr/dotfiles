require("keiqu.general")
require("keiqu.globals")
require("keiqu.trim")
require("keiqu.lua")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("keiqu.plugins", {
  dev = { path = "~/code" },
})

vim.cmd([[colorscheme catppuccin-macchiato]])
