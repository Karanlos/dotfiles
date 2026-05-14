vim.pack.add({
    {
        src = 'https://github.com/nvim-lua/plenary.nvim'
    },
    {
        src = 'https://github.com/nvim-telescope/telescope.nvim',
        version = '0.1.5',
    },
}, { load = true })

require('telescope').setup({
    file_ignore_patterns = { 'node_modules', '.git' },
})
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', function() builtin.find_files({hidden=true}) end, {})
vim.keymap.set('n', '<leader>fg', function() builtin.live_grep({ additional_args = function(_) return { "--hidden" } end }) end, {})
vim.keymap.set('n', '<leader>fp', builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fj', function()
    local ext = vim.fn.expand('%:e')
    local cwd
    if ext == 'jai' then
        local jai_path = vim.fn.exepath('jai')
        cwd = vim.fn.fnamemodify(jai_path, ':h:h')
    elseif ext == 'zig' then
        local zig_path = vim.fn.exepath('zig')
        cwd = vim.fn.fnamemodify(zig_path, ':h')
    end
    if cwd and cwd ~= '' then
        builtin.find_files({ cwd = cwd, hidden = true })
    else
        vim.notify('No known language folder for filetype: ' .. ext, vim.log.levels.WARN)
    end
end, {})
vim.keymap.set('n', '<leader>fk', function()
    local ext = vim.fn.expand('%:e')
    local cwd
    if ext == 'jai' then
        local jai_path = vim.fn.exepath('jai')
        cwd = vim.fn.fnamemodify(jai_path, ':h:h')
    elseif ext == 'zig' then
        local zig_path = vim.fn.exepath('zig')
        cwd = vim.fn.fnamemodify(zig_path, ':h')
    end
    if cwd and cwd ~= '' then
        builtin.live_grep({ cwd = cwd, hidden = true })
    else
        vim.notify('No known language folder for filetype: ' .. ext, vim.log.levels.WARN)
    end
end, {})
