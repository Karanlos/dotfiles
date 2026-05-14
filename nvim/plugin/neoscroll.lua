vim.pack.add({
    'https://github.com/karb94/neoscroll.nvim',
})

local neoscroll = require('neoscroll')

if not vim.g.neovide then
    local keymap = {
        ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 10 }) end,
        ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 10 }) end,
        ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 10 }) end,
        ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 10 }) end,
    }

    local modes = { 'n', 'v', 'x' }

    for key, func in pairs(keymap) do
        vim.keymap.set(modes, key, func)
    end

    neoscroll.setup({
        mappings = {
            "<C-u>", "<C-d>", "<C-b>", "<C-f>",
            "<C-y>", "<C-e>", "zt", "zz", "zb",
        },
        duration_multiplier = 0.001,
        performance_mode = false,
    })
end
