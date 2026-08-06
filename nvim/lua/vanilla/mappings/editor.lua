-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Remap <c-t> to tab, instead of moving the whole line (as tab is used by copilot)
vim.keymap.set('i', '<c-t>', '<Tab>')
