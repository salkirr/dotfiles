local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
  vim.notify("Plugin 'mason-lspconfig' not found!", vim.log.levels.ERROR)
  return
end

local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  vim.notify("Plugin 'lspconfig' not found!", vim.log.levels.ERROR)
  return
end

local servers = { "gopls", "pyright", "lua_ls", "bashls", "vtsls" }

mason_lspconfig.setup({
  ensure_installed = servers,
})

local handlers = require("keiqu.lsp.handlers")
handlers.setup()

for _, server in pairs(servers) do
  local opts = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
  }

  local has_custom_opts, custom_opts = pcall(require, "keiqu.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", opts, custom_opts)
  end

  lspconfig[server].setup(opts)
end
