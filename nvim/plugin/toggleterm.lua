return {
    "akinsho/toggleterm.nvim",
    version = '*',
    config = function()
        require('toggleterm').setup({
            direction = 'tab',
        })

        vim.keymap.set('t', '<C-y>', '<C-\\><C-n>', { desc = 'Exit Terminal' })
        vim.keymap.set('n', '<leader>tt', function()
            require('toggleterm').toggle()
        end, { desc = 'Toggle Terminal' })
    end,
}
