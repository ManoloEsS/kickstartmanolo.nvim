vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '=ap', "ma=ap'a")
vim.keymap.set('x', '<leader>p', [["_dP]])
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d')
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')
vim.keymap.set('t', '<C-a>', '<C-\\><C-n>')
vim.keymap.set('n', '<leader>a', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]])

vim.keymap.set('n', '<A-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<A-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<A-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<A-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<leader>w', '<C-w>=', { desc = 'Make equal splits' })

vim.keymap.set('n', '<leader>ra', function()
  local ext = vim.fn.expand '%:e'
  local current_file = vim.fn.expand '%:p'
  local view = vim.fn.winsaveview()

  local files = vim.fn.systemlist(string.format('find . -name "*.%s" -type f', ext))
  vim.cmd('args ' .. table.concat(files, ' '))

  vim.cmd('edit ' .. vim.fn.fnameescape(current_file))
  vim.fn.winrestview(view)

  print(string.format('Loaded %d . %s files into args', #files, ext))
end, { desc = 'Load all files with same extension into args' })

vim.keymap.set('n', '<leader>rp', function()
  vim.fn.setreg('/', '\\<' .. vim.fn.expand '<cword>' .. '\\>')
  vim.cmd 'set hlsearch'

  vim.api.nvim_feedkeys(
    vim.api.nvim_replace_termcodes(
      [[:argdo %s/\<<C-r><C-w>\>//gc | update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>]],
      true,
      false,
      true
    ),
    'n',
    false
  )
end, { desc = 'Replace word under cursor in args' })
