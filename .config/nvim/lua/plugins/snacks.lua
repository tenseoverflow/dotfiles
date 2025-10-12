return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  ---@type snacks.Config
  opts = {
    --[[ indent = {
			priority = 1,
			enabled = true, -- enable indent guides
			char = "│",
			only_scope = true, -- only show indent guides of the scope
			only_current = true, -- only show indent guides in the current window
			hl = "SnacksIndent", ---@type string|string[] hl groups for indent guides
		}, ]]
    image = { enabled = true },
    notifier = { enabled = true },
    -- scroll = { enabled = true },
    picker = {
      enabled = true,
    },
    explorer = {
      enabled = true,
      replace_netrw = true,
    },
    styles = {
      notification = {
        wo = { wrap = true }
      }
    }
  },
  keys = {
    {
      "<c-p>",
      function()
        local current_file = vim.fn.expand("%")

        Snacks.picker.smart({
          -- multi = {
          --   { finder = "buffers", current = false },
          --   { finder = "recent",  exclude = { current_file } },
          --   { finder = "files",   exclude = { current_file } },
          -- },
        })
      end,
    },
    { "<leader>/",  function() Snacks.picker.grep() end,                  desc = "Grep" },
    {
      "<leader>b",
      function()
        Snacks.picker.buffers()
      end,
    },
    { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
    -- {
    --   "<leader>fr",
    --   function()
    --     local cwd = vim.loop.cwd()
    --
    --     Snacks.picker.recent({
    --       filter = {
    --         paths = {
    --           [cwd] = true,
    --           [cwd .. "/node_modules"] = false,
    --         },
    --       },
    --     })
    --   end,
    -- },
    {
      "<leader>gg",
      function()
        Snacks.picker.git_status()
      end,
    },
    {
      "<leader>gl",
      function()
        Snacks.picker.git_log()
      end,
    },
    {
      "<leader>gb",
      function()
        Snacks.git.blame_line()
      end,
    },
    {
      "<leader>gs",
      function()
        Snacks.picker.git_stash()
      end,
      desc = "Git Stash",
    },
    {
      "<leader>go",
      function()
        Snacks.gitbrowse.open()
      end,
    },

    {
      "<leader>h",
      function()
        Snacks.picker.help()
      end,
    },
    {
      "<c-j>",
      function()
        Snacks.terminal.toggle()
      end,
    },
    {
      "<leader>e",
      function()
        Snacks.explorer.open()
      end,
    },
    {
      "<leader>:",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader>n",
      function()
        Snacks.picker.notifications()
      end,
      desc = "Notification History",
    }
  }
}
