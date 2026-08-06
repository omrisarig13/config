local file_helpers = require('helper_functions.file')

local M = {}

-- Get the root of the current repository.
function M.get_repo_root()
  -- TODO: Think about re-implementing this, figure out if this will make it
  -- faster.
  local handle = io.popen("git rev-parse --show-toplevel 2>nul")
  if handle then
    local result = handle:read("*a")
    handle:close()
    return result:gsub("%s+$", "")
  end
  return nil
end

-- Open a view of the file in 3 worktrees, in a diffmode.
--
-- Not specifically a git function, but expected to be used with git worktrees.
-- parent1 and parent2 are folders relative to the _parent_ folder of the
-- current repository root.
function M.three_way_diff(parent1, parent2, file_name, line_number)
  vim.cmd('tabnew')

  local repo_root = M.get_repo_root()

  local parent1_file = repo_root .. '/../' .. parent1 .. '/' .. file_name
  vim.cmd('edit ' .. vim.fn.fnameescape(parent1_file))

  vim.cmd('vsplit ' .. vim.fn.fnameescape(file_name))

  local parent2_file = repo_root .. '/../' .. parent2 .. '/' .. file_name
  vim.cmd('vsplit ' .. vim.fn.fnameescape(parent2_file))

  vim.cmd('windo diffthis')

  if line_number ~= nil then
    vim.cmd('windo %foldopen!')
    vim.cmd('windo normal ' .. line_number .. 'G')
  end
end

-- Open a three way merge, using the file in clipboard as base file.
function M.three_way_diff_clipboard(parent1, parent2)
  local clipboard = vim.fn.getreg('+')
  if clipboard == '' then
    vim.notify('Clipboard is empty', vim.log.levels.WARN)
    return
  end
  M.three_way_diff(parent1, parent2, clipboard, nil)
end

-- Open a three way diff, using the current file + line-number.
function M.three_way_diff_current(parent1, parent2)
  local current_file = file_helpers.get_relative_filename()
  local current_line = file_helpers.get_current_line_number()
  M.three_way_diff(parent1, parent2, current_file, current_line)
end

return M
