local M = {}

function M.config()
    local g = vim.g

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    -- vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
    -- vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
    -- vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
    -- vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})

    -- set default prefix.
    -- vim.lsp.handlers["textDocument/publishDiagnostics"] =
    --     vim.lsp.with(
    --     vim.lsp.diagnostic.on_publish_diagnostics,
    --     {
    --         -- virtual_text = false,
    --         virtual_text = {prefix = ""},
    --         signs = true,
    --         update_in_insert = false
    --     }
    -- )
    vim.g.nvim_tree_update_cwd = 1
    vim.g.nvim_tree_respect_buf_cwd = 1
    require("project_nvim").setup {
        manual_mode = false,
        -- Methods of detecting the root directory. **"lsp"** uses the native neovim
        -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
        -- order matters: if one is not detected, the other is used as fallback. You
        -- can also delete or rearangne the detection methods.
        detection_methods = {"lsp", "pattern"},
        -- All the patterns used to detect root dir, when **"pattern"** is in
        -- detection_methods
        patterns = {".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "pom.xml"},
        -- Table of lsp clients to ignore by name
        -- eg: { "efm", ... }
        ignore_lsp = {},
        -- Show hidden files in telescope
        show_hidden = false,
        -- When set to false, you will get a message when project.nvim changes your
        -- directory.
        silent_chdir = true,
        -- Path where project.nvim will store the project history for use in
        -- telescope
        datapath = vim.fn.stdpath("data")
    }
    require("lspkind").init(
        {
            with_text = true,
            preset = "codicons",
            symbol_map = {
                Text = "",
                Method = "",
                Function = "",
                Constructor = "",
                Field = "ﰠ",
                Variable = "",
                Class = "ﴯ",
                Interface = "",
                Module = "",
                Property = "ﰠ",
                Unit = "塞",
                Value = "",
                Enum = "",
                Keyword = "",
                Snippet = "",
                Color = "",
                File = "",
                Reference = "",
                Folder = "",
                EnumMember = "",
                Constant = "",
                Struct = "פּ",
                Event = "",
                Operator = "",
                TypeParameter = ""
            }
        }
    )
-- 
    --Html lsp
    --Enable (broadcasting) snippet capability for completion
--     local capabilities = vim.lsp.protocol.make_client_capabilities()
--     capabilities.textDocument.completion.completionItem.snippetSupport = true
-- 
--     require "lspconfig".html.setup {
--         capabilities = capabilities,
--     }
	    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    require "lspconfig".html.setup {
        capabilities = capabilities,
    }
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}
-- require'lspconfig'.stylelint_lsp.setup{}

local saga = require 'lspsaga'

-- add your config value here
-- default value

saga.init_lsp_saga {
-- use_saga_diagnostic_sign = true
error_sign = '',
warn_sign = '',
hint_sign = '',
infor_sign = '',
dianostic_header_icon = '   ',
code_action_icon = '',
-- code_action_prompt = {
--   enable = true,
--   sign = true,
--   sign_priority = 20,
--   virtual_text = true,
-- },
-- finder_definition_icon = '  ',
-- finder_reference_icon = '  ',
-- max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
-- finder_action_keys = {
--   open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
-- },
code_action_keys = {
  quit = '<Esc>',exec = '<CR>'
},
-- rename_action_keys = {
--   quit = '<C-c>',exec = '<CR>'  -- quit can be a table
-- },
definition_preview_icon = '  '
-- "single" "double" "round" "plus"
-- border_style = "single"
-- rename_prompt_prefix = '➤',
-- if you don't use nvim-lspconfig you must pass your server name and
-- the related filetypes into this table
-- like server_filetype_map = {metals = {'sbt', 'scala'}}
-- server_filetype_map = {}
}
require'lspconfig'.clangd.setup{}
end

return M
