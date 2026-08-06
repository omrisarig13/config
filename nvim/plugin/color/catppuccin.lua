-- Should be loaded before first draw, don't lazy load.
  vim.pack.add({
    {
      src = 'gh:catppuccin/nvim',
      version = 'main',
    },
  })

vim.cmd.colorscheme 'catppuccin'
