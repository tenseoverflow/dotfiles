return {
  {
    "mason-org/mason-lspconfig.nvim",
    -- Mason must load before mason-lspconfig; nvim-lspconfig supplies defaults merged with ~/.config/nvim/lsp/*.lua
    dependencies = {
      { "mason-org/mason.nvim", lazy = false, opts = {} },
      "neovim/nvim-lspconfig",
    },
    lazy = false,
    opts = {
      -- Installs binaries and calls vim.lsp.enable() per server (|:h mason-lspconfig.nvim| automatic_enable).
      ensure_installed = {
        "lua_ls",
        "yamlls",
        -- "sqruff",
        "fish_lsp",
        "bashls",
        "clangd",
        "pyrefly",
        "ruff",
        "taplo",
        "ltex_plus",
        "svelte",
        "tailwindcss",
      },
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
    end,
  },
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
        "<leader>xs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>xt",
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
    "luckasRanarison/tailwind-tools.nvim",
    ft = { "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte", "vue" },
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        -- nes = {
        --   enabled = truae,
        --   keymap = {
        --     accept_and_goto = "<leader>p",
        --     accept = false,
        --     dismiss = "<Esc>",
        --   },
        -- },
      })
    end,
    keys = {
      { "<leader>cd", "<cmd>Copilot disable<cr>", desc = "Disable Copilot" },
      { "<leader>ce", "<cmd>Copilot enable<cr>",  desc = "Enable Copilot" },
    },
  },
  {
    "folke/sidekick.nvim",
    opts = {
      -- add any options here
      cli = {
        mux = {
          backend = "tmux",
          enabled = true,
        },
      },
    },
    keys = {
      {
        "<tab>",
        function()
          -- if there is a next edit, jump to it, otherwise apply it if any
          if not require("sidekick").nes_jump_or_apply() then
            return "<Tab>" -- fallback to normal tab
          end
        end,
        expr = true,
        desc = "Goto/Apply Next Edit Suggestion",
      },
      {
        "<c-l>",
        function()
          require("sidekick.cli").toggle()
        end,
        desc = "Sidekick Toggle",
        mode = { "n", "t", "i", "x" },
      },
      -- {
      --   "<leader>ad",
      --   function()
      --     require("sidekick.cli").close()
      --   end,
      --   desc = "Detach a CLI Session",
      -- },
      {
        "<leader>ct",
        function()
          require("sidekick.cli").send({ msg = "{this}" })
        end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<leader>cf",
        function()
          require("sidekick.cli").send({ msg = "{file}" })
        end,
        desc = "Send File",
      },
      -- {
      --   "<leader>cv",
      --   function()
      --     require("sidekick.cli").send({ msg = "{selection}" })
      --   end,
      --   mode = { "x" },
      --   desc = "Send Visual Selection",
      -- },
      {
        "<leader>cp",
        function()
          require("sidekick.cli").prompt()
        end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
    },
  },
}
