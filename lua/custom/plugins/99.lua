return {
  'ThePrimeagen/99',
  config = function()
    local _99 = require('99')
    local cwd = vim.uv.cwd()
    local basename = vim.fs.basename(cwd)

    _99.setup({
      provider = _99.Providers.OpenCodeProvider,
      model = "opencode-go/qwen3.5-plus",
      logger = {
        level = _99.DEBUG,
        path = '/tmp/' .. basename .. '.99.debug',
        print_on_error = true,
      },
    })

    vim.keymap.set('n', '<leader>9s', function()
      _99.search()
    end, { desc = '[9]9 Search' })

    vim.keymap.set('v', '<leader>9v', function()
      _99.visual()
    end, { desc = '[9]9 Visual' })
  end,
}