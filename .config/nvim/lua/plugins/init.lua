return {
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "deep",

        lualine = {
          transparent = true, -- lualine center bar transparency
        },
      })

      require("onedark").load()
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      model = "gpt-4.1",
      auto_insert_mode = true,
    },
    keys = {
      { "<leader>cc", "<cmd>CopilotChat<cr>" },
    },
  },
  {
    "lervag/vimtex",
    -- lazy = false,
    ft = "tex",
    -- tag = "v2.15", -- uncomment to pin to a specific release
    config = function()
      --global vimtex settings
      vim.g.vimtex_imaps_enabled = 0                      --i.e., disable them
      vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
      --vimtex_view_settings
      vim.g.vimtex_view_method =
      'general' -- change this, depending on what you want to use..sumatraPDF, or skim, or zathura, or...
      vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
      --quickfix settings
      vim.g.vimtex_quickfix_open_on_warning = 0 --  don't open quickfix if there are only warnings
      vim.g.vimtex_quickfix_ignore_filters = { "Underfull", "Overfull", "LaTeX Warning: .\\+ float specifier changed to",
        "Package hyperref Warning: Token not allowed in a PDF string" }
    end,

    keys = {
      { "<localLeader>l", "", desc = "+vimtex", ft = "tex" },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {
      modes = { insert = true, command = true, terminal = false },
      -- skip autopair when next character is one of these
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      -- skip autopair when the cursor is inside these treesitter nodes
      skip_ts = { "string" },
      -- skip autopair when next character is closing pair
      -- and there are more closing pairs than opening pairs
      skip_unbalanced = true,
      -- better deal with markdown code blocks
      markdown = true,
    },
  },
}
