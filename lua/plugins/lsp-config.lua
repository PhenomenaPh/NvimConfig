local on_attach = function()
	-- Configure virtual text to show a circle symbol
	vim.diagnostic.config({
		virtual_text = {
			prefix = "●", -- Circle symbol as prefix
			-- you can also customize other properties like spacing here
		},
	})
end

return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"folke/neodev.nvim",
		},
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = true,
			})
			require("neodev").setup({
				-- add any options here, or leave empty to use the default settings
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			})

			lspconfig.pyright.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				handlers = {
					["textDocument/publishDiagnostics"] = function() end,
				},
			})

			lspconfig.marksman.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			-- LSP related mappings
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })

			-- LSP Goto and Format mappings
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go To Definition" })
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Find References" })
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format Code" })
			vim.keymap.set("n", "<space>gn", vim.lsp.buf.rename, { desc = "Rename variable" })

			-- Code actions and other code-related mappings
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
		end,
	},
}
