-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'numToStr/FTerm.nvim',
    config = function()
      local fterm = require 'FTerm'
      -- Create a custom terminal in lower right corner
      local custom_term = fterm:new {
        ft = 'fterm_custom',
        cmd = vim.o.shell,
        dimensions = {
          height = 0.6, -- 40% of window height
          width = 0.5, -- 60% of window width
          x = 0.95, -- 5% margin from right
          y = 0.95, -- 5% margin from bottom
        },
        border = 'rounded', -- You can use: 'single', 'double', 'rounded', etc.
      }
      -- Toggle function
      function _G.__fterm_custom_toggle()
        custom_term:toggle()
      end
      vim.keymap.set('n', '<C-t>', '<CMD>lua __fterm_custom_toggle()<CR>', { desc = '[T]oggle [T]erminal' })
      vim.keymap.set('t', '<C-t>', '<C-\\><C-n><CMD>lua __fterm_custom_toggle()<CR>', { desc = '[T]oggle [T]erminal' })
    end,
  },
  {
    -- File: ~/.config/nvim/lua/plugins/undotree.lua
    'mbbill/undotree',
    keys = {
      { '<leader>u', '<cmd>UndotreeToggle<cr>', desc = 'UndoTree Toggle' },
    },
    config = function()
      vim.g.undotree_SetFocusWhenToggle = 1 -- Auto-focus when opening
      vim.g.undotree_WindowLayout = 2 -- Use a different layout (optional)
    end,
  },
}
