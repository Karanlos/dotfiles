function color_my_pencils(color)
    color = color or "catppuccin"
    vim.cmd.colorscheme(color)

--    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
--    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

end

require('catppuccin').setup({
    flavour = 'mocha',
    background = {
        light = 'latte',
        dark = 'mocha',
    },
    integrations = {
        cmp = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
    }
})

color_my_pencils()
