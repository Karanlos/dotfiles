vim.pack.add({
    'https://github.com/nvim-lua/plenary.nvim',
    {
        src = 'https://github.com/vieitesss/miniharp.nvim',
        version = vim.version.range("v*"),
    }
-- 	{
--         src = 'https://github.com/theprimeagen/harpoon',
-- 	    version = 'harpoon2',
-- 	},
})

local miniharp = require('miniharp')

miniharp.setup({
  autoload = true, -- load marks for this cwd on startup (default: true)
  autosave = true, -- save marks for this cwd on exit (default: true)
  show_on_autoload = false, -- show popup list after a successful autoload (default: false)
  notifications = true, -- enable notification and status messages (default: true)
  ui = {
    position = 'center', -- 'center' | 'top-left' | 'top-right' | 'bottom-left' | 'bottom-right'
    show_hints = true, -- show close hints in the floating list (default: true)
    enter = true, -- enter the floating window when it opens (default: true)
  },
})

vim.keymap.set('n', '<leader>ha', miniharp.add_file)
vim.keymap.set('n', '<leader>hm', miniharp.show_list)
vim.keymap.set('n', '<leader>h1', function() miniharp.go_to(1) end, { desc = 'miniharp: go to mark 1' })
vim.keymap.set('n', '<leader>h2', function() miniharp.go_to(2) end, { desc = 'miniharp: go to mark 2' })
vim.keymap.set('n', '<leader>h3', function() miniharp.go_to(3) end, { desc = 'miniharp: go to mark 3' })
vim.keymap.set('n', '<leader>h4', function() miniharp.go_to(4) end, { desc = 'miniharp: go to mark 4' })
vim.keymap.set('n', '<leader>h5', function() miniharp.go_to(5) end, { desc = 'miniharp: go to mark 5' })


-- vim.pack.add({
--     {
--         src = 'https://github.com/leath-dub/snipe.nvim',
--     }
-- })
--
-- local snipe = require('snipe')
--
-- snipe.setup()
--
--
-- vim.keymap.set('n', '<leader>hm', snipe.open_buffer_menu)


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

