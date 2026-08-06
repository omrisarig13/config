-- vim.schedule(function()
  vim.pack.add({
    {
      src = 'gh:tpope/vim-fugitive',
      version = 'master',
    },
  })

  vim.keymap.set('n', '<leader>gc', '<cmd>G commit<cr>', { desc = '[G]it [C]ommit' })
  vim.keymap.set('n', '<leader>gf', '<cmd>G commit --fixup=<c-r>"<cr>', { desc = '[G]it [F]ixup (to unnamed register)' })
  vim.keymap.set('n', '<leader>gq', '<cmd>G commit --squash=<c-r>"<cr>',
    { desc = '[G]it s[Q]uash (to unnamed register)' })

  local function create_show_page(commit_to_show)
    vim.cmd('DiffviewOpen ' .. commit_to_show .. '~..' .. commit_to_show)
    vim.cmd('G show -s ' .. commit_to_show)
    vim.cmd 'wincmd K'
  end

  vim.keymap.set('n', '<leader>gs', function()
    create_show_page 'HEAD'
  end, { desc = '[G]it [S]how' })
  vim.keymap.set('n', '<leader>gu', function()
    create_show_page(vim.fn.expand '<cword>')
  end, { desc = '[G]it show commit [U]nder cursor' })
-- end)
