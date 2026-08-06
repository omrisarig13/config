-- Required by telescope, don't lazy load.
vim.pack.add({
  {
    src = 'gh:AckslD/nvim-neoclip.lua',
    version = 'main',
  },
})

local neoclip = require 'neoclip'

neoclip.setup({
  on_select = {
    move_to_front = true,
  },
  on_paste = {
    set_reg = true,
    move_to_front = true,
  },
  on_replay = {
    set_reg = true,
    move_to_front = true,
  },
})
