-- Set <space> as the leader key
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = '-'

-- Enable nerd-font, as it is used.
vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true

-- Disable mause, just annoying.
vim.o.mouse = ''

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = false

-- Sets how neovim will display certain whitespace characters in the editor.
vim.o.list = true
-- Show tabs, trailing spaces and multiple-spaces as characters, to be able to
-- quickly distinguish them. The laeding spaces are converted to regular spaces,
-- as they should not be shown differently (0x20 = space, as space cannot be set
-- directly there).
vim.opt.listchars = {
  tab = '<->',
  trail = '-',
  multispace = '.',
  lead = '\\x20',
}

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
vim.o.confirm = true

-- Don't break lines by default, but when set, do not spliting words.
vim.o.wrap = false
vim.o.linebreak = true

-- Spell checking
vim.o.spell = true
vim.o.spelllang = 'en_us'

-- Set foldmethod to syntax, letting tree-sitter do it's magic.
vim.o.foldmethod = 'syntax'
vim.opt.foldenable = false
