local wk = require("which-key")

-- Telescope
wk.register({
  -- first pressing key
  f = {
    name = 'telescope',
    -- second key
    f = { function()
      require('telescope.builtin').find_files()
    end, 'Find file' },
    g = { function()
      require('telescope.builtin').live_grep() end, 'Live grep' },
    b = { function()
      require('telescope.builtin').buffers()
    end, 'Buffers' },
    h = { function()
      require('telescope.builtin').help_tags()
    end, 'Help tags' }
  },
}, {prefix = '<leader>'})
