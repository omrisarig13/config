local file_helpers = require('helper_functions.file')

local M = {}

-- Copy <filename> to clipboard
function M.copy_filename()
  vim.fn.setreg('+', file_helpers.get_filename())
end

 -- Copy <filename:line_number> to clipboard
function M.copy_filename_line()
  vim.fn.setreg('+', file_helpers.get_filename() .. ':' .. file_helpers.get_current_line_number())
end

-- Copy <relative_path> to clipboard
function M.copy_relative_file()
  vim.fn.setreg('+', file_helpers.get_relative_filename())
end

-- Copy <relative_path:line_number> to clipboard
function M.copy_relative_file_line()
  vim.fn.setreg('+', file_helpers.get_relative_filename() .. ':' .. file_helpers.get_current_line_number())
end

-- Copy <full_file_path> to clipboard
function M.copy_full_file()
  vim.fn.setreg('+', file_helpers.get_full_filename())
end

-- Copy <full_file_path:line_number> to clipboard
function M.copy_full_file_line()
  vim.fn.setreg('+', file_helpers.get_full_filename() .. ':' .. file_helpers.get_current_line_number())
end

return M
