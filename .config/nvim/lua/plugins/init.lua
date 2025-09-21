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
}
