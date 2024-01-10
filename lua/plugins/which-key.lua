return {
	"folke/which-key.nvim",
	keys = { "<leader>" },
	config = function()
		local which_key = require("which-key")

		which_key.setup({
			plugins = {
				spelling = {
					enabled = true,
					suggestions = 20,
				},
			},
			window = {
				border = "shadow",
				position = "bottom",
				margin = { 0, 1, 1, 5 },
				padding = { 1, 2, 1, 2 },
			},
			triggers_nowait = {
				"`",
				"'",
				"g`",
				"g'",
				'"',
				"<c-r>",
				"z=",
			},
		})

		local opts = {
			prefix = "<leader>",
		}

		local groups = {
			c = { name = "Code stuff" },
			f = { name = "File search" },
			g = { name = "LSP related" },
			x = { name = "Trouble" },
			h = { name = "GitSigns" },
			t = { name = "Git Toggle" },
			n = { name = "Cmd line" },
		}

		which_key.register(groups, opts)
	end,
}
