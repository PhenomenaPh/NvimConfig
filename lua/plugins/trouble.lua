return {
  -- "folke/trouble.nvim",
  "xero/trouble.nvim", -- till my pr is merged
  branch = "custom-indent",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("trouble").setup({
      auto_fold = false,
      fold_open = " ",
      fold_closed = " ",
      height = 6,
      indent_str = " ┊   ",
      include_declaration = {
        "lsp_references",
        "lsp_implementations",
        "lsp_definitions"
      },
      mode = "workspace_diagnostics",
      multiline = true,
      padding = false,
      position = "bottom",
      severity = nil, -- nil (ALL) or vim.diagnostic.severity.ERROR | WARN | INFO | HINT
      signs = {
        error = " ",
        hint = " ",
        information = " ",
        other = " ",
        warning = " ",
      },
      use_diagnostic_signs = false,
    })
  end,
}
