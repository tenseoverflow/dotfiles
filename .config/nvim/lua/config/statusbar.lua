-- Native Vim Statusbar Configuration
-- Replaces lualine.nvim with native Vim statusbar APIs

local M = {}

-- Statusbar components
local components = {}

-- Git branch component
function components.git_branch()
  local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  if vim.v.shell_error == 0 and branch ~= "" then
    return " " .. branch .. " "
  end
  return ""
end

-- Diagnostics component
function components.diagnostics()
  local diagnostics = vim.diagnostic.get(0, { severity_limit = vim.diagnostic.severity.HINT })
  local error_count = 0
  local warn_count = 0
  local info_count = 0
  local hint_count = 0

  for _, diag in ipairs(diagnostics) do
    if diag.severity == vim.diagnostic.severity.ERROR then
      error_count = error_count + 1
    elseif diag.severity == vim.diagnostic.severity.WARN then
      warn_count = warn_count + 1
    elseif diag.severity == vim.diagnostic.severity.INFO then
      info_count = info_count + 1
    elseif diag.severity == vim.diagnostic.severity.HINT then
      hint_count = hint_count + 1
    end
  end

  local diag_str = ""
  if error_count > 0 then
    diag_str = diag_str .. " " .. error_count .. " "
  end
  if warn_count > 0 then
    diag_str = diag_str .. " " .. warn_count .. " "
  end
  if info_count > 0 then
    diag_str = diag_str .. " " .. info_count .. " "
  end
  if hint_count > 0 then
    diag_str = diag_str .. " " .. hint_count .. " "
  end

  return diag_str
end

-- Location component (line:column)
function components.location()
  local line = vim.fn.line(".")
  local col = vim.fn.col(".")
  return " " .. line .. ":" .. col .. " "
end

-- LSP status component with custom symbols
function components.lsp_status()
  local clients = vim.lsp.get_active_clients({ bufnr = 0 })
  if #clients == 0 then
    return ""
  end

  local status_str = ""
  for i, client in ipairs(clients) do
    if i > 1 then
      status_str = status_str .. ", "
    end
    status_str = status_str .. client.name
  end

  return " " .. status_str .. " "
end

-- File information component
function components.file_info()
  local filename = vim.fn.expand("%:t")
  local filetype = vim.bo.filetype
  local modified = vim.bo.modified and " +" or ""

  if filename == "" then
    return " [No Name] "
  end

  local file_icon = ""
  if vim.fn.exists("*WebDevIconsGetFileTypeSymbol") == 1 then
    file_icon = vim.fn.WebDevIconsGetFileTypeSymbol(filename) .. " "
  end

  return file_icon .. filename .. modified .. " "
end

-- File encoding and format
function components.file_format()
  local encoding = vim.bo.fileencoding
  local format = vim.bo.fileformat

  if encoding == "" then
    encoding = vim.o.encoding
  end

  return " " .. encoding .. " " .. format .. " "
end

-- Main statusbar function
function M.setup_statusbar()
  -- Set statusline with improved formatting and colors
  vim.o.statusline = table.concat({
    -- File info section (left side)
    -- "%#StatusLine#",
    -- components.file_info(),

    -- Git branch section
    "%#StatusLineBranch#",
    components.git_branch(),

    -- Diagnostics section
    "%#StatusLineDiag#",
    components.diagnostics(),

    -- Separator (right side)
    "%=",

    -- LSP status section
    "%#StatusLineLSP#",
    components.lsp_status(),

    -- File format section
    -- "%#StatusLineFormat#",
    -- components.file_format(),

    -- Location section
    "%#StatusLineLocation#",
    components.location(),
  })

  -- Enable statusline
  vim.o.laststatus = 2

  -- Set ruler format (for command line)
  vim.o.rulerformat = "%l:%c %p%%"

  -- Define custom highlight groups for better visual separation
  M.setup_highlights()
end

-- Setup custom highlight groups
function M.setup_highlights()
  -- Define highlight groups for different sections
  vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
      vim.api.nvim_set_hl(0, "StatusLineBranch", { fg = "#98be65", bg = "#1e2326", bold = true })
      vim.api.nvim_set_hl(0, "StatusLineDiag", { fg = "#ff6c6b", bg = "#1e2326" })
      vim.api.nvim_set_hl(0, "StatusLineLSP", { fg = "#7aa2f7", bg = "#1e2326" })
      vim.api.nvim_set_hl(0, "StatusLineFormat", { fg = "#9ca0a4", bg = "#1e2326" })
      vim.api.nvim_set_hl(0, "StatusLineLocation", { fg = "#c678dd", bg = "#1e2326", bold = true })
    end,
  })

  -- Trigger the colorscheme event to set initial colors
  vim.cmd("doautocmd ColorScheme")
end

-- Update statusbar function
function M.update_statusbar()
  M.setup_statusbar()
end

-- Setup autocmds for dynamic updates
function M.setup_autocmds()
  local group = vim.api.nvim_create_augroup("StatusBar", { clear = true })

  -- Update on various events
  vim.api.nvim_create_autocmd({
    "BufEnter",
    "BufWritePost",
    "CursorMoved",
    "DiagnosticChanged",
    "LspAttach",
    "LspDetach",
  }, {
    group = group,
    callback = M.update_statusbar,
  })

  -- Update on git operations
  vim.api.nvim_create_autocmd("User", {
    pattern = "GitChanged",
    group = group,
    callback = M.update_statusbar,
  })
end

-- Initialize the statusbar
function M.init()
  M.setup_statusbar()
  M.setup_autocmds()
end

return M
