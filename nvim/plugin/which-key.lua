-- vim.schedule(function()
vim.pack.add({
  {
    src = 'gh:folke/which-key.nvim',
    version = 'main',
  },
})

local which_key = require('which-key')
which_key.setup({
  -- delay between pressing a key and opening which-key (milliseconds)
  -- this setting is independent of vim.o.timeoutlen.
  -- Have a short delay to avoid the window opening when I know what I want
  -- to type.
  delay = 200,
  preset = 'modern',
  plugins = {
    spelling = {
      -- OMSA: This is not working properly, see: https://github.com/folke/which-key.nvim/issues/971
      enabled = false,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
    },
  },
  icons = {
    -- set icon mappings to true if you have a Nerd Font
    mappings = true,
    -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
    -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
    keys = {}
  },
  spec = {

    -- { '<leader>a',   group = 'Dem[A]nt' },
    -- { '<leader>c',   group = '[C]opilot' },
    { '<leader>d',   group = 't[D]o' },
    { '<leader>g',   group = '[G]it commands' },
    { '<leader>G',   group = '[G]errit' },
    { '<leader>h',   group = 'Git [H]unk',                      mode = { 'n', 'v' } },
    { '<leader>hd',  group = 'Git [H]unk [D]if' },
    -- { '<leader>i',   group = 'M[I]ni' },
    -- { '<leader>if',  group = 'M[I]ni [F]ile explorer' },
    -- { '<leader>is',  group = 'M[I]ni [S]ession' },
    { '<leader>n',   group = '[N]otifications' },
    -- { '<leader>m',   group = '[M]istake' },
    -- { '<leader>n',   group = 'Flash' }, -- Not a group, but saved to keep track.
    -- { '<leader>o',   group = 'Snacks' },
    { '<leader>p',   group = '[P]ersonal' },
    { '<leader>po',  group = '[P]ersonal c[O]nfiguration files' },
    { '<leader>py',  group = '[P]ersonal [Y]ank' },
    { '<leader>pyn', group = '[P]ersonal [Y]ank [N]umbered' },
    -- { '<leader>r',   group = 'T[R]ee Sitter' },
    { '<leader>s',   group = '[S]earch (telescope)' },
    { '<leader>sg',  group = '[S]earch [G]it' },
    { '<leader>st',  group = '[S]earch by file[T]ype' },
    { '<leader>t',   group = '[T]oggle/[T]ab' },
    -- { '<leader>u',   group = 'Stat[U]s' },
    -- { '<leader>x',   group = 'Trouble' },

  },
})
-- end)
