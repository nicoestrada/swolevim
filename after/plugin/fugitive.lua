vim.keymap.set("n", "<leader>gs", vim.cmd.Git);

vim.keymap.set("n", "<leader>ga", function()
    vim.cmd("Git add .")
end,
{
    noremap = true,
});


