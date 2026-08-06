
-- Write and quit with capital letters. Work on window level.
vim.api.nvim_create_user_command('W', 'windo w', {})
vim.api.nvim_create_user_command('WQ', 'windo wq', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.api.nvim_create_user_command('Q', 'windo q', {})
