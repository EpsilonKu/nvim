local M = {}

function M.config()
    vim.cmd("hi default GHTextViewDark guifg=#b2b2b2 guibg=#080808")
    vim.cmd("hi default GHListDark guifg=#b2b2b2 guibg=#080808")

    require "navigator".setup(
        {
            debug = false, -- log output, set to true and log path: ~/.local/share/nvim/gh.log
            width = 0.75, -- max width ratio (number of cols for the floating window) / (window width)
            height = 0.3, -- max list window height, 0.3 by default
            preview_height = 0.35, -- max height of preview windows
            border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}, -- border style, can be one of 'none', 'single', 'double',
            -- 'shadow', or a list of chars which defines the border
            -- put a on_attach of your own here, e.g
            -- The attach code will apply to all LSP clients

            default_mapping = false, -- set to false if you will remap every key
            -- this kepmap gK will override "gD" mapping function declaration()  in default kepmap
            -- please check mapping.lua for all keymaps
            treesitter_analysis = true, -- treesitter variable context
            transparency = 100, -- 0 ~ 100 blur the main window, 100: fully transparent, 0: opaque,  set to nil or 100 to disable it
            code_action_prompt = {enable = true, sign = true, sign_priority = 40, virtual_text = true},
            icons = {
                -- Code action
                code_action_icon = "",
                -- code lens
                code_lens_action_icon = " ",
                -- Diagnostics
                diagnostic_head = " ",
                diagnostic_head_severity_1 = " ",
                diagnostic_head_severity_2 = " ",
                diagnostic_head_severity_3 = " ",
                diagnostic_head_description = "",
                diagnostic_virtual_text = " ",
                diagnostic_file = " ",
                -- Values
                value_changed = " ",
                value_definition = "𤋮 ",
                -- Treesitter
                match_kinds = {
                    var = "ךּ",
                    method = " ƒ ",
                    ["function"] = "  ",
                    parameter = "  ",
                    associated = "  ",
                    namespace = "  ",
                    type = "  ",
                    field = " ﰠ "
                },
                treesitter_defult = "串"
            },
            lsp = {
                format_on_save = true, -- set to false to disasble lsp code format on save (if you are using prettier/efm/formater etc)
                diagnostic_scroll_bar_sign = {'╍', 'ﮆ'}, -- experimental:  diagnostic status in scroll bar area; set to nil to disable the diagnostic sign,
                disable_lsp = "all",
                -- for other style, set to {'╍', 'ﮆ'} or {'-', '='}
                diagnostic_virtual_text = true, -- show virtual for diagnostic message
                diagnostic_update_in_insert = true, -- update diagnostic message in insert mode
                disply_diagnostic_qf = true -- always show quickfix if there are diagnostic errors, set to false if you  want to
            }
        }
    )
end

return M
