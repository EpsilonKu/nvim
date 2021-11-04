local M = {}

function M.config()
	local sidebar = require("sidebar-nvim")
	local opts = {}
	opts.bindings = { 
		["q"] = function() require("sidebar-nvim").close() end 
	}
	opts.datetime = {
        format = "%a %b %d, %H:%M",
        clocks = {
            { name = "local" }
        }
    }

	sidebar.setup(opts)

	vim.g.symbols_outline = {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = true,
    position = 'right',
    width = 25,
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = true,
    preview_bg_highlight = 'Pmenu',
    keymaps = { -- These keymaps can be a string or a table for multiple keys
        close = {"<Esc>", "q"},
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "a",
    },
    lsp_blacklist = {},
    symbol_blacklist = {},
    symbols = {
        File = {icon = "", hl = "TSURI"},
        Module = {icon = "", hl = "TSNamespace"},
        Namespace = {icon = "", hl = "TSNamespace"},
        Package = {icon = "", hl = "TSNamespace"},
        Class = {icon = "", hl = "TSType"},
        Method = {icon = "ƒ", hl = "TSMethod"},
        Property = {icon = "", hl = "TSMethod"},
        Field = {icon = "", hl = "TSField"},
        Constructor = {icon = "", hl = "TSConstructor"},
        Enum = {icon = "ℰ", hl = "TSType"},
        Interface = {icon = "ﰮ", hl = "TSType"},
        Function = {icon = "", hl = "TSFunction"},
        Variable = {icon = "", hl = "TSConstant"},
        Constant = {icon = "", hl = "TSConstant"},
        String = {icon = "", hl = "TSString"},
        Number = {icon = "#", hl = "TSNumber"},
        Boolean = {icon = "⊨", hl = "TSBoolean"},
        Array = {icon = "", hl = "TSConstant"},
        Object = {icon = "⦿", hl = "TSType"},
        Key = {icon = "🔐", hl = "TSType"},
        Null = {icon = "NULL", hl = "TSType"},
        EnumMember = {icon = "", hl = "TSField"},
        Struct = {icon = "𝓢", hl = "TSType"},
        Event = {icon = "🗲", hl = "TSType"},
        Operator = {icon = "+", hl = "TSOperator"},
        TypeParameter = {icon = "𝙏", hl = "TSParameter"}
    }
}
--     require "navigator".setup(
--         {
--             debug = false, -- log output, set to true and log path: ~/.local/share/nvim/gh.log
--             width = 0.75, -- max width ratio (number of cols for the floating window) / (window width)
--             height = 0.3, -- max list window height, 0.3 by default
--             preview_height = 0.35, -- max height of preview windows
--             border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}, -- border style, can be one of 'none', 'single', 'double',
--             -- 'shadow', or a list of chars which defines the border
--             -- put a on_attach of your own here, e.g
--             -- The attach code will apply to all LSP clients
-- 
--             default_mapping = false, -- set to false if you will remap every key
--             -- this kepmap gK will override "gD" mapping function declaration()  in default kepmap
--             -- please check mapping.lua for all keymaps
--             treesitter_analysis = true, -- treesitter variable context
--             transparency = 100, -- 0 ~ 100 blur the main window, 100: fully transparent, 0: opaque,  set to nil or 100 to disable it
--             code_action_prompt = {enable = true, sign = true, sign_priority = 40, virtual_text = true},
--             icons = {
--                 -- Code action
--                 code_action_icon = "",
--                 -- code lens
--                 code_lens_action_icon = " ",
--                 -- Diagnostics
--                 diagnostic_head = " ",
--                 diagnostic_head_severity_1 = " ",
--                 diagnostic_head_severity_2 = " ",
--                 diagnostic_head_severity_3 = " ",
--                 diagnostic_head_description = "",
--                 diagnostic_virtual_text = " ",
--                 diagnostic_file = " ",
--                 -- Values
--                 value_changed = " ",
--                 value_definition = "𤋮 ",
--                 -- Treesitter
--                 match_kinds = {
--                     var = "ךּ",
--                     method = " ƒ ",
--                     ["function"] = "  ",
--                     parameter = "  ",
--                     associated = "  ",
--                     namespace = "  ",
--                     type = "  ",
--                     field = " ﰠ "
--                 },
--                 treesitter_defult = "串"
--             },
--             lsp = {
--                 format_on_save = true, -- set to false to disasble lsp code format on save (if you are using prettier/efm/formater etc)
--                 diagnostic_scroll_bar_sign = {'╍', 'ﮆ'}, -- experimental:  diagnostic status in scroll bar area; set to nil to disable the diagnostic sign,
--                 disable_lsp = "all",
--                 -- for other style, set to {'╍', 'ﮆ'} or {'-', '='}
--                 diagnostic_virtual_text = true, -- show virtual for diagnostic message
--                 diagnostic_update_in_insert = true, -- update diagnostic message in insert mode
--                 disply_diagnostic_qf = true -- always show quickfix if there are diagnostic errors, set to false if you  want to
--             }
--         }
--     )
end

return M
