local wk = require("which-key")
local builtin = require("telescope.builtin")

-- Neovim remaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- moving selected block of text
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

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
      g = {"<cmd>LazyGit<CR>", "LazyGit" }
		},
	},
}, { mode = "n" }) -- 'n' for normal mode
-- LuaSnip
wk.register({
    ["<c-j>"] = { "<cmd>lua require'luasnip'.jump(1)<CR>", "Snippet Jump Forward" },
    ["<c-k>"] = { "<cmd>lua require'luasnip'.jump(-1)<CR>", "Snippet Jump Backward" },
}, { mode = "i" }) -- For insert mode

wk.register({
    ["<c-j>"] = { "<cmd>lua require'luasnip'.jump(1)<CR>", "Snippet Jump Forward" },
    ["<c-k>"] = { "<cmd>lua require'luasnip'.jump(-1)<CR>", "Snippet Jump Backward" },
}, { mode = "s" }) -- For select mode

-- CMP
wk.register({
    ["<c-s>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
}, { mode = "i" }) -- 'i' for insert mode

-- Trouble keys
