-- Set editing options
vim.opt.expandtab = true                -- Use spaces instead of tabs
vim.opt.tabstop = 2                     -- Number of spaces tabs count for
vim.opt.softtabstop = 2                 -- Number of spaces in tab when editing
vim.opt.shiftwidth = 2                  -- Number of spaces to use for each step of (auto)indent
vim.opt.clipboard:append("unnamedplus") -- Use the system clipboard
vim.opt.swapfile = false

-- Search options
vim.opt.ignorecase = true -- Case insensitive searching
vim.opt.smartcase = true  -- Case sensitive if search pattern is case sensitive

-- Additional visual options
vim.opt.showmatch = true      -- Highlight matching [{()}]
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.cursorline = true     -- Highlight the current line

-- Configure autoformatting behavior
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove("c")
    vim.opt.formatoptions:remove("r")
    vim.opt.formatoptions:remove("o")
  end,
})

-- Global variable settings
vim.g.mapleader = " " -- Set leader key

-- Which-key configuration
vim.opt.timeout = true   -- Enable timeout for multi-key sequences
vim.opt.timeoutlen = 300 -- Timeout length in milliseconds
vim.opt.mouse = ""       -- Disable mouse support

-- Getting warnings messages more prettier
local signs = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " ",
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
