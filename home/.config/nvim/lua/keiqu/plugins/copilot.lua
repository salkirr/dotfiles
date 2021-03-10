return {
  {
    "zbirenbaum/copilot.lua",
    opts = {
      filetypes = {
        go = true,
        yaml = true,
        markdown = true,
        sh = function()
          if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
            -- disable for .env files
            return false
          end

          return true
        end,
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
      },
      panel = {
        enabled = true,
        auto_refresh = true,
      },
    },
    init = function()
      local nmap = require("keiqu.keymaps").nmap

      nmap("<leader>cp", ":Copilot enable<CR>")

      -- local ok, lines = pcall(vim.fn.readfile, vim.fn.expand("~/files/copilot-proxy.txt"))
      -- if not ok then
      --   vim.notify("Error reading proxy uri from ~/files/copilot-proxy.txt", vim.log.levels.ERROR)
      --   return
      -- end

      -- if lines == nil or #lines == 0 then
      --   vim.notify("No proxy uri found in ~/files/copilot-proxy.txt", vim.log.levels.ERROR)
      --   return
      -- end

      -- vim.g.copilot_proxy = vim.trim(lines[1])
    end,
  },
}
