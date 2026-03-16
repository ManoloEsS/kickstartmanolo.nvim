return {
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      {
        'github/copilot.vim',
        config = function()
          vim.g.copilot_enabled = false
        end,
      },
    },
    opts = {
      strategies = {
        chat = { adapter = 'copilot' },
        inline = { adapter = 'copilot' },
        cmd = { adapter = 'copilot' },
      },
      display = {
        chat = {
          window = {
            layout = 'vertical',
          },
        },
        diff = {
          enabled = false,
        },
      },
    },
    config = function(_, opts)
      require('codecompanion').setup(opts)

      vim.keymap.set({ 'n', 'v' }, '<leader>ca', '<cmd>CodeCompanionActions<cr>', { desc = 'CodeCompanion Actions' })
      vim.keymap.set({ 'n', 'v' }, '<leader>cc', '<cmd>CodeCompanionChat Toggle<cr>', { desc = 'CodeCompanion Chat' })
      vim.keymap.set('v', '<leader>cs', function()
        local input = vim.fn.input('Inline prompt: ')
        if input ~= '' then
          vim.cmd('CodeCompanion ' .. input)
        end
      end, { desc = 'CodeCompanion Inline (selection)' })
      vim.keymap.set('n', '<leader>cb', '<cmd>CodeCompanionChat Add<cr>', { desc = 'Add buffer to chat' })
      vim.keymap.set('n', '<leader>cr', '<cmd>CodeCompanionChat<cr>', { desc = 'New CodeCompanion Chat' })
    end,
  },
}
