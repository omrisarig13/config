--[[

- [ ] Settings:
  - [x] Clipboard by default
  - [x] Move between windows with `<c-hjkl>` by default
  - [x] Set foldmethod
- [x] Learn about the new package manager - vim.pack
- [ ] Learn about LSP better, can it be used without any plugin?
- [ ] Compile a list of necessary plugins:
  - [x] Telescope
  - [ ] BLink
  - [x] DiffView - does it causes performance issues?
  - [x] which key
  - [ ] flush
- [ ] Built-in plugins
  - [ ] DiffTool
    - seems cool, not necessarily as good as DiffView, but a nice built-in option.
    - When running with git, use `git difftool -d` to open all the files at once.
  - [ ] Undotree
  - [ ] ui2
- [ ] To Debug
  - [ ] Spellchecking

- [ ] To do:
  - [ ] Move functionality from configuration to tab plugin (vim-tab-movements)
  - [ ] When adding trouble - add to lualine
  - [ ] When adding noice - add to lualine
  - [ ] Learn more about flush

- [ ] To evaluate:
  - [ ] Is notify necessary?
  - [ ] Telescope
    - [ ] Should more keymaps be added?
    - [x] nvim-tree/nvim-web-devicons
    - [ ] folke/trouble.nvim
  - [ ] Is debugger necessary?
  - [ ] Marks: chentoast/marks.nvim
  - [ ] Mistake: omrisarig13/mistake.nvim
  - [ ] trouble
  - [ ] noice
  - [ ] oil.nvim
  - [ ] snacks - go through the different plugins
  - [ ] nvim-treesitter

- [ ] To add:
  - [ ] LSP
  - [ ] Blink - to go over configuration and fix any issues.
  - [ ] lint (nvim-lint)
  - [ ] Copilot
  - [ ] format (stevearc/conform.nvim)
  - [ ] Neogit

--]]

require('vanilla.plugins')
require('vanilla.settings.global')
require('vanilla.settings.textwidth')
require('vanilla.settings.tabs')
require('vanilla.mappings.windows')
require('vanilla.mappings.editor')
require('vanilla.mappings.terminal')
require('vanilla.mappings.personal')
require('vanilla.commands.window')
require('vanilla.autocommands.basic')
