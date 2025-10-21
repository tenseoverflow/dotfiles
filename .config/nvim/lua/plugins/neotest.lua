return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
    },
    ft = "python",
    event = "VeryLazy",
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            dap = { justMyCode = false },
          }),
          quickfix = {
            open = false,
          },
          status = {
            virtual_text = true,
          },
          output = {
            open_on_run = true,
          },
        },
      })
    end,
    keys = {
      { "<leader>tt", function() require("neotest").run.run() end,                     desc = "Run nearest test" },
      { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end,   desc = "Run tests in file" },
      { "<leader>ta", function() require("neotest").run.run({ suite = true }) end,     desc = "Run all tests" },
      { "<leader>ts", function() require("neotest").summary.toggle() end,              desc = "Toggle test summary" },
      { "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Open test output" },
      { "<leader>tl", function() require("neotest").run.run_last() end,                desc = "Run last test" },
      { "<leader>td", function() require("neotest").run.stop() end,                    desc = "Stop running tests" },
    }
  },
}
