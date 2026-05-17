-- Native statusline (|%| items + evaluated components)

local M = {}

local components = {}

function components.git_branch()
  local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  if vim.v.shell_error == 0 and branch ~= "" then
    return " " .. branch .. " "
  end
  return ""
end

function components.diagnostics()
  local diagnostics = vim.diagnostic.get(0)
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

function components.location()
  local line = vim.fn.line(".")
  local col = vim.fn.col(".")
  return " " .. line .. ":" .. col .. " "
end

function components.lsp_status()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
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

function components.file_info()
  local filename = vim.fn.expand("%:t")
  local modified = vim.bo.modified and " [+]" or ""

  local file_icon = ""
  if vim.fn.exists("*WebDevIconsGetFileTypeSymbol") == 1 then
    file_icon = vim.fn.WebDevIconsGetFileTypeSymbol(filename) .. " "
  end

  return file_icon .. filename .. modified .. " "
end

function components.file_format()
  local encoding = vim.bo.fileencoding
  local format = vim.bo.fileformat

  if encoding == "" then
    encoding = vim.o.encoding
  end

  return " " .. encoding .. " " .. format .. " "
end

function M.setup_statusbar()
  vim.o.statusline = table.concat({
    "%#StatusLine#",
    components.file_info(),

    -- "%#StatusLineBranch#",
    -- components.git_branch(),

    "%#StatusLineDiag#",
    components.diagnostics(),

    "%=",

    -- "%#StatusLineLSP#",
    -- components.lsp_status(),

    -- "%#StatusLineFormat#",
    -- components.file_format(),

    "%#StatusLineLocation#",
    components.location(),
  })

  vim.o.laststatus = 2

  vim.o.rulerformat = "%l:%c %p%%"
end

function M.update_statusbar()
  M.setup_statusbar()
end

function M.setup_autocmds()
  local group = vim.api.nvim_create_augroup("StatusBar", { clear = true })

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

  vim.api.nvim_create_autocmd("User", {
    pattern = "GitChanged",
    group = group,
    callback = M.update_statusbar,
  })
end

function M.init()
  M.setup_statusbar()
  M.setup_autocmds()
end

return M
