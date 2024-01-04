M = {
	"kdheepak/lazygit.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}

M.config = function()
	require("telescope").load_extension("lazygit")
end

return M
