-- Default to 79, override by filetype
vim.o.textwidth = 79
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'c', 'cpp', 'python' },
  callback = function()
    vim.opt_local.textwidth = 120
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'rst' },
  callback = function()
    vim.opt_local.textwidth = 119
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'java' },
  callback = function()
    vim.opt_local.textwidth = 149
  end,
})

-- Add a colored column at the end of wanted lines.
vim.o.colorcolumn = '+1'
-- Set textwidth }}}

-- Update foldmethod to git files, so git commits are shown nicer
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'git',
  callback = function()
    vim.opt_local.foldmethod = 'syntax'
  end,
})
