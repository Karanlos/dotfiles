require('utils')
local opts = {noremap=true, silent=true}
Utils.map('n', '<leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>')
Utils.map('n', '<leader>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>')
Utils.map('n', '<leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>')
Utils.map('n', '<leader>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>')
Utils.map('n', '<leader>gg', '<cmd>Git<cr>')
Utils.map('n', '<leader>gd', '<cmd>Gdiff<cr>')
Utils.map('n', '<leader>gc', '<cmd>Git commit<cr>')


