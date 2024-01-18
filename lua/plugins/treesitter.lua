M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
}

M.config = function()
	local configs = require("nvim-treesitter.configs")
	configs.setup({
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
	})
end

return M
