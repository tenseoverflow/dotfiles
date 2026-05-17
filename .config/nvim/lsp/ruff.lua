--- Hover from pyrefly; ruff stays lint/format only. Merged with nvim-lspconfig ruff (:h lsp-config-ruff).
---@type vim.lsp.Config
return {
  on_attach = function(client, _)
    if client.name == "ruff" then
      client.server_capabilities.hoverProvider = false
    end
  end,
}
