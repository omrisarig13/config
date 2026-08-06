local M = {}

function M.close_tabs_to_right()
  local current_tab_page = vim.fn.tabpagenr()
  local total_tabs = vim.fn.tabpagenr '$'
  for tabnr = total_tabs, current_tab_page + 1, -1 do
    vim.cmd('tabclose ' .. tabnr)
  end
end

function M.close_tabs_to_left()
  local current_tab_page = vim.fn.tabpagenr()
  for tabnr = current_tab_page - 1, 1, -1 do
    vim.cmd('tabclose ' .. tabnr)
  end
end

return M
