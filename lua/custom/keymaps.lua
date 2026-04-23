vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = '[P]rev [V]iew files' })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = '[M]ove line down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = '[M]ove line up' })
vim.keymap.set('n', 'J', 'mzJ`z', { desc = '[J]oin lines' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = '[D]own half page' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = '[U]p half page' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = '[N]ext search result' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = '[-]rev search result' })
vim.keymap.set('n', '=ap', "ma=ap'a", { desc = '[A]uto [P]aragraph' })
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = '[P]aste from black hole' })
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = '[Y]ank to clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = '[Y]ank line to clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d', { desc = '[D]elete to black hole' })
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz', { desc = '[K]ext location' })
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz', { desc = '[J]rev location' })
vim.keymap.set('t', '<C-a>', '<C-\\><C-n>', { desc = '[E]xit terminal' })
vim.keymap.set('n', '<leader>a', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]], { desc = '[A]ll in file' })

vim.keymap.set({ 'i', 's' }, '<C-.>', function()
  require('blink.cmp').snippet_forward()
end, { desc = 'Snippet forward' })

vim.keymap.set({ 'i', 's' }, '<C-,>', function()
  require('blink.cmp').snippet_backward()
end, { desc = 'Snippet backward' })

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
