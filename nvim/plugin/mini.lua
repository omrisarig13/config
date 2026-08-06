-- vim.schedule(function()
vim.pack.add({
  {
    src = 'gh:echasnovski/mini.nvim',
    version = 'main',
  },
})

-- Better Around/Inside textobjects
--
-- Examples:
--  - va)  - [V]isually select [A]round [)]paren
--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
--  - ci'  - [C]hange [I]nside [']quote
-- require('mini.ai').setup()

-- Add/delete/replace surroundings (brackets, quotes, etc.)
--
-- 'tpope/vim-surround' equivalent.
--
-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
-- - sd'   - [S]urround [D]elete [']quotes
-- - sr)'  - [S]urround [R]eplace [)] [']
require('mini.surround').setup()

-- Session handling
--
-- 'tpope/vim-obsession' equivalent
-- require('mini.sessions').setup()
-- local sessions = require 'mini.sessions'
-- vim.keymap.set('n', '<leader>isc', function()
--   local session_name = sessions.config.file
--   vim.cmd('mksession ' .. session_name)
-- end, { desc = 'M[I]ni [S]ession [C]reate' })
-- vim.keymap.set('n', '<leader>isr', sessions.read, { desc = 'M[I]ni [S]ession [R]ead' })
-- vim.keymap.set('n', '<leader>isw', sessions.write, { desc = 'M[I]ni [S]ession [W]rite' })
-- vim.keymap.set('n', '<leader>iss', sessions.select, { desc = 'M[I]ni [S]ession [S]elect' })
-- vim.keymap.set('n', '<leader>isd', function()
--   sessions.delete(nil, { force = true })
-- end, { desc = 'M[I]ni [S]ession [D]elete' })

-- Alignment plugin
--
-- gaip= - Align = signs.
-- [v]: gA= Align equal signs in selected visual.
-- require('mini.align').setup()

-- Move lines and selected text around using alt+movement, in both visual
-- and normal mode
-- require('mini.move').setup()

-- Some cool operators
--
-- - g=<operator> - evaluate
-- - gx<operator> + . - exchange
-- - gm<operator> - duplicate
-- - gs<operator> - sort
--
-- replace is equivalent to 'inkarkat/vim-ReplaceWithRegister'
local sort_func = function(content, opts)
  opts = vim.tbl_deep_extend('force', opts or {}, {
    compare_fun = function(a, b)
      return string.lower(a or '') < string.lower(b or '')
    end
  })
  return MiniOperators.default_sort_func(content, opts)
end

require('mini.operators').setup {
  replace = {
    prefix = '<leader>e',
  },
  sort = {
    func = sort_func
  },
}

-- Split and join function arguments, adds/removes newlines as wanted.
--
-- - gS split/join the arguments.
-- require('mini.splitjoin').setup()

-- Use the [] brackets to move around.
-- require('mini.bracketed').setup()

-- This is a different implementation for diff handling in nvim.
-- Currently, I'm happy with the default handling, but this can be
-- re-evaluated later, if more features are needed/wanted.
--
-- This is wanted for codecompanion, and disabled by default.
-- local diff = require("mini.diff")
-- diff.setup({
--   -- Disabled by default
--   source = diff.gen_source.none(),
-- })

-- Better handling when opening directory as file.
--
-- Add mapping for easy open and close of the file explorer.
require('mini.files').setup()
vim.keymap.set('n', '<leader>if', MiniFiles.open, { desc = 'M[I]ni [F]ile explorer open' })
vim.keymap.set('n', '<leader>ic', function()
  MiniFiles.open(vim.api.nvim_buf_get_name(0))
end, { desc = 'M[I]ni file explorer open [C]urrent file' })
vim.keymap.set('n', '<leader>ii', function()
  local file_path = vim.fn.input('Enter path to open:', '', 'file')
  MiniFiles.open(file_path)
end, { desc = 'M[I]ni file explorer open [I]nputted path' })

local map_split = function(buf_id, lhs, direction)
  local rhs = function()
    -- Make new window and set it as target
    local cur_target = MiniFiles.get_explorer_state().target_window
    local new_target = vim.api.nvim_win_call(cur_target, function()
      vim.cmd(direction .. ' split')
      return vim.api.nvim_get_current_win()
    end)

    MiniFiles.set_target_window(new_target)

    -- This intentionally doesn't act on file under cursor in favor of
    -- explicit "go in" action (`l` / `L`). To immediately open file,
    -- add appropriate `MiniFiles.go_in()` call instead of this comment.
    MiniFiles.go_in()
    MiniFiles.close()
  end

  -- Adding `desc` will result into `show_help` entries
  local desc = 'Split ' .. direction
  vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
end

vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesBufferCreate',
  callback = function(args)
    local buf_id = args.data.buf_id
    -- Tweak keys to your liking
    map_split(buf_id, '<C-s>', 'belowright horizontal')
    map_split(buf_id, '<C-v>', 'belowright vertical')
    map_split(buf_id, '<C-t>', 'tab')
    vim.keymap.set('n', '<cr>', function()
      local fs_entry = MiniFiles.get_fs_entry()

      if fs_entry == nil or fs_entry.fs_type == nil or fs_entry.path == nil then
        print 'Invalid fs_entry table'
        return
      end

      if fs_entry.fs_type == 'directory' then
        local current_window = vim.api.nvim_get_current_win()
        vim.cmd('windo lcd ' .. fs_entry.path)
        vim.api.nvim_set_current_win(current_window)
      elseif fs_entry.fs_type == 'file' then
        MiniFiles.go_in()
        MiniFiles.close()
      end
    end, { buffer = buf_id, desc = 'LCD to current directory' })
  end,
})

-- Highlight current word
--
-- Equivalent to vim_current_word
-- require('mini.cursorword').setup()

-- Highlight and remove trailing spaces.
-- require('mini.trailspace').setup()
-- vim.keymap.set('n', '<leader>it', MiniTrailspace.trim, { desc = 'M[I]ni [T]railspaces trim' })
-- vim.keymap.set('n', '<leader>il', MiniTrailspace.trim_last_lines, { desc = 'M[I]ni trailspaces trim [L]ines' })

-- todo-comments has more features than mini-hipatterns

require('mini.icons').setup()

-- Show indentation groups in a nice way.
--
-- Also solves the need for lukas-reineke/indent-blankline.nvim.
-- require('mini.indentscope').setup()

-- Show a short overview of the line length and indentation in the file
-- require('mini.map').setup()
-- vim.keymap.set('n', '<leader>im', MiniMap.toggle, { desc = 'M[I]ni [M]ap toggle' })

-- ... and there is more!
--  Check out: https://github.com/echasnovski/mini.nvim
-- end)
