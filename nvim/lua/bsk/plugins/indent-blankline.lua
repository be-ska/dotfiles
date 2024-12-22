return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function()
        -- Iris for indent line in the scope
         vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { fg = "#907aa9", nocombine = true }) -- Current context color

        -- Pass the highlight groups and enable context
        require("ibl").setup {
            scope = {
                enabled = true,                       -- Highlight current context
                highlight = { "IndentBlanklineContextChar" }, -- Use your custom context highlight
            },
        }
    end
}
