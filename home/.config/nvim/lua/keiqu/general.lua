local options = {
  termguicolors = true,
  undofile = true,
  undolevels = 10000,
  history = 1000,
  number = true,
  relativenumber = true,
  cursorline = true,
  list = true,
  listchars = { eol = "↵", tab = "▸·", space = "·", extends = "▶", precedes = "◀", nbsp = "␣" },
  tabstop = 4,
  shiftwidth = 4,
  expandtab = true,
  wrap = false,
  wildmode = { "longest", "full" },
  wildignore = {
    "*.docx",
    "*.jpg",
    "*.png",
    "*.gif",
    "*.pdf",
    "*.exe",
    "*.flv",
    "*.img",
    "*.xlsx",
    "*.o",
    "*.pyc",
    "**/.git/*",
  },
  scrolloff = 7,
  ignorecase = true,
  smartcase = true,
  smartindent = true,
  completeopt = { "menu", "menuone", "noselect" }, -- for nvim-cmp
  sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions",
  autowriteall = true,
  laststatus = 3,
  textwidth = 120, -- for 'gq',
  shell = "/bin/bash", -- TODO: for some reason fish shell throws error (smth like `/dev/tty not found`)
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- config netrw
vim.g.netrw_winsize = 20
vim.g.netrw_keepdir = 0
vim.g.netrw_banner = 0
vim.g.netrw_localcopydircmd = "cp -r"

----------------------------------------------------
--                    KEYMAPS
----------------------------------------------------
local nmap = require("keiqu.keymaps").nmap
local imap = require("keiqu.keymaps").imap
local vmap = require("keiqu.keymaps").vmap
local xmap = require("keiqu.keymaps").xmap
local nvmap = require("keiqu.keymaps").nvmap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- our leader
nmap("<leader>w", ":w<cr>")

-- useful
nmap("<leader><leader>x", ":source %<cr>")

-- yanking and pasting to/from "system" register
nvmap("<leader>y", '"+y')
nvmap("<leader>p", '"+gp')
nmap("<leader>Y", "+Y")
nmap("<leader>P", '"+gP')

-- window navigation
nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-l>", "<C-w>l")

-- remove search highlight
nmap("<leader>/", "<cmd>noh<cr><esc>")

-- resize windows
nmap("<A-k>", ":resize -2<cr>")
nmap("<A-j>", ":resize +2<cr>")
nmap("<A-h>", ":vertical resize -2<cr>")
nmap("<A-l>", ":vertical resize +2<cr>")

-- buffers
nmap("<leader>bd", ":bdelete<cr>")
nmap("<leader>b[", ":bprevious<cr>")
nmap("<leader>b]", ":bnext<cr>")

-- tabs
nmap("<leader>tn", ":tabnew<cr>")
nmap("<leader>tc", ":tabclose<cr>")
nmap("<leader>to", ":tabonly<cr>")
nmap("<leader>t[", ":tabprevious<cr>")
nmap("<leader>t]", ":tabnext<cr>")

-- telescope
nmap("<leader>ff", ":Telescope find_files<cr>")
nmap("<leader>fg", ":Telescope live_grep<cr>")
nmap("<leader>fb", ":Telescope buffers<cr>")
nmap("<leader>fh", ":Telescope help_tags<cr>")
nmap("<leader>gs", ":Telescope git_status<cr>")
nmap("<leader>gb", ":Telescope git_branches<cr>")

-- symbols outline
nmap("<leader>ls", ":SymbolsOutline<cr>")

-- trouble menu
nmap("<leader>lt", ":TroubleToggle<cr>")

-- nvim tree
nmap("<leader>q", ":NvimTreeToggle<cr>")
nmap("<leader>e", ":NvimTreeFindFile<cr>")

-- don't loose contents of register after pasting in visual mode (substitution)
vmap("p", '"_dP')
