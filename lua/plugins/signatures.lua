M = {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  config = function()
    require("lsp_signature").setup({})
  end
}

return M
