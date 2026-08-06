-- vim.schedule(function()
  vim.pack.add({
    {
      src = 'gh:folke/flash.nvim',
      version = 'main',
    },
  })

  local flash = require "flash"
  flash.setup({})

  vim.keymap.set({ 'n', 'x', 'o' }, 'ss', function() flash.jump() end, { desc = 'Flash' })
  vim.keymap.set('o', 'r', function() flash.remote() end, { desc = 'Remote Flash' })
-- end)
