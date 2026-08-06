-- vim.schedule(function()
  -- Pre-requisites:
  -- - rcarriga/nvim-notify is available
  -- - tpope/vim-fugitive is available
  vim.pack.add({
    { -- Required for telescope
      src = 'gh:nvim-telescope/telescope-ui-select.nvim',
      version = 'master',
    },
    { -- Required for telescope
      src = 'gh:nvim-lua/plenary.nvim',
      version = 'master',
    },
    {
      src = 'gh:debugloop/telescope-undo.nvim',
      version = 'main',
    },
    {
      src = 'gh:aaronhallaert/advanced-git-search.nvim',
      version = 'main'
    },
    {
      src = 'gh:nvim-telescope/telescope.nvim',
      version = 'master',
    },
  })

  -- This lets us move to the preview window, and do any vim-operations
  -- there.
  local focus_preview = function(prompt_bufnr)
    local action_state = require 'telescope.actions.state'
    local picker = action_state.get_current_picker(prompt_bufnr)
    local prompt_win = picker.prompt_win
    local previewer = picker.previewer
    local bufnr = previewer.state.bufnr or previewer.state.termopen_bufnr
    local winid = previewer.state.winid or vim.fn.win_findbuf(bufnr)[1]
    vim.keymap.set('n', '<Tab>', function()
      vim.cmd 'setlocal nonumber norelativenumber'
      vim.cmd(string.format('noautocmd lua vim.api.nvim_set_current_win(%s)', prompt_win))
    end, { buffer = bufnr })
    vim.keymap.set('n', '<c-h>', function()
      vim.cmd 'setlocal nonumber norelativenumber'
      vim.cmd(string.format('noautocmd lua vim.api.nvim_set_current_win(%s)', prompt_win))
    end, { buffer = bufnr })
    vim.keymap.set('n', 'q', function()
      require('telescope.actions').close(prompt_bufnr)
    end, { buffer = bufnr })
    vim.cmd(string.format('noautocmd lua vim.api.nvim_set_current_win(%s)', winid))
    vim.cmd 'setlocal nomodifiable number relativenumber'
  end

  local telescope = require('telescope')
  local telescope_builtin = require('telescope.builtin')
  telescope.setup({
    extensions = {
      ['ui-select'] = {
        require('telescope.themes').get_dropdown(),
      },
    },
    defaults = {
      sorting_strategy = 'ascending',
      layout_config = {
        horizontal = {
          prompt_position = 'top',
          preview_width = 0.65,
        },
        width = 0.99,
        height = 0.99,
      },
      mappings = {
        i = {
          ['<c-l>'] = focus_preview,
          ['<left>'] = require('telescope.actions').results_scrolling_left,
          ['<right>'] = require('telescope.actions').results_scrolling_right,
        },
        n = {
          ['q'] = require('telescope.actions').close,
          ['<left>'] = require('telescope.actions').results_scrolling_left,
          ['<right>'] = require('telescope.actions').results_scrolling_right,
          ['<c-l>'] = focus_preview,
          ['<c-q>'] = require('telescope.actions').smart_send_to_qflist + require('telescope.actions').open_qflist,
        },
      },
    },
    pickers = {
      buffers = {
        mappings = {
          i = {
            ['<CR>'] = require('telescope.actions').select_tab_drop,
            ['<tab>'] = require('telescope.actions').select_default,
          },
        },
      },
    },
  })

  telescope.load_extension('ui-select')
  telescope.load_extension('notify')
  telescope.load_extension('undo')
  telescope.load_extension('advanced_git_search')
  telescope.load_extension("neoclip")

  local search_in_files_from_given_type = function(file_type)
    telescope_builtin.live_grep {
      type_filter = file_type,
      glob_pattern = "!rf_mcu/**",
    }
  end

  local search_in_bash_files = function()
    search_in_files_from_given_type('sh')
  end

  local search_in_c_files = function()
    search_in_files_from_given_type('c')
  end

  local search_in_rst_files = function()
    search_in_files_from_given_type('rst')
  end

  local search_in_java_files = function()
    search_in_files_from_given_type('java')
  end

  local search_in_kotlin_files = function()
    search_in_files_from_given_type('kotlin')
  end

  local search_nvim_config_files = function()
    telescope_builtin.find_files { cwd = vim.fn.stdpath 'config' }
  end

  vim.keymap.set('n', '<leader>/', telescope_builtin.current_buffer_fuzzy_find,
    { desc = '[/] Fuzzily search in current buffer' })
  vim.keymap.set('n', '<leader>s.', telescope_builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
  vim.keymap.set('n', '<leader>sb', telescope_builtin.buffers, { desc = '[S]earch opened [B]uffers' })
  vim.keymap.set('n', '<leader>sc', ":Telescope neoclip<CR>", { desc = '[S]earch [C]lipboard' })
  vim.keymap.set('n', '<leader>se', telescope_builtin.live_grep, { desc = '[S]earch by gr[E]p' })
  vim.keymap.set('n', '<leader>sf', telescope_builtin.find_files, { desc = '[S]earch [F]iles' })
  vim.keymap.set('n', '<leader>sh', telescope_builtin.help_tags, { desc = '[S]earch [H]elp' })
  vim.keymap.set('n', '<leader>sn', search_nvim_config_files, { desc = '[S]earch [N]eovim files' })
  vim.keymap.set('n', '<leader>so', telescope.extensions.notify.notify, { desc = '[S]earch n[O]tifications' })
  vim.keymap.set('n', '<leader>stb', search_in_bash_files, { desc = '[S]earch text in [T]ype [B]ash' })
  vim.keymap.set('n', '<leader>stc', search_in_c_files, { desc = '[S]earch text in [T]ype [C]' })
  vim.keymap.set('n', '<leader>stj', search_in_java_files, { desc = '[S]earch text in [T]ype [J]ava' })
  vim.keymap.set('n', '<leader>stk', search_in_kotlin_files, { desc = '[S]earch text in [T]ype [K]otlin' })
  vim.keymap.set('n', '<leader>str', search_in_rst_files, { desc = '[S]earch text in [T]ype [R]ST' })
  vim.keymap.set('n', '<leader>su', telescope.extensions.undo.undo, { desc = '[S]earch [U]ndo tree' })
  vim.keymap.set('n', '<leader>sa', telescope_builtin.search_history, { desc = '[S]earch se[A]rch history' })
  vim.keymap.set('n', '<leader>sw', telescope_builtin.grep_string, { desc = '[S]earch current [W]ord' })
  vim.keymap.set('n', '<leader>sr', telescope_builtin.resume, { desc = '[S]earch [R]esume' })
  vim.keymap.set('n', '<leader>sk', telescope_builtin.keymaps, { desc = '[S]earch [K]eymaps' })

  -- Not the nicest to have a global function described here, but I could
  -- not find a better way to invoke a command that is able to use the
  -- ranged mark, as we must <esc> before invoking the function, which is
  -- not trivial apparently.
  function TelescopeRangedBcommit()
    telescope_builtin.git_bcommits_range {
      from = vim.api.nvim_buf_get_mark(0, '<')[1],
      to = vim.api.nvim_buf_get_mark(0, '>')[1],
    }
  end

  -- TODO: Keymaps are not working, which causes the plugin to do much less
  -- than it could. Investigate later.
  local advanced_git_search = require('telescope').extensions.advanced_git_search

  vim.keymap.set('n', '<leader>sgb', telescope_builtin.git_branches, { desc = '[S]earch [G]it [B]ranches' })
  vim.keymap.set('n', '<leader>sgc', advanced_git_search.search_log_content,
    { desc = '[S]earch [G]it log [C]ontent' })
  vim.keymap.set('n', '<leader>sgd', advanced_git_search.diff_branch_file,
    { desc = '[S]earch [G]it [D]iff for file' })
  vim.keymap.set('n', '<leader>sgh', advanced_git_search.changed_on_branch,
    { desc = '[S]earch [G]it files c[h]anged in current branch' })
  vim.keymap.set('n', '<leader>sgl', telescope_builtin.git_commits, { desc = '[S]earch [G]it [L]og (commits)' })
  vim.keymap.set('n', '<leader>sgu', telescope_builtin.git_bcommits, { desc = '[S]earch [G]it b[U]ffer commits' })
  vim.keymap.set('v', '<leader>sgu', '<esc><cmd>lua TelescopeRangedBcommit()<cr>',
    { desc = '[S]earch [G]it b[U]ffer commits' })
  -- To decide
  vim.keymap.set('n', '<leader>sgf', telescope_builtin.git_files, { desc = '[S]earch [G]it [F]iles' })
  vim.keymap.set('n', '<leader>sgs', telescope_builtin.git_status, { desc = '[S]earch [G]it [S]tatus' })

  --[[ To consider adding:

  local search_files_in_buffer_dir = function()
    builtin.find_files { cwd = utils.buffer_dir() }
  end
  vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
  vim.keymap.set('n', '<leader>sl', builtin.lsp_workspace_symbols, { desc = '[S]earch [L]sp workspace symbols' })
  vim.keymap.set('n', '<leader>sm', builtin.command_history, { desc = '[S]earch co[M]mand history' })
  vim.keymap.set('n', '<leader>s/', search_grep_local_files, { desc = '[S]earch [/] in Open Files' })
  vim.keymap.set('n', '<leader>si', builtin.registers, { desc = '[S]earch reg[I]sters' })
  vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
  -- vim.keymap.set('n', '<leader>stg', require('git_grep').live_grep, { desc = '[S]earch by gi[T] grep' })
  vim.keymap.set('n', '<leader>sv', builtin.vim_options, { desc = '[S]earch [V]im options' })
  --]]
-- end)
