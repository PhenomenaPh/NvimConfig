return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local gitsigns = require("gitsigns")
    gitsigns.setup({
      signs = {
        add = { text = "▐" },
        change = { text = "▐" },
        delete = { text = "▐" },
        topdelete = { text = "▐" },
        changedelete = { text = "▐" },
        untracked = { text = "▐" },
      },
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      numhl = false,  -- Toggle with `:Gitsigns toggle_nunhl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
      sign_priority = 9,
      watch_gitdir = {
        interval = 1000,
      },
      attach_to_untracked = false,
      preview_config = {
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { desc = desc, silent = true })
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end, { expr = true })

        map("n", "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, { expr = true })

        -- Actions
        map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk")
        map("n", "<leader>hr", gs.reset_hunk, "Reset Hunk")
        map("v", "<leader>hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage Hunk (Visual)")
        map("v", "<leader>hr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset Hunk (Visual)")
        map("n", "<leader>hS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>hu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>hR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk")
        map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>tb", gs.toggle_current_line_blame, "Toggle Current Line Blame")
        map("n", "<leader>hd", gs.diffthis, "Diff This")
        map("n", "<leader>hD", function() gs.diffthis("~") end, "Diff This ~")
        map("n", "<leader>td", gs.toggle_deleted, "Toggle Deleted")
      end,
    })
    --		if pcall(require, "scrollbar") then
    --			require("scrollbar.handlers.gitsigns").setup()
    --		end
  end,
  event = { "BufReadPre", "BufNewFile" },
}
