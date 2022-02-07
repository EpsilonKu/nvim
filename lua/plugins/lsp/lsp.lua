vim.lsp.handlers["textDocument/publishDiagnostics"] = -- NOTE: This is LSP config
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = {spacing = 4},
        update_in_insert = true -- NOTE: To enable LSP on insert mode
    })

require("project_nvim").setup {
    manual_mode = false,
    -- Methods of detecting the root directory. **"lsp"** uses the native neovim
    -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
    -- order matters: if one is not detected, the other is used as fallback. You
    -- can also delete or rearangne the detection methods.
    detection_methods = {"lsp", "pattern"},
    -- All the patterns used to detect root dir, when **"pattern"** is in
    -- detection_methods
    patterns = {
        ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json",
        "pom.xml"
    },
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
require('lspkind').init({
    mode = 'symbol_text',

    preset = 'codicons',

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
    },
})

local saga = require "lspsaga"
saga.init_lsp_saga {
    error_sign = "",
    warn_sign = "",
    hint_sign = "",
    infor_sign = "",
    code_action_icon = "",
    code_action_keys = {quit = "<Esc>", exec = "<CR>"},
    definition_preview_icon = "  "
}

