-- Go Auto Import integration for LazyVim (Kickstart Neovim)
-- Place this file in: ~/.config/nvim/lua/plugins/go_auto_import.lua

return {
  -- You can use an init function for autocmds
  {
    'neovim/nvim-lspconfig',
    init = function()
      local group = vim.api.nvim_create_augroup('GoAutoImport', { clear = true })

      -- Organize imports and format on save
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = group,
        pattern = '*.go',
        callback = function()
          vim.lsp.buf.format { async = false }
          vim.lsp.buf.code_action {
            context = { only = { 'source.organizeImports' } },
            apply = true,
          }
        end,
      })

      -- Organize imports when leaving insert mode
      vim.api.nvim_create_autocmd('InsertLeave', {
        group = group,
        pattern = '*.go',
        callback = function()
          vim.lsp.buf.code_action {
            context = { only = { 'source.organizeImports' } },
            apply = true,
          }
        end,
      })
    end,
  },
}
