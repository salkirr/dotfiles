return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "rmagatti/auto-session" },
    main = "lualine",
    opts = {
      ignore_focus = { "Outline" },
      sections = {
        lualine_x = {
          {
            function() return require("copilot_status").status_string() end,
            cnd = function() return require("copilot_status").enabled() end,
          },
          "encoding",
          "fileformat",
          "filetype",
        },
      },
    },
  },

  {
    "jonahgoldwastaken/copilot-status.nvim",
    dependencies = { "zbirenbaum/copilot.lua" },
    lazy = true,
    event = "BufReadPost",
    opts = {
      icons = {
        idle = " ",
        offline = " ",
        error = " ",
        warning = " ",
        loading = " ",
      },
    },
  },
}
