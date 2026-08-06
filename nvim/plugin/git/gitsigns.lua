-- vim.schedule(function()
  vim.pack.add({
    {
      src = 'gh:lewis6991/gitsigns.nvim',
      version = 'main',
    },
  })

  local gitsigns = require 'gitsigns'

  gitsigns.setup({

    on_attach = function(bufnr)
      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation {{{
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, { desc = 'Jump to next git [c]hange' })

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, { desc = 'Jump to previous git [c]hange' })
      -- Navigation }}}

      -- Actions {{{
      -- visual mode {{{
      map('v', '<leader>hs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'git [s]tage hunk' })
      map('v', '<leader>hr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'git [r]eset hunk' })
      -- visual mode }}}
      -- normal mode {{{
      map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
      map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
      map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer' })
      map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })
      map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
      map('n', '<leader>hb', gitsigns.blame, { desc = '[G]it [b]lame' })
      map('n', '<leader>gb', gitsigns.blame, { desc = '[G]it [b]lame' })
      map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = 'git [i]nline hunk preview' })
      -- Diff functions {{{
      map('n', '<leader>hdd', gitsigns.diffthis, { desc = 'git [d]iff against index' })
      map('n', '<leader>hdl', function()
        gitsigns.diffthis 'HEAD~'
      end, { desc = 'git [D]iff against [L]ast commit' })
      -- Diff functions }}}
      -- normal mode }}}
      -- Populate quickfix with hunks. {{{
      map('n', '<leader>hq', gitsigns.setqflist, { desc = 'pupulate [q]uickfix with file hunks' })
      map('n', '<leader>hQ', function()
        gitsigns.setqflist 'all'
      end, { desc = 'pupulate [q]uickfix with all file hunks' })
      -- Populate quickfix with hunks. }}}
      -- Actions }}}
      -- Toggles {{{
      map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Toggle git blame on line' })
      map('n', '<leader>td', gitsigns.toggle_deleted, { desc = 'Toggle shown deleted git content' })
      map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = 'Toggle a git highlight for all changed words' })
      -- Toggles }}}
      -- Text object {{{
      map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { desc = 'Select the current git hunk' })
      -- Text object }}}
    end,
  })
-- end)
