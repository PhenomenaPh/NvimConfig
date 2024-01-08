local on_attach = function(client, bufnr)
    -- other setup code for on_attach

    -- Configure virtual text to show a circle symbol
    vim.diagnostic.config({
        virtual_text = {
            prefix = '●',  -- Circle symbol as prefix
            -- you can also customize other properties like spacing here
        },
        -- other diagnostic settings...
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
		"jay-babu/mason-null-ls.nvim",
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = { "stylua", "black", "ruff", "isort", "prettier" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = true,
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
        on_attach = on_attach,
				capabilities = capabilities,
			})

			lspconfig.pyright.setup({
        on_attach = on_attach,
				capabilities = capabilities,
			})

			lspconfig.marksman.setup({
        on_attach = on_attach,
				capabilities = capabilities,
			})
		end,
	},
}
