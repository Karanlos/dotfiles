local utils = require('utils')
local cmd = vim.api.nvim_command
local opts = {noremap=true, silent=true}
utils.map('n', '<leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>')
utils.map('n', '<leader>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>')
utils.map('n', '<leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>')
utils.map('n', '<leader>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>')
utils.map('n', '<leader>gg', '<cmd>Git<cr>')
utils.map('n', '<leader>gd', '<cmd>Gdiff<cr>')
utils.map('n', '<leader>gc', '<cmd>Git commit<cr>')
utils.map('', '<leader>dd', '"_dd')

utils.map('i', '<C-y>', '<Esc>', {noremap = true})
utils.map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {noremap=true, expr=true})

utils.map('i', '<c-p>', '<cmd>lua require\'completion\'.triggerCompletion()<cr>')

cmd 'autocmd FileType rs nmap <leader>b :!cargo build<CR>'
cmd 'autocmd FileType rs nmap <leader>r :!cargo run<CR>'
