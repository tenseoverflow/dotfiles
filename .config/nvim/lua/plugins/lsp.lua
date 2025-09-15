return {
  {
    "mason-org/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "clangd",
          "pyright",
          "ruff",
          "jdtls",
        },
      })
    end,
  },
  -- LSP configuration is now handled by Neovim 11 built-in LSP in config/lsp.lua
  -- Only keeping Mason for LSP server installation
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    config = function()
      require("lazydev").setup({
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      })
    end,
  },
  {
    "luckasRanarison/tailwind-tools.nvim",
    ft = { "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte", "vue" },
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
    },
    ---@type TailwindTools.Option
    opts = {},
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  },
  -- {
  --   'zk-org/zk-nvim',
  --   ft = 'markdown',
  --   config = function()
  --     require('zk').setup {
  --       picker = 'snacks_picker',
  --       lsp = {
  --         config = {
  --           capabilities = require 'j.plugins.lsp.capabilities',
  --         },
  --       },
  --     }
  --   end,
  --   keys = {
  --     { '<leader>zn', [[:ZkNew {title=''}<left><left>]], mode = 'n' },
  --     { '<leader>zn', [[<cmd>ZkNewFromTitleSelection<cr>]], mode = 'x' },
  --     { '<leader>zl', [[<cmd>ZkNotes<cr>]] },
  --     { '<leader>zt', [[<cmd>ZkTags<cr>]] },
  --   },
  -- },
}
