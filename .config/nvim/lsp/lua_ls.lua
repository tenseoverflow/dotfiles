--- Merged into nvim-lspconfig lua_ls defaults (|.luarc.| is respected first).
---@type vim.lsp.Config
return {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
    },
  },
}
