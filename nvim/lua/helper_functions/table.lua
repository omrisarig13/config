local file_helpers = require('helper_functions.file')

local M = {}

-- Create a table out of the current list of lines. Uses some Unix commands to
-- understand the current separators, and repormat the tex as an ascii-art
-- table.
function M.format_table()
  -- Save current cursor position
  local original_pos = vim.api.nvim_win_get_cursor(0)

  -- Find table boundaries
  local current_line = file_helpers.get_current_line_number()
  local buffer_lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  -- Find start of table (first non-empty line going up)
  local table_start = current_line
  while table_start > 1 and buffer_lines[table_start - 1]:match('%S') do
    table_start = table_start - 1
  end

  -- Find end of table (last non-empty line going down)
  local table_end = current_line
  while table_end < #buffer_lines and buffer_lines[table_end]:match('%S') do
    table_end = table_end + 1
  end
  table_end = table_end - 1

  if table_start >= table_end then
    print("No table found or table is too small")
    return
  end

  -- Get table content and remove headers in one pass
  local table_lines = {}
  for i = table_start, table_end do
    local line = buffer_lines[i]
    -- Skip header separator lines (lines with only -, =, +, |, and spaces)
    if not line:match('^[%s|%-%=%+]*$') then
      -- Normalize spaces around pipes
      line = line:gsub('%s+|%s+', ' | '):gsub('%s+', ' ')
      table.insert(table_lines, line)
    end
  end

  if #table_lines == 0 then
    print("No table content found")
    return
  end

  -- Format table using column command
  local formatted_content = table.concat(table_lines, '\n')
  local handle = io.popen("echo '" .. formatted_content:gsub("'", "'\\''") .. "' | column -t -s '|' -o '|'")
  local formatted_result = handle:read('*a'):gsub('\n$', '') -- Remove trailing newline
  handle:close()

  -- Split result back into lines
  local formatted_lines = vim.split(formatted_result, '\n')

  -- Create separator line pattern based on first line structure
  local separator_line = ""
  if #formatted_lines > 0 then
    separator_line = formatted_lines[1]:gsub('[^|]', '-'):gsub('|', '+')
  end

  -- Build final table with separators
  local final_lines = {}

  -- Add top separator
  if separator_line ~= "" then
    table.insert(final_lines, separator_line)
  end

  for i, line in ipairs(formatted_lines) do
    table.insert(final_lines, line)

    -- Add header separator after first line (header)
    if i == 1 and separator_line ~= "" then
      local header_sep = separator_line:gsub('-', '=')
      table.insert(final_lines, header_sep)
      -- Add regular separator after each subsequent line (except the last)
    elseif i > 1 and i < #formatted_lines and separator_line ~= "" then
      table.insert(final_lines, separator_line)
    end
  end

  -- Add bottom separator
  if separator_line ~= "" then
    table.insert(final_lines, separator_line)
  end

  -- Replace original table content
  vim.api.nvim_buf_set_lines(0, table_start - 1, table_end, false, final_lines)

  -- Restore cursor position (adjust for potential line count changes)
  local line_diff = #final_lines - (table_end - table_start + 1)
  local new_row = math.min(original_pos[1] + line_diff, vim.api.nvim_buf_line_count(0))
  vim.api.nvim_win_set_cursor(0, { new_row, original_pos[2] })
end

return M
