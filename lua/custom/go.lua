local group = vim.api.nvim_create_augroup('GoAutoImport', { clear = true })

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
