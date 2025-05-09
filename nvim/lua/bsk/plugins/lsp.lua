return {
    {
        -- install language servers
        "williamboman/mason.nvim",
        version = "^1.0.0",
        config = function()
            require('mason').setup()
        end
    },
    {
        -- autoinstall language servers
        "williamboman/mason-lspconfig.nvim",
        version = "^1.0.0",
        config = function()
            require('mason-lspconfig').setup({
                -- Replace the language servers listed here with the ones you want to install
                ensure_installed = { 'clangd', 'lua_ls', 'ltex', 'lemminx', 'yamlls', 'biome', 'pyright' },
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                },
            })
        end
    },
    {
        -- handle communication between LSP and nvim
        "neovim/nvim-lspconfig",
        config = function()
            -- Add cmp_nvim_lsp capabilities settings to lspconfig
            -- This should be executed before you configure any language server
            local lspconfig_defaults = require('lspconfig').util.default_config
            lspconfig_defaults.capabilities = vim.tbl_deep_extend(
                'force',
                lspconfig_defaults.capabilities,
                require('cmp_nvim_lsp').default_capabilities()
            )

            -- LspAttach apply keybindings after a language server has attached to a given buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = { buffer = event.buf }
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
                    vim.keymap.set('n', 'ge', vim.diagnostic.open_float, opts)
                    vim.keymap.set('n', 'gn', vim.diagnostic.goto_next, opts)
                    vim.keymap.set('n', 'gp', vim.diagnostic.goto_prev, opts)
                end,
            })
        end
    },

    {
        -- Use LSP as source for autocompletion
        'hrsh7th/cmp-nvim-lsp',
        config = function()
            -- Reserve a space in the gutter
            -- This will avoid an annoying layout shift in the screen
            -- vim.opt.signcolumn = 'yes'
        end
    },

    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require('cmp')

            cmp.setup({
                -- at least one is required
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },
                sources = {
                    { name = 'nvim_lsp' },
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
            })
        end
    }
}
