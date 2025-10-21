return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    optional = true,
    -- optional = true,
    config = function()
      require("lualine").setup({
        icons_enabled = true,
        extensions = { "trouble" },
        tabline = {},
        options = {
          comment_separators = "",
          section_separators = "",
        },
        sections = {
          lualine_a = {},
          lualine_b = { "branch" },
          lualine_c = { "diagnostics" },
          lualine_x = {
            "location",
            -- "copliot",
          },
          lualine_y = {
            {
              "lsp_status",
              symbols = {
                icon = "",
                -- Standard unicode symbols to cycle through for LSP progress:
                spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
                -- Standard unicode symbol for when LSP is done:
                done = "",
                -- Delimiter inserted between LSP names:
                separator = ", ",
              },
              -- List of LSP names to ignore (e.g., `null-ls`):
              ignore_lsp = {},
            },
          },
          lualine_z = {},
        },
      })
    end,
  },
}
