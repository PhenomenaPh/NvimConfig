local wk = require("which-key")

-- Neovim remaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- moving selected block of text
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- NeoTree keybinding
wk.register({
	["<C-n>"] = { ":Neotree filesystem reveal left<CR>", "NeoTree" },
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

-- toggleterm
function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
	vim.keymap.set("t", "<C-q>", [[<C-\><C-n>:q<CR>]], opts) -- Example keybinding
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
