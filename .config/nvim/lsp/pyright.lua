return {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "requirements.txt", ".git" },
  settings = {
    pyright = {
      disableOrganizeImports = true,
      capabilities = (function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
        return capabilities
      end)(),
    },
    python = {
      analysis = {
        -- useLibraryCodeForTypes = true,
        -- diagnosticSeverityOverrides = {
        --   reportUnusedVariable = "warning",
        -- },
        -- ignore = { "*" },
        typeCheckingMode = "recommended",
        -- diagnosticMode = "off",
      },
    },
  },
  on_attach = function(client, _)
    -- Disable all capabilities except hoverProvider
    client.server_capabilities.hoverProvider = true
  end,
}
