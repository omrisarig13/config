-- vim.schedule(function()
  vim.pack.add({
    {
      src = 'gh:nvim-tree/nvim-web-devicons',
      version = 'master',
    },
  })

  local nvim_web_devicons = require('nvim-web-devicons')

  nvim_web_devicons.setup({})
-- end)
