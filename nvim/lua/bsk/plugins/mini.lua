return {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
        require('mini.icons').setup()
        -----------------------------------
        --- mini files
        -----------------------------------
        local mf = require('mini.files')
        mf.setup({
            -- Customization of shown content
            content = {
                -- Predicate for which file system entries to show
                filter = nil,
                -- What prefix to show to the left of file system entry
                prefix = nil,
                -- In which order to show file system entries
                sort = nil,
            },

            -- Module mappings created only inside explorer.
            -- Use `''` (empty string) to not create one.
            mappings = {
                close       = '<ESC>',
                go_in       = '<Right>',
                go_in_plus  = '<CR>',
                go_out      = '<Left>',
                go_out_plus = 'H',
                mark_goto   = "'",
                mark_set    = 'm',
                reset       = '<BS>',
                reveal_cwd  = '@',
                show_help   = 'g?',
                synchronize = '=',
                trim_left   = '<',
                trim_right  = '>',
            },

            -- General options
            options = {
                -- Whether to delete permanently or move into module-specific trash
                permanent_delete = true,
                -- Whether to use for editing directories
                use_as_default_explorer = true,
            },

            -- Customization of explorer windows
            windows = {
                -- Maximum number of windows to show side by side
                max_number = math.huge,
                -- Whether to show preview of file/directory under cursor
                preview = false,
                -- Width of focused window
                width_focus = 50,
                -- Width of non-focused window
                width_nofocus = 15,
                -- Width of preview window
                width_preview = 25,
            },
        })

        -- "-" open mini files on current focused file
        vim.keymap.set("n", "-", function()
            local buf_name = vim.api.nvim_buf_get_name(0)
            local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
            mf.open(path)
            mf.reveal_cwd()
        end, { desc = "Open Mini Files" })
    end
}
