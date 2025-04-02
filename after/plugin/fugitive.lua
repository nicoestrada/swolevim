vim.keymap.set("n", "<leader>gs", vim.cmd.Git);

vim.keymap.set("n", "<leader>ga", function()
    vim.cmd("Git add .")
end,
{
    noremap = true,
});


vim.keymap.set("n", "<leader>gc", function()
    local message = vim.fn.input("Commit message: ")
    if message ~= "" then
        vim.cmd('Git commit -m "' .. message .. '"')
    end
end,
{
    noremap = true,
});

vim.keymap.set("n", "<leader>gp", function()
    vim.cmd("Git push origin master")
end,
{
    noremap = true,
});
