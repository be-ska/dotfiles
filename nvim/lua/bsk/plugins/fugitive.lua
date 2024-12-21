-- Thanks bastard for git
return {
    "tpope/vim-fugitive",
    dependencies = {
        -- use GBrowse to open GitHub repo
        'tpope/vim-rhubarb'
    },
    config = function()

        -- Open Git status
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })

        -- Git diff split
        vim.keymap.set("n", "<leader>gd", vim.cmd.Gdiffsplit, { desc = "Git diff split" })

        -- Browse repo in github
        vim.keymap.set("n", "<leader>gB", vim.cmd.GBrowse, { desc = "Browse repository" })
    end
}
