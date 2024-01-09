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
        "lsp_definitions",
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
    local trouble = require("trouble")

    -- Define key mappings with descriptions for the Trouble plugin
    vim.keymap.set("n", "<leader>xx", function() trouble.toggle() end, { desc = "Toggle Trouble" })
    vim.keymap.set("n", "<leader>xw", function() trouble.toggle("workspace_diagnostics") end, { desc = "Workspace Diagnostics" })
    vim.keymap.set("n", "<leader>xd", function() trouble.toggle("document_diagnostics") end, { desc = "Document Diagnostics" })
    vim.keymap.set("n", "<leader>xq", function() trouble.toggle("quickfix") end, { desc = "Quickfix" })
    vim.keymap.set("n", "<leader>xl", function() trouble.toggle("loclist") end, { desc = "Location List" })
    vim.keymap.set("n", "gR", function() trouble.toggle("lsp_references") end, { desc = "LSP References" })
  end,
}
