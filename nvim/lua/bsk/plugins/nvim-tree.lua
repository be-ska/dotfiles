return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function ()
        local nvimtree = require("nvim-tree")
        local api = require("nvim-tree.api")

        -- disable netrw at the very start of your init.lua
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- optionally enable 24-bit colour
        vim.opt.termguicolors = true

        -- empty setup using defaults
        nvimtree.setup()

        -- OR setup with some options
        nvimtree.setup({
            git = {
                enable = true,
                timeout = 5000, -- Increase timeout to 5000ms (5 seconds)
            },
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = 30,
                relativenumber = true, -- Enable relative line numbers
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true,
            },
            update_focused_file = {
                enable = true,         -- Disable automatic focusing
                update_root = false,    -- Disable auto-root update
            },
            sync_root_with_cwd = true,
            respect_buf_cwd = true,
        })

        -- remap
        vim.keymap.set('n', '<leader>e', function() api.tree.toggle() end)
        vim.keymap.set('n', '<leader>r', function() api.tree.change_root_to_node() end)
    end
}
