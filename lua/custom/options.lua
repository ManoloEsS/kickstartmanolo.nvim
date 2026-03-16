vim.o.list = true
vim.opt.listchars = {
  tab = '│ ',
  trail = '·',
  nbsp = '␣',
  leadmultispace = '│   ',
}

vim.o.nu = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.o.undofile = true
vim.o.termguicolors = true
vim.o.hlsearch = false
vim.o.incsearch = true
vim.opt.isfname:append '@-@'
vim.opt.autoread = true

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  callback = function()
    if vim.fn.expand '%' ~= '' and vim.bo.buftype == '' then
      vim.cmd 'checktime'
    end
  end,
})
