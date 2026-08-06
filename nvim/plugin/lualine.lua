-- vim.schedule(function()
  vim.pack.add({
    {
      src = 'gh:nvim-lualine/lualine.nvim',
      version = 'master',
    },
  })

  local path_from_root = {
    function()
      local Path = require 'plenary.path'
      local git_root = Path:new(vim.fn.expand '%:p'):find_upwards '.git'
      if git_root then
        local root = git_root:parent():absolute()
        local file = vim.fn.expand '%:p'
        local path = Path:new(file):parent():make_relative(root)
        if path == '.' then
          return ''
        else
          return path
        end
      else
        return ''
      end
    end,
    icon = '',
    shorting_target = 40,
  }
  local cwd_from_repo_root = {
    function()
      local Path = require 'plenary.path'
      local cwd = vim.loop.cwd()
      local git_root = Path:new(cwd):find_upwards '.git'
      if git_root then
        local root = git_root:parent():absolute()
        local path = Path:new(cwd):make_relative(root)
        if path == '.' then
          return ''
        else
          return path
        end
      else
        return ''
      end
    end,
    icon = '',
    shorting_target = 40,
  }
  require('lualine').setup {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      always_show_tabline = true,
      globalstatus = false,
      refresh = {
        statusline = 100,
        tabline = 100,
        winbar = 100,
      },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = { path_from_root, { 'filename', icon = '' }, cwd_from_repo_root, },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { },
      lualine_z = { 'location' },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = { 'branch' },
      lualine_c = { path_from_root, 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  }
-- end)
