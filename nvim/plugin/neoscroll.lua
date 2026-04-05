vim.pack.add({
    'https://github.com/karb94/neoscroll.nvim',
})

local neoscroll = require('neoscroll')
neoscroll.setup({
    mappings = {                 -- Keys to be mapped to their corresponding default scrolling animation
    },
    duration_multiplier = 0.001,
    performance_mode = true,
    easing = 'linear',
})
