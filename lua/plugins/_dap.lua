
local M = {}

function M.config()
	local U = require "utils"
	local wk = require("which-key")
	local dap = require ("dap")

	require("dapui").setup({
		icons = {
			expanded = "⯆",
			collapsed = "⯈"
		},
	mappings = {
    -- Use a table to apply multiple mappings
		expand = {"<CR>", "<2-LeftMouse>"},
		open = "o",
		remove = "d",
		edit = "e",
	},
	sidebar = {
    open_on_start = false,
    elements = {
      -- You can change the order of elements in the sidebar
    },
    width = 40,
    position = "left" -- Can be "left" or "right"
  },
	tray = {
		elements = {
			"repl"
		},
		height = 10,
		position = "bottom" -- Can be "bottom" or "top"
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil   -- Floats will be treated as percentage of your screen.
	}
	})

	require("dapui").float_element("watches")

	vim.fn.sign_define('DapBreakpoint', {text='', texthl='', linehl='', numhl=''})
-- vim.fn.sign_define('DapLogPoint', {text='', texthl='', linehl='', numhl=''})
-- vim.fn.sign_define('DapStopped', {text='', texthl='', linehl='', numhl=''})
	

	wk.register({
		["<leader>d"] = {
			name = "+Debugger",
			a = { ":lua require'dap'.toggle_breakpoint()<CR>", "  Toggle Breakpoint" },
			b = { ":lua require'dap'.step_over()<CR>", "  Debug Step Over" },
			c = { ":lua require'dap'.step_into()<CR>", "  Debug Step Into" },
			d = { ":lua require'dap'.step_out()<CR>", "  Debug Step Out" },
			e = { ":lua require'dap'.continue()<CR>", "  Debug Continue" },
			f = { ":lua require'dap'.stop()<CR>", " 栗Debug Stop Process" }
		}
	})


	dap.defaults.fallback.terminal_win_cmd = ":lua require('FTerm').open_empty()"

    -- nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
    -- nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
    -- nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
    -- nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
    -- nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
    -- nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
    -- nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
    -- nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
    -- nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>
-- dap.ui.variables.hover()
end

return M

