return {
    'theprimeagen/harpoon',
    branch = 'harpoon2',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
        local harpoon = require('harpoon')

        harpoon:setup()

        vim.keymap.set('n', '<leader>ha', function() harpoon:list():add() end)
        vim.keymap.set('n', '<leader>hm', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        vim.keymap.set('n', '<leader>h1', function() harpoon:list():select(1) end)
        vim.keymap.set('n', '<leader>h2', function() harpoon:list():select(2) end)
        vim.keymap.set('n', '<leader>h3', function() harpoon:list():select(3) end)
        vim.keymap.set('n', '<leader>h4', function() harpoon:list():select(4) end)
        vim.keymap.set('n', '<leader>h5', function() harpoon:list():select(5) end)
        -- vim.keymap.set('n', '<leader>hb', function() term.sendcommand(1, 1); term.gototerminal(1) end)
    end
}

