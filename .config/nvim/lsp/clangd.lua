--- Overrides merged with nvim-lspconfig clangd (keeps upstream on_attach, capabilities, …).
---@type vim.lsp.Config
return {
  cmd = { "clangd", "--background-index" },
  filetypes = { "c", "cpp" },
}
