local wk = require("which-key")
local builtin = require("telescope.builtin")

-- Telescope keybindings
wk.register({
	f = {
		name = "Telescope",
		f = { builtin.find_files, "Find File" },
		g = { builtin.live_grep, "Live Grep" },
		b = { builtin.buffers, "Buffers" },
		h = { builtin.help_tags, "Help Tags" },
    r = {builtin.oldfiles, "Recent files"}
	},
}, { prefix = "<leader>" })

-- NeoTree keybinding
wk.register({
	["<C-n>"] = { ":Neotree filesystem reveal left<CR>", "NeoTree" },
}, { mode = "n" }) -- 'n' for normal mode

-- LSP keybindings + Null-LS
wk.register({
	K = { vim.lsp.buf.hover, "LSP Hover" },
	["<leader>"] = {
		g = {
			name = "LSP",
			d = { vim.lsp.buf.definition, "Go To Definition" },
			r = { vim.lsp.buf.references, "Find References" },
			f = { vim.lsp.buf.format, "Format code" },
		},
		c = {
			name = "Code",
			a = { vim.lsp.buf.code_action, "Code Action" },
		},
	},
}, { mode = "n" }) -- 'n' for normal mode
