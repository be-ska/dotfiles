--visualizes the undo history and makes it easy to browse and switch between different undo branches
return {
    "mbbill/undotree",
    config = function()
        vim.keymap.set ("n", "<leader>u", vim.cmd.UndotreeToggle);
    end
}
