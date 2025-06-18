return {
    "olimorris/codecompanion.nvim",
    version = "*",
    opts = {},
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        -- shortcut
        vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
        vim.keymap.set({ "n", "v" }, "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })

        -- setup
        require("codecompanion").setup({
            strategies = {
                chat = {
                    adapter = "anthropic",
                },
                inline = {
                    adapter = "anthropic",
                },
            },
            display = {
                chat = {
                    intro_message = "Welcome to CodeCompanion ✨! Press ? for options",
                    show_header_separator = false, -- Show header separators in the chat buffer? Set this to false if you're using an external markdown formatting plugin
                    separator = "─", -- The separator between the different messages in the chat buffer
                    show_references = true, -- Show references (from slash commands and variables) in the chat buffer?
                    show_settings = true, -- Show LLM settings at the top of the chat buffer?
                    show_token_count = true, -- Show the token count for each response?
                    start_in_insert_mode = true, -- Open the chat buffer in insert mode?
                },
            },
        })
    end
}
