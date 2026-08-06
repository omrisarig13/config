-- vim.schedule(function()
  vim.pack.add({
    {
      src = 'gh:folke/snacks.nvim',
      version = 'main',
    },
  })

  require('snacks').setup {
    bigfile = { enabled = false },
    dashboard = { enabled = false },
    explorer = { enabled = false },
    indent = { enabled = false },
    input = { enabled = false },
    picker = { enabled = false },
    notifier = { enabled = false },
    quickfile = { enabled = false },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
    styles = {
      terminal = {
        bo = {
          filetype = "snacks_terminal",
        },
        wo = {},
        stack = true,     -- when enabled, multiple split windows with the same position will be stacked together (useful for terminals)
        keys = {
          q = "hide",
          gf = function(self)
            local f = vim.fn.findfile(vim.fn.expand("<cfile>"), "**")
            if f == "" then
              Snacks.notify.warn("No file under cursor")
            else
              self:hide()
              vim.schedule(function()
                vim.cmd("e " .. f)
              end)
            end
          end,
          term_normal = {
            "<esc>",
            function(self)
              self.esc_timer = self.esc_timer or (vim.uv or vim.loop).new_timer()
              if self.esc_timer:is_active() then
                self.esc_timer:stop()
                vim.cmd("stopinsert")
              else
                self.esc_timer:start(200, 0, vim.schedule_wrap(function()
                  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "n", false)
                end))
              end
            end,
            mode = "t",
            expr = true,
            desc = "Double escape to normal mode",
          },
        },
      }
    }
  }

  vim.keymap.set('n', '<leader>or', require('snacks').rename.rename_file, { desc = 'Snacks [R]ename' })
-- end)
