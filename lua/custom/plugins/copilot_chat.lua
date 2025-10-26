return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    build = 'make tiktoken',
    opts = {
      model = 'gpt-4o',

      -- Set default context to buffers
      context = 'buffers',

      window = {
        layout = 'float',
        relative = 'editor',
        width = 80,
        height = 20,
        row = 0,
        col = vim.o.columns - 80,
        border = 'rounded',
        title = '🤖 AI Assistant',
        zindex = 100,
      },

      separator = '━━',
      auto_fold_code = true,
    },

    config = function(_, opts)
      require('CopilotChat').setup(opts)

      -- Simple chat - uses context from opts (all buffers)
      vim.keymap.set('n', '<leader>cc', function()
        require('CopilotChat').open()
      end, { desc = 'CopilotChat - Open chat' })

      -- Chat with current buffer explicitly
      vim.keymap.set('n', '<leader>cb', function()
        local input = vim.fn.input 'Ask about buffer: '
        if input ~= '' then
          require('CopilotChat').ask(input, {
            selection = require('CopilotChat.select').buffer,
          })
        end
      end, { desc = 'CopilotChat - Ask about current buffer' })

      -- Chat with visual selection
      vim.keymap.set('v', '<leader>cs', function()
        local input = vim.fn.input 'Ask about selection: '
        if input ~= '' then
          require('CopilotChat').ask(input, {
            selection = require('CopilotChat.select').visual,
          })
        end
      end, { desc = 'CopilotChat - Ask about visual selection' })

      -- Reset
      vim.keymap.set('n', '<leader>cr', function()
        require('CopilotChat').reset()
      end, { desc = 'CopilotChat - Reset' })

      -- Close
      vim.keymap.set('n', '<leader>cx', function()
        require('CopilotChat').close()
      end, { desc = 'CopilotChat - Close' })
    end,
  },
}
