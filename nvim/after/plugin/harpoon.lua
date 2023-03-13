local harpoon = require('harpoon')
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')
local term = require('harpoon.term')

vim.keymap.set('n', '<leader>ha', mark.add_file)
vim.keymap.set('n', '<leader>hm', ui.toggle_quick_menu)
vim.keymap.set('n', '<leader>h1', function() ui.nav_file(1) end)
vim.keymap.set('n', '<leader>h2', function() ui.nav_file(2) end)
vim.keymap.set('n', '<leader>h3', function() ui.nav_file(3) end)
vim.keymap.set('n', '<leader>h4', function() ui.nav_file(4) end)
vim.keymap.set('n', '<leader>h5', function() ui.nav_file(5) end)
vim.keymap.set('n', '<leader>hb', function() term.sendCommand(1, 1); term.gotoTerminal(1) end)

harpoon.setup({
  nav_first_in_list = true,
  projects = {
    ["D:\\dev\\src\\zig\\vulkan"] = {
      term = {
        cmds = {
          "zig build\r\n"
        }
      }
    }
  },
})
