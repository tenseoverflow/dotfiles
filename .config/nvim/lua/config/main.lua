-- tabbing
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 0
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
--vim.opt.list = true
--vim.opt.listchars = "tab:>-,trail:~,extends:>,precedes:<"

-- UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.showcmd = true
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.sidescrolloff = 8
vim.opt.scrolloff = 8

-- file
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"
vim.opt.undofile = true
vim.opt.clipboard:append({ "unnamed", "unnamedplus" })

-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true

-- use nvim-tree
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- LSP
-- vim.lsp.inlay_hint_enable(true)

