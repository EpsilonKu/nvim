local lsp = require('lspconfig')
local U = require('plugins.lsp.utils')

local capabilities = U.capabilities()
local flags = {allow_incremental_sync = true, debounce_text_changes = 200}

-- Configuring native diagnostics
vim.diagnostic.config({
    virtual_text = {source = 'always'},
    float = {source = 'always'}
})

-- Lua
lsp.sumneko_lua.setup({
    flags = flags,
    capabilities = capabilities,
    on_attach = function(client, buf)
        U.disable_formatting(client)
        U.mappings(buf)
    end,
    settings = {
        Lua = {
            completion = {
                enable = true,
                showWord = 'Disable'
                -- keywordSnippet = 'Disable',
            },
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                path = U.get_luajit_path()
            },
            diagnostics = {
                globals = {
                    'vim', 'dump', 'use', "awesome", "screen", "tag", "client"
                }
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = U.get_nvim_rtp_path()
            }, -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {enable = false}
        }
    }
})

require"lspconfig".html.setup {
    capabilities = capabilities,
    init_options = {
        configurationSection = {"html", "css", "javascript"},
        embeddedLanguages = {css = true, javascript = true}
    }
}

require'lspconfig'.cmake.setup {}

require"lspconfig".clangd.setup {}

require'lspconfig'.vala_ls.setup {}

require'lspconfig'.vuels.setup {}

-- require'lspconfig'.eslint.setup {
    --[[ settings = {
        codeActionsOnSave = {
            mode = "all",
            rules = {"!debugger", "!no-only-tests/*"}
        },
        autoFixOnSave = true
    } ]]
-- } TODO: Solve error

require('lspconfig').sqls.setup {
    on_attach = function(client, bufnr)
        require('sqls').on_attach(client, bufnr)
    end
}
