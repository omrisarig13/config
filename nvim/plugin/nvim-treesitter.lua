-- vim.schedule(function()
vim.pack.add({
  {
    src = 'gh:nvim-treesitter/nvim-treesitter',
    version = 'main',
  },
})

local supported_languages = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim',
  'vimdoc', 'cpp', 'python', 'java', 'kotlin', 'rst', 'json', 'nix' }

-- Map the 'bash' parser to the 'sh' filetype
vim.treesitter.language.register('bash', 'sh')

local filetype_patterns = vim.list_extend(vim.deepcopy(supported_languages), { 'sh' })

local nvim_treesitter = require 'nvim-treesitter'
nvim_treesitter.setup()
nvim_treesitter.install(supported_languages)

vim.api.nvim_create_autocmd('FileType', {
  pattern = filetype_patterns,
  callback = function() vim.treesitter.start() end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = filetype_patterns,
  callback = function()
    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldmethod = 'expr'
  end,
})
-- end)
