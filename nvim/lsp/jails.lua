return {
    cmd = { 'jails' },
    filetypes = { 'jai' },
    root_dir = function(fname, cb)
        cb(vim.fn.getcwd())
    end,
}
