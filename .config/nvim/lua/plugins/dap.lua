return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    event = "VeryLazy",
    -- Copied from LazyVim/lua/lazyvim/plugins/extras/dap/core.lua and
    -- modified.
    keys = {
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },

      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },

      {
        "<leader>dC",
        function()
          require("dap").run_to_cursor()
        end,
        desc = "Run to Cursor",
      },

      {
        "<leader>dT",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate",
      },
      {
        "<leader>dr",
        function()
          require("dap").restart()
        end,
        desc = "Restart",
      }
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    ---@type MasonNvimDapSettings
    opts = {
      -- This line is essential to making automatic installation work
      -- :exploding-brain
      handlers = {},
      automatic_installation = {
        -- These will be configured by separate plugins.
        exclude = {
          "delve",
          "python",
        },
      },
      -- DAP servers: Mason will be invoked to install these if necessary.
      ensure_installed = {
        "python",
        "codelldb",
        "firefox-debug-adapter",
      },
    },
    dependencies = {
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    lazy = true,
    event = "VeryLazy",
    config = function()
      local python = vim.fn.expand("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
      require("dap-python").setup(python)
    end,
    -- Consider the mappings at
    -- https://github.com/mfussenegger/nvim-dap-python?tab=readme-ov-file#mappings
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = true,
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    config = true,
    event = "VeryLazy",
    keys = {
      {
        "<leader>du",
        function()
          require("dapui").toggle({})
        end,
        desc = "Dap UI",
      },
    },
    dependencies = {
      "jay-babu/mason-nvim-dap.nvim",
      "mfussenegger/nvim-dap-python",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
    },
  },
}
