
vim.keymap.set('n', '<C-Right>', [[<cmd>vertical resize +5<cr>]])  -- make the window biger vertically
vim.keymap.set('n', '<C-Left>', [[<cmd>vertical resize -5<cr>]])   -- make the window smaller vertically
vim.keymap.set('n', '<C-Up>', [[<cmd>horizontal resize +2<cr>]])   -- make the window bigger horizontally by pressing shift and =
vim.keymap.set('n', '<C-Down>', [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
