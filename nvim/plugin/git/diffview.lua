vim.schedule(function()
  vim.pack.add({
    {
      -- src = 'gh:sindrets/diffview.nvim',
      -- Maintained fork - keep an eye for updates...
      src = 'gh:dlyongemallo/diffview.nvim',
      version = 'main',
    },
  })

  local function _add_file_as_line(file_name)
    local lazy = require('diffview.lazy')
    local lib = lazy.require('diffview.lib') ---@module "diffview.lib"
    local view = lib.get_current_view() ---@class DiffView

    if view == nil then
      return
    end

    if view.panel:is_open() then
      local current_item = view.panel:get_item_at_cursor()
      if current_item == nil then
        return
      end
      local is_dir = (current_item.collapsed ~= nil)
      vim.cmd('split ' .. file_name)
      vim.cmd 'wincmd K'
      local last_line = vim.api.nvim_buf_line_count(0)

      local line = current_item.path
      if is_dir then
        line = line .. '/'
      end

      vim.api.nvim_buf_set_lines(0, last_line, last_line, false, { line })
      vim.api.nvim_win_set_cursor(0, { last_line + 1, 0 })
    end
  end

  local function add_to_exclude()
    _add_file_as_line '.git/info/exclude'
  end

  local function add_to_ignore()
    _add_file_as_line '.gitignore'
  end

  local diffview = require('diffview')
  diffview.setup({
    use_icons = false, -- TODO: Re-enable this when icons are installed
    keymaps = {
      file_panel = {
        { 'n', 'cc', '<Cmd>Git commit <bar> wincmd K<CR>',         { desc = 'Commit staged changes' } },
        { 'n', 'ca', '<Cmd>Git commit --amend <bar> wincmd K<CR>', { desc = 'Amend the last commit' } },
        { 'n', 'ce', '<Cmd>Git commit --amend --no-edit<CR>',      { desc = 'Amend the last commit without editting' } },
        { 'n', 'gi', add_to_ignore,                                { desc = 'Add the current file to the .gitignore' } },
        { 'n', 'gI', add_to_exclude,                               { desc = 'Add the current file to the .git/info/exclude' } },
        { 'n', 'nd', require('notify').dismiss,                    { desc = 'Notification Dismiss' } },
      },
    },
    view = {
      merge_tool = {
        layout = 'diff4_mixed',
      },
    },
  })

  vim.keymap.set('n', '<leader>gd', '<cmd>DiffviewOpen<cr>', { desc = '[G]it [D]iff view open' })
  vim.keymap.set('n', '<leader>gh', '<cmd>DiffviewOpen HEAD~..HEAD"<cr>',
    { desc = '[G]it DiffviewOpen of [H]ead (diffview of last commit).' })
end)
