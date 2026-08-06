-- Required by other plugins, don't lazy load.
vim.pack.add({
  {
    src = 'gh:rcarriga/nvim-notify',
    version = 'master',
  },
})

local notify = require 'notify'

notify.setup({
  top_down = true,
  merge_duplicates = true,
})

vim.keymap.set('n', '<leader>nd', notify.dismiss, { desc = '[N]otifications [D]ismiss' })

vim.notify = notify
