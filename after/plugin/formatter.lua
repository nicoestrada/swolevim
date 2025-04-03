require("formatter").setup {
    logging = true,
    log_level = vim.log.levels.WARN,
    
    filetype = {
        rust = {
            function()
                return {
                    exe = "rustfmt",          -- The command to run
                    args = { "--emit", "stdout" }, -- Output to stdout
                    stdin = true,             -- Pass buffer content via stdin
                }
            end,
        },
    },
}

-- Format Rust files automatically on save
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.rs",
    callback = function()
        vim.cmd("FormatWrite")
    end,
})
