-- vim.schedule(function()
  vim.pack.add({
    {
      src = 'gh:dmxk062/hexed.nvim',
      version = 'main',
    },
  })

  local hexed = require "hexed"
  hexed.setup {
      highlights = {
        String  = "String",      -- ascii characters
        Null    = "NonText",     -- null bytes
        Newline = "SpecialChar", -- newline characters(\n and \r)
        Address = "Label",       -- the addresses at the beginning of lines
        Byte    = "Identifier",  -- any other byte
        Region  = "Visual",      -- context are in preview buffer
        Char    = "Substitute",  -- character the cursor is on
      },
      command = "Hexed",         -- the command used to invoke hexed
  }
-- end)
