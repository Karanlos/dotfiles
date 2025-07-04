local ctrl = 'C'

vim.keymap.set('i', '<C-y>', '<Esc>')

vim.keymap.set('x', '<leader>P', '"_dP')
vim.keymap.set('x', '<leader>p', '"_dp')

vim.keymap.set('i', '<C-H>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})

vim.keymap.set('n', '<leader><leader>h', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end)

-- local ls = require('luasnip')
-- if vim.fn.has('macunix') then
--     vim.keymap.set('n', '<leader><leader>s', '<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>')
-- else
--     vim.keymap.set('n', '<leader><leader>s', '<cmd>source ~\\AppData\\Local\\nvim\\after\\plugin\\luasnip.lua<CR>')
-- end
