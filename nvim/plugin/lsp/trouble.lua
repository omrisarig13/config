-- vim.schedule(function()
  vim.pack.add({
    {
      src = 'gh:folke/trouble.nvim',
      version = 'main',
    },
  })

  local trouble = require('trouble')
  trouble.setup({})

  vim.keymap.set('n', "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
  vim.keymap.set('n', "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    { desc = "Buffer Diagnostics (Trouble)" })
  vim.keymap.set('n', "<leader>xa", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
  vim.keymap.set('n', "<leader>xb", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    { desc = "LSP Definitions / references / ... (Trouble)" })
  vim.keymap.set('n', "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
  vim.keymap.set('n', "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

-- end)
