-- Default to 4 spaces
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.shiftround = true

-- Change to 2 spaces for certain filetypes
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown', 'rst', 'xml', 'lua' },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})
