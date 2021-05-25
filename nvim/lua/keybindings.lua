local utils = require('utils')
local opts = {noremap=true, silent=true}
local nvim_cmd = vim.api.nvim_command
utils.map('n', '<leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>')
utils.map('n', '<leader>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>')
utils.map('n', '<leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>')
utils.map('n', '<leader>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>')
utils.map('n', '<leader>gg', '<cmd>Git<cr>')
utils.map('n', '<leader>gd', '<cmd>Gdiff<cr>')
utils.map('n', '<leader>gc', '<cmd>Git commit<cr>')

utils.map('i', '<C-y>', '<Esc>')

nvim_cmd 'autocmd FileType rust nnoremap <leader>b <cmd>!cargo build<CR>'
nvim_cmd 'autocmd FileType rust nnoremap <leader>r <cmd>!cargo run<CR>'
