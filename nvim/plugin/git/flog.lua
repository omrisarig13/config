-- vim.schedule(function()
  vim.pack.add({
    {
      src = 'gh:rbong/vim-flog',
      version = 'master',
    },
  })

  vim.keymap.set('n', '<leader>gp', '<cmd>tabnew <bar> exec "Flog" <bar> G <bar> tabmove-1 <bar> DiffviewOpen <cr>',
    { desc = '[G]it [P]age', silent = true })
  vim.keymap.set('n', '<leader>gl', '<cmd>-tabnew <bar> Flog<cr>', { desc = '[G}it f[L]og' })
-- end)
