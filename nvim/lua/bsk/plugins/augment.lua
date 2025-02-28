-- augment AI autocomplete
return {
    'augmentcode/augment.vim',
    config = function()
        local aug = require('augment')
        
        -- fetch current folder and add to workspace
        vim.g.augment_workspace_folders = { vim.fn.getcwd() }
        -- vim.g.augment_workspace_folders = {'~/code/dotfiles'}

        -- Use shift Tab to accept
        vim.g.augment_disable_tab_mapping = true
        vim.keymap.set('i', '<S-Tab>', '<cmd>call augment#Accept()<cr>')

        -- Send a chat message in normal and visual mode
        vim.keymap.set('n', '<leader>ac', ':Augment chat<CR>')
        vim.keymap.set('v', '<leader>ac', ':Augment chat<CR>')

        -- Start a new chat conversation
        vim.keymap.set('n', '<leader>an', ':Augment chat-new<CR>')

        -- Toggle the chat panel visibility
        vim.keymap.set('n', '<leader>at', ':Augment chat-toggle<CR>')

    end
}
