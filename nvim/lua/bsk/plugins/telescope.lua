
return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        "nvim-lua/plenary.nvim",
        "BurntSushi/ripgrep"
    },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>tf', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>tt', builtin.git_files, { desc = 'Telescope find files only in repo' })
        -- ripgrep is needed!
        vim.keymap.set('n', '<leader>ts', builtin.live_grep, { desc = 'Telescope search text in files' })

        require('telescope').setup({
            pickers = {
                -- Customize `find_files`
                find_files = {
                    find_command = { 'rg', '--files', '--hidden', '--no-ignore' }, -- Include ignored files
                },
            },
        })
    end
}
