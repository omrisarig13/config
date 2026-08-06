local M = {}

-- Get filename only
function M.get_filename()
  return vim.fn.expand('%:t')
end

-- Get the relative filename from the current folder
function M.get_relative_filename()
  return vim.fn.expand('%')
end

-- Get the full path of the current file
function M.get_full_filename()
  return vim.fn.expand('%:p')
end

function M.get_current_line_number()
  return vim.fn.line('.')
end

return M
