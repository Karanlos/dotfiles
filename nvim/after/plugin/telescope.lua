local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', function() builtin.find_files({hidden=true}) end, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fp', builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

local autocmd = vim.api.nvim_create_autocmd
local Karanlos_FileFormat = vim.api.nvim_create_augroup("Karanlos_FileFormat", {})

autocmd("BufWinEnter", {
    pattern = "*.cs",
    command = "set fileformat=unix",
    group = Karanlos_FileFormat
})
