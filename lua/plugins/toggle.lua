return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        else
          return 20
        end
      end,
      hide_numbers = true,
      open_mapping = [[<c-\>]],
      shade_filetypes = {},
      shade_terminals = false,
      shading_factor = 0.1, -- the degree by which to darken to terminal colour start_in_insert = true,
      persist_size = true,
      direction = "horizontal",
      close_on_exit = true,
      float_opts = {
        border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
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
      "<cmd>ToggleTerm<CR>", -- Uses the default direction, which is horizontal
      { noremap = true, silent = true, desc = "Toggle Horizontal Terminal" }
    )

    -- Optionally, if you want a vertical terminal as well:
    vim.api.nvim_set_keymap(
      "n",
      "<leader>tf",
      "<cmd>ToggleTerm direction=float size=80<CR>",
      { noremap = true, silent = true, desc = "Toggle Float Terminal" }
    )
  end,
}
