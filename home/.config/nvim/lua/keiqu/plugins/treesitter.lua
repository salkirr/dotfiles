return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = { ":TSInstall all", ":TSUpdate all" },
    dependencies = { "nvim-treesitter/playground" },
    main = "nvim-treesitter.configs",
    opts = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      playground = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "g[",
          scope_incremental = "gs[",
          node_decremental = "g]",
        },
      },
    },
  },
}
