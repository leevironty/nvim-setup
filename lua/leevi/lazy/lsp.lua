return {
    {
        'VonHeikemen/lsp-zero.nvim', branch = 'v4.x',
        lazy = false,
        config = function()
            require('mason')
            require('mason-lspconfig')
            local lsp_zero = require('lsp-zero')

            -- lsp_attach is where you enable features that only work
            -- if there is a language server active in the file
            local lsp_attach = function(client, bufnr)
              local opts = {buffer = bufnr}

              vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
              vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
              vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
              vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
              vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
              vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
              vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
              vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
              vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
              vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
            end

            lsp_zero.extend_lspconfig({
              sign_text = true,
              lsp_attach = lsp_attach,
              capabilities = require('cmp_nvim_lsp').default_capabilities(),
            })
            local conf = require 'lspconfig'
            conf.pyright.setup({})
            conf.lua_ls.setup({})
        end
    },
    {'neovim/nvim-lspconfig', lazy = false,},
    {
        'hrsh7th/cmp-nvim-lsp',
        lazy = false,
        config = function()
            local cmp = require('cmp')

            cmp.setup({
              sources = {
                {name = 'nvim_lsp'},
              },
              snippet = {
                expand = function(args)
                  -- You need Neovim v0.10 to use vim.snippet
                  vim.snippet.expand(args.body)
                end,
              },
              mapping = cmp.mapping.preset.insert({}),
            })
        end, 
    },
    {'hrsh7th/nvim-cmp', lazy = false,},
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            -- This should have been called automatically, but was not??
            require('mason').setup({})
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        config = function()
            require 'mason'
            local opt = {
                ensure_installed = {'lua_ls', 'pyright'},
            --     handlers = {
            --         function(server_name)
            --             require('lspconfig')[server_name].setup({})
            --         end,
            --     },
            }
            require('mason-lspconfig').setup(opt)
        end,
    },
}
