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
                open_on_start = false,
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
                width = 40,
                position = "left" -- Can be "left" or "right"
            },
            tray = {
                open_on_start = true,
                elements = {
                    {id = "scopes", size = 0.4},
                    {id = "stacks", size = 0.6}
                },
                height = 10,
                position = "bottom" -- Can be "bottom" or "top"
            },
            floating = {
                max_height = 0.4, -- These can be integers or a float between 0 and 1.
                max_width = 0.3 -- Floats will be treated as percentage of your screen.
            }
        }
    )

    require("dapui").float_element("watches")

    vim.fn.sign_define("DapBreakpoint", {text = "", texthl = "", linehl = "", numhl = ""})
    vim.fn.sign_define("DapLogPoint", {text = "", texthl = "", linehl = "", numhl = ""})
    vim.fn.sign_define("DapStopped", {text = "", texthl = "", linehl = "", numhl = ""})

    vim.g.dap_virtual_text = true

    dap.defaults.fallback.external_terminal = {
        command = "/usr/bin/kitty",
        args = {"-e"}
    }
    dap.defaults.fallback.force_external_terminal = true
    -- dap.defaults.fallback.terminal_win_cmd = ":lua require('FTerm').open_empty()"
end

return M
