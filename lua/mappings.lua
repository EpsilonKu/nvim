
	local wk = require ("which-key")

	wk.register({
		["<Space>"] = {
			name = "+Quick Actions",
			f = { ":RnvimrToggle<CR>", " ﱮ Open ranger explorer" },
			t = { ":lua require('FTerm').close()<CR>", "  Terminal Close Float" },
			o = { ":lua require('FTerm').open()<CR>", "  Terminal Open Float" },
			i = { ":lua require('dap.ui.widgets').hover()<CR>", "  Debug Float" },
			d = { ":lua require'dap'.toggle_breakpoint()<CR>", "  Toggle Breakpoint" },
			e = { ":lua require'dap'.continue()<CR>", "  Debug Continue"},
			l = { ":Neoformat<CR>", "  Format code" }
		}
	})
	wk.register({
		["<leader>f"] = {
			name = "+Debugger",
			w = {":lua vim.lsp.buf.workspace_symbol()<CR>", " Workspace symbol"},
			d = {":lua vim.lsp.buf.document_symbol()<CR>", " Document symbol"},
			r = {":lua vim.lsp.buf.rename()<CR>", " Variable rename"},
			d = {":lua require('navigator.diagnostics').show_diagnostic()<CR>", " Show all buffer diagnostic"},
			f = {":lua vim.lsp.buf.formatting()<CR>", "Format code with lsp"}
		},
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
			v = { ':lua require("dapui").eval()<CR>', "  Variables" },
			c = { ':Telescope dap commands<CR>', " גּ Debug commands" },
			i = { ':lua require("dapui").float_element("stacks")<CR>', "  Variables hover" },
		}
	})
	wk.register({
	["e"] = {
			name = "+Lsp Actions",
			r = {":lua vim.lsp.buf.references()<CR>", " References"},
			s = {":lua vim.lsp.buf.signature_help()<CR>", " Signature help"},
			d = {":lua vim.lsp.buf.definition()<CR>", " Definition"},
			i = {":lua vim.lsp.buf.implementation()<CR>", " Implementation"},
			h = {":lua vim.lsp.buf.hover({ popup_opts = { border = single }})<CR>", " Hover documentation"},
			a = {":lua vim.lsp.buf.code_action()<CR>", " Code action"},
			t = {":lua vim.lsp.buf.type_definition()<CR>", " Type definition"},
			s = {":lua vim.lsp.diagnostic.show_line_diagnostics( { border = 'single' })<CR>", " Show diagnostic line"},
		}
	})
	wk.register({
	["f"] = {
			name = "+Telescope",
			a = { ":Telescope find_files<CR>", "  Telescope find file" },
			b = { ":lua TelescopeOpen('buffers')<CR>", " ﬘ Telescope list buffer" },
			c = { ":lua TelescopeOpen('live_grep')<CR>", "  Telescope live grep" },
			d = { "<CMD>lua TelescopeOpen('oldfiles')<CR>", "  Telescope buffer history" },
			e = { "<CMD>lua TelescopeOpen('registers')<CR>", "  Telescope register list" },
		}
	})
	wk.register({
		["["] = {
			name = "+Actions",
			d = {":lua vim.lsp.diagnostic.goto_next({ border = 'single' })<CR>", " Diagnostic next"},
			r = {":lua require('navigator.treesitter').goto_next_usage()<CR>", " Next variables usage"},
			c = {":lua vim.lsp.buf.incoming_calls()<CR>", " Incoming calls"},
			-- d = {"<cmd>lua vim.lsp.buf.definition()<CR>", "Goto definition"},
			-- u = {"<cmd>lua vim.lsp.buf.declaration()<CR>", "Goto declarations"},
			-- i = {"<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto implementation"},
			-- t = {"<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type definition"},
			-- r = {"<cmd>lua vim.lsp.buf.rename()<CR>", "Type rename"},
			-- e = {"<cmd>lua vim.lsp.buf.references()<CR>", "References"},
			-- s = {"<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "Show diagnostic"},
		}, 
		["]"] = {
			name = "+Actions",
			d = {":lua vim.lsp.diagnostic.goto_prev({ border = 'single' })<CR>", " Diagnostic prev"},
			r = {":lua require('navigator.treesitter').goto_previous_usage()<CR>", " Prev variables usage"},
			c = {":lua vim.lsp.buf.outgoing_calls()<CR>", " Outgoing calls"},
		}
	})
