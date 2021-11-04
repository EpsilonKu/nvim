local M = {}

function M.config()
    local U = require "utils"
    local wk = require("which-key")
    local dap = require("dap")

    require("dapui").setup(
        {
            icons = {
                expanded = "↴",
                collapsed = "»"
            },
            mappings = {
                -- Use a table to apply multiple mappings
                expand = {"<CR>", "<2-LeftMouse>"},
                open = "o",
                remove = "d",
                edit = "e",
                repl = "r"
            },
            sidebar = {
                elements = {
                    {
                        id = "scopes",
                        size = 0.25 -- Can be float or integer > 1
                    },
                    {id = "breakpoints", size = 0.25},
                    {id = "stacks", size = 0.25},
                    {id = "watches", size = 0.25}
                    -- You can change the order of elements in the sidebar
                },
                size = 40,
                position = "left" -- Can be "left" or "right"
            },
            tray = {
                elements = {
                    {id = "scopes", size = 0.4},
                    {id = "stacks", size = 0.6}
                },
                size = 10,
                position = "bottom" -- Can be "bottom" or "top"
            },
            floating = {
                max_height = 0.4, -- These can be integers or a float between 0 and 1.
                max_width = 0.3 -- Floats will be treated as percentage of your screen.
            }
        }
    )

    vim.fn.sign_define("DapBreakpoint", {text = "", texthl = "", linehl = "", numhl = ""})
    -- vim.fn.sign_define("DapLogPoint", {text = "", texthl = "", linehl = "", numhl = ""})
    -- vim.fn.sign_define("DapStopped", {text = "", texthl = "", linehl = "", numhl = ""})

require("nvim-dap-virtual-text").setup {
    enabled = true,                     -- enable this plugin (the default)
    enabled_commands = true,            -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = false,   -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true,            -- show stop reason when stopped for exceptions
    commented = false,                  -- prefix virtual text with comment string
    -- experimental features:
    virt_text_pos = 'eol',              -- position of virtual text, see `:h nvim_buf_set_extmark()`
    all_frames = false,                 -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false,                 -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = nil             -- position the virtual text at a fixed window column (starting from the first text column) ,
                                        -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
}

    dap.defaults.fallback.external_terminal = {
        command = "/usr/bin/kitty",
        args = {"-e"}
    }
    dap.defaults.fallback.force_external_terminal = true
    -- dap.defaults.fallback.terminal_win_cmd = ":lua require('FTerm').open_empty()"
end

return M
