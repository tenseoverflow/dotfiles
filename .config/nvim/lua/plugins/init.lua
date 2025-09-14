return {
  {
    "navarasu/onedark.nvim", 
    priority=1000, 
    config = function()
      require('onedark').setup {
        style = 'dark'
      }

      require('onedark').load()
    end
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "nvim-lualine/lualine.nvim"
  },
  {
    'numToStr/Comment.nvim',

    config = function()
      require('Comment').setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
        padding = true,
        sticky = true,
        ignore = nil,
        toggler = {
          ---Line-comment toggle keymap
          line = 'gcc',
          ---Block-comment toggle keymap
          block = 'gbc',
        },
      }
    end
  },

  {
    'JoosepAlviste/nvim-ts-context-commentstring',

    config = function()
      require('ts_context_commentstring').setup {
        enable_autocmd = false,
      }
    end
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "pyright",
          "ruff",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig"
  },
  {
    "saghen/blink.cmp",
  }
}
