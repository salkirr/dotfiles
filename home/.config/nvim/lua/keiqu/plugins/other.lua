-- TODO: move to separate files
return {
	"tpope/vim-dotenv",
	"tpope/vim-dispatch",
	{
		"Wansmer/treesj",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		keys = {
			{ "J", "<cmd>TSJToggle<cr>" },
		},
		opts = { use_default_keymaps = false, max_join_length = 120 },
	},

	"tpope/vim-commentary",
	"tpope/vim-surround",
	"tpope/vim-repeat",
	"psliwka/vim-smoothie",
	{
		"windwp/nvim-autopairs",
		config = true,
	},
	{
		"rmagatti/auto-session",
		dependencies = { "nvim-telescope/telescope.nvim" },
		opts = {
			auto_session_suppress_dirs = { "~/", "~/code", "~/Downloads", "/", "~/work" },
			auto_session_use_git_branch = true,

			session_lens = {
				load_on_setup = true,
			},
		},
		init = function()
			vim.keymap.set("n", "<leader>qs", require("auto-session.session-lens").search_session, {
				noremap = true,
			})
		end,
	},
	{ "simrat39/symbols-outline.nvim", config = true },
	{ "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, event = "LspAttach" },

	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = { git = { ignore = false } },
	},

	{
		"williamboman/mason.nvim",
		opts = { ui = { icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" } } },
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
		config = function()
			require("keiqu.lsp")
		end, -- TODO: move to plugins folder
	},
	{ "mbbill/undotree" },
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = true,
	},
}
