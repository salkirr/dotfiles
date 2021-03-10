return {
  settings = {
    gopls = {
      gofumpt = true,
      directoryFilters = { "-**/node_modules", "-**/.linter-cache" },
    },
  },
}
