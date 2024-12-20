-- Thanks bastard for git
return {
    "tpope/vim-fugitive",
    config = function()

        -- Open Git status
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })

        -- Git diff split
        vim.keymap.set("n", "<leader>gd", vim.cmd.Gdiffsplit, { desc = "Git diff split" })
    end
}
