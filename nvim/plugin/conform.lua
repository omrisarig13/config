-- vim.schedule(function()
vim.pack.add({
  {
    src = 'gh:stevearc/conform.nvim',
    version = 'master',
  },
})

local conform = require('conform')
conform.setup({
  notify_on_error = true,
  format_on_save = function(bufnr)
    -- Disable "format_on_save lsp_fallback" for languages that don't
    -- have a well standardized coding style. You can add additional
    -- languages here or re-enable it for the disabled ones.
    local disable_filetypes = { kotlin = true, java = true, python = true, bash = true, sh = true, nix = true, c = true, cpp = true }
    if disable_filetypes[vim.bo[bufnr].filetype] then
      return nil
    else
      return {
        timeout_ms = 500,
        lsp_format = 'fallback',
      }
    end
  end,
  formatters_by_ft = {
    lua = { 'luaformatter' },
    c = { 'clang-format' },
    nix = { 'nixfmt' },
    java = { 'clang-format' },
    bash = { 'shfmt' },
    sh = { 'shfmt' },
    python = { 'black' },
    json = { 'jq' },
  },
})

vim.keymap.set('n', '<leader>f',
  function()
    require('conform').format { async = true, lsp_format = 'fallback' }
  end,
  { desc = '[F]ormat buffer' })
-- end)
