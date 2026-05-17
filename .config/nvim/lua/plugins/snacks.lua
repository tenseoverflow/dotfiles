return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  opts = {
    image = { enabled = true },
    notifier = { enabled = true },
    picker = { enabled = true },
    explorer = {
      enabled = true,
      replace_netrw = true,
    },
    styles = {
      notification = { wo = { wrap = true } },
    },
  },

  keys = {
    {
      "<c-p>",
      function()
        Snacks.picker.smart()
      end,
    },
    { "<leader>/",  function() Snacks.picker.grep() end,                 desc = "Grep" },
    { "<leader>b", function() Snacks.picker.buffers() end },
    {
      "<leader>sS",
      function() Snacks.picker.lsp_workspace_symbols() end,
      desc = "LSP Workspace Symbols",
    },
    { "<leader>gg", function() Snacks.picker.git_status() end },
    { "<leader>gl", function() Snacks.picker.git_log() end },
    { "<leader>gb", function() Snacks.git.blame_line() end },
    {
      "<leader>gs",
      function() Snacks.picker.git_stash() end,
      desc = "Git Stash",
    },
    { "<leader>go", function() Snacks.gitbrowse.open() end },
    { "<leader>h", function() Snacks.picker.help() end },
    { "<c-j>", function() Snacks.terminal.toggle() end },
    { "<leader>e", function() Snacks.explorer.open() end },
    {
      "<leader>:",
      function() Snacks.picker.command_history() end,
      desc = "Command History",
    },
    {
      "<leader>n",
      function() Snacks.picker.notifications() end,
      desc = "Notification History",
    },
  },
}
