-- vim.schedule(function()
  -- Pre-requisites:
  -- - folke/snacks.nvim is available
  vim.pack.add({
    {
      src = 'gh:2kabhishek/pickme.nvim',
      version = 'main',
    },
    {
      src = 'gh:2kabhishek/tdo.nvim',
      version = 'main',
    },
  })

  local tdo = require "tdo"

  tdo.setup {
        use_new_command = true,
        add_default_keybindings = false,
  }

  vim.keymap.set('n', '<leader>df', "<cmd>Tdo files<cr>", { desc = 't[D]o [F]iles' })
  vim.keymap.set('n', '<leader>dt', "<cmd>Tdo todos<cr>", { desc = 't[D]o [T]odos' })
  vim.keymap.set('n', '<leader>dd', "<cmd>Tdo<cr>", { desc = 't[D]o' })

-- end)
