vim.pack.add({
    'https://github.com/folke/sidekick.nvim',
})

local sidekick = require('sidekick')
local sidekick_cli = require('sidekick.cli')

sidekick.setup()

vim.keymap.set('n', '<leader>ac', function() sidekick_cli.toggle({ name = 'opencode', focus = true }) end)
vim.keymap.set('n', '<leader>ab', function() sidekick_cli.send({ msg = '{file}' }) end)
vim.keymap.set({ 'n', 'x' }, '<leader>at', function() sidekick_cli.send({ msg = '{this}' }) end)
vim.keymap.set('x', '<leader>av', function() sidekick_cli.send({ msg = '{selection}' }) end)
vim.keymap.set('n', '<leader>af', function() sidekick_cli.toggle() end)
vim.keymap.set({ 'n', 'x' }, '<leader>ap', function() sidekick_cli.prompt() end)
