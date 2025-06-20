 return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
      opts = {
    context = 'buffer',
    mappings = {
      toggle_chat = {
        normal = '<leader>c c',
      },
    },
    auto_insert_mode = true,
    insert_at_end = true,
  },
  keys = {
    { '<leader>cc', '<cmd>CopilotChatToggle<cr>', desc = 'Toggle Copilot Chat' },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
