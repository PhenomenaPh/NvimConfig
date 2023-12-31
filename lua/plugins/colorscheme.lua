M = {
-- colorscheme for Nvim - TokyoNight
    "catppuccin/nvim",
    name = 'catppuccin',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
}

M.config = function()
  vim.cmd.colorscheme 'catppuccin'
end

return M
