M = {
	"goolord/alpha-nvim",
}

M.config = function()
	local alpha = require("alpha")
	local dashboard = require("alpha.themes.dashboard")

	-- Set header
	dashboard.section.header.val = {
		"███╗   ██╗███████╗ ██████╗  ██████╗██████╗  ██████╗ ██╗     ",
		"████╗  ██║██╔════╝██╔═══██╗██╔════╝██╔══██╗██╔═══██╗██║     ",
		"██╔██╗ ██║█████╗  ██║   ██║██║     ██████╔╝██║   ██║██║     ",
		"██║╚██╗██║██╔══╝  ██║   ██║██║     ██╔══██╗██║   ██║██║     ",
		"██║ ╚████║███████╗╚██████╔╝╚██████╗██║  ██║╚██████╔╝███████╗",
		"╚═╝  ╚═══╝╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝",
	}

	-- Set menu
	dashboard.section.buttons.val = {
		dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
		dashboard.button("f", "󰈞  > Find file", ":Telescope find_files<CR>"),
		dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
		dashboard.button("s", "  > Settings", ":e ~/.config/nvim/lua/settings.lua<CR>"),
		dashboard.button("q", "󰩈  > Quit NVIM", ":qa<CR>"),
		dashboard.button("n", "  > File explorer", ":Neotree filesystem reveal left<CR>"),
	}

	local fortune = require("alpha.fortune")
	dashboard.section.footer.val = fortune()

	-- Send config to alpha
	alpha.setup(dashboard.opts)

	-- Disable folding on alpha buffer
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "alpha",
		callback = function()
			vim.wo.foldenable = false
		end,
	})
end

return M
