vim.filetype.add({
  filename = {
    ['.Rprofile'] = 'r',
    ['hyprland.conf'] = 'conf',
  },
  extension = {
    config = 'conf'
  }
})

-- replicating vim-pencil
-- to figure out how to conceal markup
local pencil = vim.api.nvim_create_augroup('pencil', {clear = true})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.md',
  group = pencil,
  command = 'set linebreak'
})
