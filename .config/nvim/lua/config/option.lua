vim.loader.enable(true)

-- tabbing
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true

-- UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.showcmd = true
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.sidescrolloff = 8
vim.opt.scrolloff = 8
vim.opt.suffixesadd = { ".md", ".js", ".ts", ".tsx" } -- File extensions not required when opening with `gf`

vim.opt.inccommand = "split"

vim.opt.wrap = true
vim.opt.breakindent = true

vim.opt.list = true
vim.opt.listchars = {
	nbsp = "⦸",
	tab = "  ",
	extends = "»",
	precedes = "«",
	trail = "·",
}
vim.opt.showbreak = "↳ "
vim.opt.fillchars = {
	eob = " ",
	fold = " ",
	diff = "╱",
	foldopen = "",
	foldclose = "",
}

vim.opt.winborder = "rounded"
-- vim.opt.colorcolumn = { 121 }

vim.opt.confirm = true

vim.opt.splitright = true -- Open new split to the right
vim.opt.splitbelow = true -- Open new split below
--vim.opt.splitkeep = "screen"
--vim.opt.whichwrap = vim.opt.whichwrap + "h,l,<,>,[,]"

-- Messages
vim.opt.shortmess:append({
	I = true, -- No splash screen
	--W = true, -- Don't print "written" when editing
	--a = true, -- Use abbreviations in messages ([RO] intead of [readonly])
	--c = true, -- Do not show ins-completion-menu messages (match 1 of 2)
	--F = true, -- Do not print file name when opening a file
	s = true, -- Do not show "Search hit BOTTOM" message
})

-- formatting
vim.opt.formatoptions = table.concat({
	"2", -- Use the second line's indent vale when indenting (allows indented first line)
	"q", -- Formatting comments with `gq`
	"w", -- Trailing whitespace indicates a paragraph
	"j", -- Remove comment leader when makes sense (joining lines)
	"r", -- Insert comment leader after hitting Enter
	"o", -- Insert comment leader after hitting `o` or `O`
})

-- file
vim.opt.undofile = true
vim.opt.wildignore = {
	"**/node_modules/**",
	"**/coverage/**",
	"**/.idea/**",
	"**/.git/**",
	"**/.nuxt/**",
}
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000
vim.opt.shada = { "!", "'1000", "<50", "s10", "h" } -- Increase the shadafile size so that history is longer
vim.opt.clipboard = "unnamedplus"

-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true
vim.opt.grepprg = "rg --ignore-case --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"

-- Backups
vim.opt.backup = true
vim.opt.backupdir = { vim.env.XDG_DATA_HOME .. "/nvim/backups" }
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.writebackup = true
