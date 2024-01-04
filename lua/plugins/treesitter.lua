M = {
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate"
}

M.config = function()
  local config = require("nvim-treesitter.configs")
  config.setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "python" },
    highlight = { enable = true },
    indent = { enable = true },
  })
end

return M
