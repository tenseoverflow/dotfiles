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
    scroll = { enabled = true },
    picker = {
      enabled = true,
    },
    -- explorer = {
    -- 	replace_netrw = true,
    -- },
  },

  keys = {
    {
      "<c-p>",
      function()
        local current_file = vim.fn.expand("%")

        Snacks.picker.smart({
          multi = {
            { finder = "buffers", current = false },
            { finder = "files",   exclude = { current_file } },
            { finder = "recent",  exclude = { current_file } },
          },
        })
      end,
    },
    {
      "<leader>fr",
      function()
        local cwd = vim.loop.cwd()

        Snacks.picker.recent({
          filter = {
            paths = {
              [cwd] = true,
              [cwd .. "/node_modules"] = false,
            },
          },
        })
      end,
    },
    {
      "<leader>fg",
      function()
        Snacks.picker.git_status()
      end,
    },
    {
      "<leader>fd",
      function()
        Snacks.picker.git_log()
      end,
    },
    {
      "<leader>fb",
      function()
        Snacks.git.blame_line()
      end,
    },
    {
      "<leader>fo",
      function()
        Snacks.gitbrowse.open()
      end,
    },

    {
      "<leader>fh",
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
  },
}
