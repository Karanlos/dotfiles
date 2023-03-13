require('mason').setup({
    providers = {
        "mason.providers.client",
        "mason.providers.registry-api"
    },
    log_level = vim.log.levels.DEBUG
})
