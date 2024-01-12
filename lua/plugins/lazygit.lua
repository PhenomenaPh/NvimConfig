M = {
  "kdheepak/lazygit.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

M.config = function()
  require("telescope").load_extension("lazygit")
  vim.keymap.set("n", "<leader>cg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })
end

return M
