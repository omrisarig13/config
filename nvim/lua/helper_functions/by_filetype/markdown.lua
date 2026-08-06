local M = {}

function M.toggle_markdown_checkbox()
  local current_line = vim.api.nvim_get_current_line()
  local new_line

  if current_line:match('%- %[ %]') then
    -- Change unchecked to checked
    new_line = current_line:gsub('%- %[ %]', '- [x]')
  elseif current_line:match('%- %[x%]') then
    -- Change checked to unchecked
    new_line = current_line:gsub('%- %[x%]', '- [ ]')
  else
    -- No checkbox found, don't change anything
    return
  end

  -- Replace the current line
  local line_num = vim.api.nvim_win_get_cursor(0)[1]
  vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, false, { new_line })
end

return M
