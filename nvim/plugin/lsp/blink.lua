-- vim.schedule(function()
vim.pack.add({
  -- {
  --   src = 'gh:fang2hou/blink-copilot',
  --   version = 'main',
  -- },
  {
    src = 'gh:L3MON4D3/LuaSnip',
    version = 'v2.5.0',
  },
  {
    src = 'gh:rafamadriz/friendly-snippets',
    version = 'main',
  },
  {
    src = 'gh:saghen/blink.cmp',
    version = 'v1.10.2',
  },
})

local luasnip = require "luasnip"
luasnip.setup({})

local blink = require "blink.cmp"
blink.setup({
  cmdline = { completion = { menu = { auto_show = true } } },

  keymap = {
    -- 'default' (recommended) for mappings similar to built-in completions
    --   <c-y> to accept ([y]es) the completion.
    --    This will auto-import if your LSP supports it.
    --    This will expand snippets if the LSP sent a snippet.
    -- 'super-tab' for tab to accept
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- For an understanding of why the 'default' preset is recommended,
    -- you will need to read `:help ins-completion`
    --
    -- No, but seriously. Please read `:help ins-completion`, it is really good!
    --
    -- All presets have the following mappings:
    -- <tab>/<s-tab>: move to right/left of your snippet expansion
    -- <c-space>: Open menu or open docs if already open
    -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
    -- <c-e>: Hide menu
    -- <c-k>: Toggle signature help
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    preset = 'default',
    ['<C-e>'] = { 'scroll_documentation_down', 'fallback' },
    ['<C-j>'] = { 'scroll_documentation_up', 'fallback' },
    -- TODO: Update
    -- ['<C-space>'] = { 'fallback' }, -- c-space is used for copilot completion.
    -- Print the value of b:copilot_enabled in vimscript

    -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
    --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
  },

  appearance = {
    -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- Adjusts spacing to ensure icons are aligned
    nerd_font_variant = 'mono',
  },

  completion = {
    -- By default, you may press `<c-space>` to show the documentation.
    -- Optionally, set `auto_show = true` to show the documentation after a delay.
    documentation = { auto_show = true, auto_show_delay_ms = 5 },
    menu = {
      draw = {
        columns = {
          { 'label',     'label_description', gap = 1 },
          { 'kind_icon', 'kind' },
        },
      },
    },
    -- Don't display a preview of the selected item on the current line
    ghost_text = { enabled = false },
  },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer', 'omni' },
    -- default = { 'copilot', 'lsp', 'path', 'snippets', 'buffer', 'omni' },
    -- default = { 'lsp', 'copilot', 'path', 'snippets', 'buffer', 'omni' },
    providers = {
      copilot = {
        name = "copilot",
        module = "blink-copilot",
        score_offset = 100,
        async = true,
      },
      cmdline = {
        -- ignores cmdline completions when executing shell commands
        enabled = function()
          return vim.fn.getcmdtype() ~= ':' or not vim.fn.getcmdline():match "^[%%0-9,'<>%-]*!"
        end,
      },
      lsp = {
        fallbacks = {},
      },
      -- Not sure if this is working or not, to test...
      buffer = {
        score_offset = -5,
        opts = {
          get_bufnrs = function()
            return vim.tbl_filter(function(bufnr)
              return vim.bo[bufnr].buftype == ''
            end, vim.api.nvim_list_bufs())
          end,
        },
      },
    },
  },

  snippets = { preset = 'luasnip' },

  -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
  -- which automatically downloads a prebuilt binary when enabled.
  --
  -- By default, we use the Lua implementation instead, but you may enable
  -- the rust implementation via `'prefer_rust_with_warning'`
  --
  -- See :h blink-cmp-config-fuzzy for more information
  -- fuzzy = { implementation = 'lua' },
  fuzzy = {
    implementation = 'prefer_rust_with_warning',
    sorts = {
      'exact',
      -- defaults
      'score',
      'sort_text',
    },
  },

  -- Shows a signature help window while you type arguments for a function
  signature = { enabled = true },

})
-- end)
