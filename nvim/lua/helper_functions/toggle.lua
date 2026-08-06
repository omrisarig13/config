local M = {}

function M.toggle_mouse()
  if vim.o.mouse == 'a' then
    vim.o.mouse = ''
    print('Mouse disabled')
  else
    vim.o.mouse = 'a'
    print('Mouse enabled')
  end
end

-- Toggle tab-width between 2 and 4 spaces.
function M.toggle_tab_width()
  local current_tabstop = vim.bo.tabstop
  local new_tabstop = current_tabstop == 2 and 4 or 2
  vim.bo.tabstop = new_tabstop
  vim.bo.shiftwidth = new_tabstop
  vim.bo.softtabstop = new_tabstop
end

function M.toggle_fold_method()
  if vim.g.current_foldmethod == 'manual' then
    vim.o.foldmethod = 'expr'
    vim.g.current_foldmethod = 'expr'
    print('Expression folding')
  elseif vim.g.current_foldmethod == 'expr' then
    vim.o.foldmethod = 'syntax'
    vim.g.current_foldmethod = 'syntax'
    print('Syntax folding')
  elseif vim.g.current_foldmethod == 'syntax' then
    vim.o.foldmethod = 'indent'
    vim.g.current_foldmethod = 'indent'
    print('Indent folding')
  elseif vim.g.current_foldmethod == 'indent' then
    vim.o.foldmethod = 'manual'
    vim.g.current_foldmethod = 'manual'
    print('Manual folding')
  else
    vim.o.foldmethod = 'expr'
    vim.g.current_foldmethod = 'expr'
    print('Expression folding')
  end
end

function M.toggle_diff()
  -- Check if nvim is in diff mode - if not, start a diff of all the files in
  -- the tab, otherwise turn off diff mode.
  if not vim.o.diff then
    vim.cmd('windo diffthis')
  else
    vim.cmd('windo diffoff')
  end
end

return M
