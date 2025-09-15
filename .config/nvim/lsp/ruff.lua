return {
  cmd = { "ruff" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "ruff.toml", ".git" },
  on_attach = function(client, _)
    if client.name == "ruff" then
      -- disable hover in favor of pyright
      client.server_capabilities.hoverProvider = false
    end
  end,
}
