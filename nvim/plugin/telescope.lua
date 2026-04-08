vim.pack.add({

    {
        src = 'https://github.com/nvim-telescope/telescope.nvim',
        version = '0.1.5',
    },
}, { load = true })

require('telescope').setup({
    file_ignore_patterns = { 'node_modules', '.git' },
})
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', function() builtin.find_files({hidden=true}) end, {})
vim.keymap.set('n', '<leader>fg', function() builtin.live_grep({ additional_args = function(_) return { "--hidden" } end }) end, {})
vim.keymap.set('n', '<leader>fp', builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
