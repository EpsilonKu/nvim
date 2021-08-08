
local M = {}

function M.config()
	local U = require "utils"
	local wk = require("which-key")
	local dap = require ("dap")

	require("dapui").setup({
		icons = {
			expanded = "»",
			collapsed = "↴"
		},
	mappings = {
    -- Use a table to apply multiple mappings
		expand = {"<CR>", "<2-LeftMouse>"},
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
	},
	sidebar = {
    open_on_start = false,
    elements = {
		 {
        id = "scopes",
        size = 0.25, -- Can be float or integer > 1
      },
      { id = "breakpoints", size = 0.25 },
      { id = "stacks", size = 0.25 },
      { id = "watches", size = 0.25 },
      -- You can change the order of elements in the sidebar
    },
    width = 40,
    position = "left" -- Can be "left" or "right"
  },
	tray = {
		open_on_start = true,
		elements = {
			"scopes"
		},
		height = 10,
		position = "bottom" -- Can be "bottom" or "top"
	},
	floating = {
		max_height = 0.4, -- These can be integers or a float between 0 and 1.
		max_width = 0.3,   -- Floats will be treated as percentage of your screen.
		mappings = {
    		close = { "q", "<Esc>" },
    	},
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
			s = { ":lua require'dap'.step_over()<CR>", "  Debug Step Over" },
			d = { ":lua require'dap'.step_into()<CR>", "  Debug Step Into" },
			f = { ":lua require'dap'.step_out()<CR>", "  Debug Step Out" },
			e = { ":lua require'dap'.continue()<CR>", "  Debug Continue" },
			q = { ":lua require'dap'.close()<CR>", " 栗Debug Stop Process" },
		},
		["<C-d>"] = {
			name = "+Debugger quick actions",
			f = { ':Telescope dap frames<CR>', " ﮆ Frames" },
			b = { ':Telescope dap list_breakpoints<CR>', " ךּ List breakpoints" },
			v = { ':Telescope dap variables<CR>', "  Variables" },
			c = { ':Telescope dap commands<CR>', " גּ Debug commands" },
			i = { ':lua require("dapui").float_element("stacks")<CR>', "  Variables hover" },
		}
	})

	vim.g.dap_virtual_text = true

	dap.defaults.fallback.terminal_win_cmd = ":lua require('FTerm').open_empty()"

    -- nnoremap <silent> <f5> :lua require'dap'.continue()<cr>
    -- nnoremap <silent> <f10> :lua require'dap'.step_over()<cr>
    -- nnoremap <silent> <f11> :lua require'dap'.step_into()<cr>
    -- nnoremap <silent> <f12> :lua require'dap'.step_out()<cr>
    -- nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<cr>
    -- nnoremap <silent> <leader>b :lua require'dap'.set_breakpoint(vim.fn.input('breakpoint condition: '))<cr>
    -- nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('log point message: '))<cr>
    -- nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<cr>
    -- nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>
-- dap.ui.variables.hover()
end

return M

