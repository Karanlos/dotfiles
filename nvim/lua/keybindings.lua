local utils = require('utils')
local opts = {noremap=true, silent=true}
local nvim_cmd = vim.api.nvim_command
local ctrl = 'C'

utils.map('n', '<leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files({hidden=true})<cr>')
utils.map('n', '<leader>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>')
utils.map('n', '<leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>')
utils.map('n', '<leader>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>')
utils.map('n', '<leader>gg', '<cmd>Git<cr>')
utils.map('n', '<leader>gd', '<cmd>Gdiff<cr>')
utils.map('n', '<leader>gc', '<cmd>Git commit<cr>')
utils.map('n', '<leader>oa', '<cmd>lua require\'lspconfig\'["omnisharp"].manager.try_add_wrapper()<cr>')
utils.map('n', '<leader>dd', '"_dd')

utils.map('n', '<leader>ha', '<cmd>lua require \'harpoon.mark\'.add_file()<cr>')
utils.map('n', '<leader>hm', '<cmd>lua require \'harpoon.ui\'.toggle_quick_menu()<cr>')
utils.map('n', '<leader>h1', '<cmd>lua require \'harpoon.ui\'.nav_file(1)<cr>')
utils.map('n', '<leader>h2', '<cmd>lua require \'harpoon.ui\'.nav_file(2)<cr>')
utils.map('n', '<leader>h3', '<cmd>lua require \'harpoon.ui\'.nav_file(3)<cr>')
utils.map('n', '<leader>h4', '<cmd>lua require \'harpoon.ui\'.nav_file(4)<cr>')
utils.map('n', '<leader>h5', '<cmd>lua require \'harpoon.ui\'.nav_file(5)<cr>')
utils.map('n', '<leader>hb', '<cmd>lua require \'harpoon.term\'.sendCommand(1,1); require \'harpoon.term\'.gotoTerminal(1)<cr>')

utils.map('i', '<' .. ctrl .. '-y>', '<Esc>')
utils.map('i', '<' .. ctrl .. '-p>', '<cmd>lua require\'completion\'.triggerCompletion()<cr>')

utils.map('x', '<leader>P', '"_dP')
utils.map('x', '<leader>p', '"_dp')

nvim_cmd 'autocmd FileType rust nnoremap <leader>b <cmd>!cargo build<CR>'
nvim_cmd 'autocmd FileType rust nnoremap <leader>r <cmd>!cargo run<CR>'
nvim_cmd 'autocmd FileType zig nnoremap <leader>b <cmd>!zig build<CR>'
nvim_cmd 'autocmd FileType zig nnoremap <leader>r <cmd>!zig build run<CR>'
