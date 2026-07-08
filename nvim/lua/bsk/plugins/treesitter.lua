-- Treesitter-based text highlight (main branch, new API for nvim 0.11+)
return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        -- Parsers to install (c, lua, vim, vimdoc, query, markdown are bundled with nvim)
        require("nvim-treesitter").install({
            "cpp",
            "rust",
            "typescript",
            "javascript",
            "vue",
            "html",
            "css",
            "json",
            "yaml",
            "tsx",
            "python",
        })

        -- Highlighting is opt-in per buffer now: start it whenever a parser exists
        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("bsk.treesitter", {}),
            callback = function(args)
                pcall(vim.treesitter.start, args.buf)
            end,
        })
    end,
}
