vim.g.mapleader = " "
vim.keymap.set("n", "<leader>n", vim.cmd.Ex)

vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, { desc = 'Show hover documentation' })
