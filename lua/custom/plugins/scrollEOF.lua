return {
  'Aasim-A/scrollEOF.nvim',
  config = function()
    require('scrollEOF').setup {
      -- Number of lines to keep as padding below the last line
      max_padding = 0,
      -- Set to true if you want the padding even when the buffer is not focused
      always_enabled = false,
      -- You can also customize other options, see plugin docs
    }
  end,
}
