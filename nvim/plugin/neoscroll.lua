vim.pack.add({
    'https://github.com/karb94/neoscroll.nvim',
})

local neoscroll = require('neoscroll')
neoscroll.setup({
    mappings = {
        "<C-u>", "<C-d>", "<C-b>", "<C-f>",
        "<C-y>", "<C-e>", "zt", "zz", "zb",
    },
    duration_multiplier = 0.5,
    performance_mode = true,
    easing = 'linear',
})
