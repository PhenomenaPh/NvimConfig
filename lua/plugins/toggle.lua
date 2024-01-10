return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			size = 10,
			hide_numbers = true,
			start_in_insert = true,
			open_mapping = [[<c-\>]],
			shade_filetypes = {},
			shade_terminals = false,
			shading_factor = 0.1, -- the degree by which to darken to terminal colour start_in_insert = true,
			persist_size = true,
			persist_mode = false,
			direction = "horizontal",
			close_on_exit = true,
			float_opts = {
				width = function()
					return math.ceil(vim.o.columns * 0.5)
				end,
				height = function()
					return math.ceil(vim.o.lines * 0.3)
				end,
			},
		})
		-- Key mapping for a floating terminal
		vim.api.nvim_set_keymap(
			"n",
			"<Your Keybinding for Floating>",
			"<cmd>ToggleTerm direction=float<CR>",
			{ noremap = true, silent = true, desc = "Toggle Floating Terminal" }
		)

		-- Key mapping for a horizontal terminal (using default direction)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>th",
			"<cmd>ToggleTerm direction=horizontal<CR>", -- Uses the default direction, which is horizontal
			{ noremap = true, silent = true, desc = "Toggle Horizontal Terminal" }
		)

		-- Optionally, if you want a vertical terminal as well:
		vim.api.nvim_set_keymap(
			"n",
			"<leader>tf",
			"<cmd>ToggleTerm direction=float <CR>",
			{ noremap = true, silent = true, desc = "Toggle Float Terminal" }
		)
	end,
}
