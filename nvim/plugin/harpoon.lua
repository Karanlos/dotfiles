-- vim.pack.add({
--     'https://github.com/nvim-lua/plenary.nvim',
--     { src = 'https://github.com/vieitesss/miniharp.nvim' }
-- -- 	{
-- --         src = 'https://github.com/theprimeagen/harpoon',
-- -- 	    version = 'harpoon2',
-- -- 	},
-- })
--
-- local harp = require('miniharp')
--
-- harp.setup({
--     autoload = true,
--     autosave = true,
--     show_on_autoload = true,
-- })
--
-- vim.keymap.set('n', '<leader>ha', harp.add_file)
-- vim.keymap.set('n', '<leader>hm', harp.show_list)
-- vim.keymap.set('n', '<leader>h1', function() harp.show_list():select(1) end)


vim.pack.add({
    {
        src = 'https://github.com/leath-dub/snipe.nvim',
    }
})

local snipe = require('snipe')

snipe.setup()


vim.keymap.set('n', '<leader>hm', snipe.open_buffer_menu)


-- vim.keymap.set('n', '<leader>hm', function() harp.ui:toggle_quick_menu(harp:list()) end)
-- vim.keymap.set('n', '<leader>h1', function() harp:list():select(1) end)
-- vim.keymap.set('n', '<leader>h2', function() harp:list():select(2) end)
-- vim.keymap.set('n', '<leader>h3', function() harp:list():select(3) end)
-- vim.keymap.set('n', '<leader>h4', function() harp:list():select(4) end)
-- vim.keymap.set('n', '<leader>h5', function() harp:list():select(5) end)


-- local harpoon = require('harpoon')
-- harpoon:setup()
--
-- vim.keymap.set('n', '<leader>ha', function() harpoon:list():add() end)
-- vim.keymap.set('n', '<leader>hm', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
-- vim.keymap.set('n', '<leader>h1', function() harpoon:list():select(1) end)
-- vim.keymap.set('n', '<leader>h2', function() harpoon:list():select(2) end)
-- vim.keymap.set('n', '<leader>h3', function() harpoon:list():select(3) end)
-- vim.keymap.set('n', '<leader>h4', function() harpoon:list():select(4) end)
-- vim.keymap.set('n', '<leader>h5', function() harpoon:list():select(5) end)
-- -- vim.keymap.set('n', '<leader>hb', function() term.sendcommand(1, 1); term.gototerminal(1) end)

