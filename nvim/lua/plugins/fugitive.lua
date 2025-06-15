
return {
    'tpope/vim-fugitive',
    config = function()
        vim.keymap.set('n', '<leader>gg', vim.cmd.Git)

        local autocmd = vim.api.nvim_create_autocmd
        local Karanlos_Fugitive = vim.api.nvim_create_augroup("Karanlos_Fugitive", {})

        autocmd("BufWinEnter", {
            group = Karanlos_Fugitive,
            pattern = "*",
            callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = { buffer = bufnr, remap = false }

                vim.keymap.set('n', '<leader>gd', vim.cmd.Gdiff, opts)
                vim.keymap.set('n', '<leader>gc', function() vim.cmd.Git('commit') end, opts)
                vim.keymap.set('n', '<leader>dd', '"_dd', opts)
            end,
        })

        vim.keymap.set('n', 'gu', '<cmd>diffget //2<CR>')
        vim.keymap.set('n', 'gh', '<cmd>diffget //3<CR>')
    end
}
