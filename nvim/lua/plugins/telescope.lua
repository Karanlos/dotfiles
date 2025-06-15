return {
    'nvim-telescope/telescope.nvim',

    tag = '0.1.5',

    dependencies = {
        'nvim-lua/plenary.nvim',
    },

    config = function()
	    require('telescope').setup({
		    file_ignore_patterns = { 'node_modules', '.git' },
	    })
	    local builtin = require('telescope.builtin')
	    vim.keymap.set('n', '<leader>ff', function() builtin.find_files({hidden=true}) end, {})
	    vim.keymap.set('n', '<leader>fg', function() builtin.live_grep({ additional_args = function(_) return { "--hidden" } end }) end, {})
	    vim.keymap.set('n', '<leader>fp', builtin.git_files, {})
	    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
	    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    end

}
