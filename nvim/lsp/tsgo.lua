return {
    filetypes = { 'typescript' },
    root_markers = { '.git' },
    cmd = { 'typescript-language-server', '--stdio' },
    settings = {
        implicitProjectConfiguration = {
            checkJs = true,
        }
    }
}
