local ctrl = 'C'

local ls = require('luasnip')
vim.keymap.set('i', '<C-y>', '<Esc>')

vim.keymap.set('x', '<leader>P', '"_dP')
vim.keymap.set('x', '<leader>p', '"_dp')

vim.keymap.set('n', '<leader><leader>s', '<cmd>source ~/AppData/Local/nvim/after/plugin/luasnip.lua')
