
	local wk = require ("which-key")

local U = require "utils"
U.map ("v", "c", "d")
U.map ("n", "c", "d")
U.map ("n", "d", '"_d')
U.map ("n", "<C-q>", ":NvimTreeToggle<CR>");
U.map ("v", "d", '"_d')
U.map ("n", "x", '"_x')
U.map ("v", "x", '"_x')
U.map ("n", ";", "l")
U.map ("n", "l", "k")
U.map ("n", "k", "j")
U.map ("n", "j", "h")
U.map ("v", ";", "l")
U.map ("v", "l", "k")
U.map ("v", "k", "j")
U.map ("v", "j", "h")
U.map ("i", "<C-S-V>", "<Esc>pa")
U.map ("n", "<C-S-V>", "p")
U.map ("v", "<C-S-V>", "p")
-- U.map ("v", "<leader>y", '"+y')
-- U.map ("n", "<leader>Y", '"+yg_')
-- U.map ("n", "<leader>y", '"+y')
-- U.map ("n", "<leader>yy", '"+yy')
	wk.register({
		["<Space>"] = {
			name = "+Quick Actions",
			t = { ":lua require('FTerm').close()<CR>", "  Terminal Close Float" },
			o = { ":lua require('FTerm').open()<CR>", "  Terminal Open Float" },
			i = { ":lua require('dap.ui.widgets').hover()<CR>", "  Debug Float" },
			d = { ":lua require'dap'.toggle_breakpoint()<CR>", "  Toggle Breakpoint" },
			c = { ":lua require'dap'.continue()<CR>", "  Debug Continue"},
			l = { ":Neoformat<CR>", "  Format code" },
			r = { ":lua require('spectre').open()<CR>", " Search and Replace"}
		}
	})
	wk.register({
		["<Space>e"] = {
			name = "+Debugger",
			w = {":lua vim.lsp.buf.workspace_symbol()<CR>", " Workspace symbol"},
			d = {":lua vim.lsp.buf.document_symbol()<CR>", " Document symbol"},
			r = {":lua require('lspsaga.rename').rename()<CR>", " Variable rename"},
			d = {":lua require('navigator.diagnostics').show_diagnostic()<CR>", " Show all buffer diagnostic"},
			f = {":lua vim.lsp.buf.formatting()<CR>", "Format code with lsp"}
		},
		["<Space>d"] = {
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
			-- r = {":lua vim.lsp.buf.references()<CR>", " References"},
			-- s = {":lua vim.lsp.buf.signature_help()<CR>", " Signature help"},
			-- d = {":lua vim.lsp.buf.definition()<CR>", " Definition"},
			-- i = {":lua vim.lsp.buf.implementation()<CR>", " Implementation"},
			-- h = {":lua vim.lsp.buf.hover({ popup_opts = { border = single }})<CR>", " Hover documentation"},
			-- a = {":lua vim.lsp.buf.code_action()<CR>", " Code action"},
			-- t = {":lua vim.lsp.buf.type_definition()<CR>", " Type definition"},
			-- s = {":lua vim.lsp.diagnostic.show_line_diagnostics( { border = 'single' })<CR>", " Show diagnostic line"},
			r = {":lua require('lspsaga.signaturehelp').signature_help()<CR>", " References"},
			-- s = {":lua vim.lsp.buf.signature_help()<CR>", " Signature help"},
			d = {":lua require'lspsaga.provider'.preview_definition()<CR>", " Definition"},
			e = {":lua vim.lsp.buf.definition()<CR>", " Go to definition"},
			i = {":lua require'lspsaga.provider'.lsp_finder()<CR>", " Usage"},
			h = {":lua require('lspsaga.hover').render_hover_doc()<CR>", " Hover documentation"},
			a = {":lua require('lspsaga.codeaction').code_action()<CR>", " Code action"},
			-- t = {":lua vim.lsp.buf.type_definition()<CR>", " Type definition"},
			s = {":lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", " Show diagnostic line"},
		}
	})
	wk.register({
	["<Space>f"] = {
			name = "+Search",
			a = { ":lua require('telescope.builtin').find_files()<CR>", "  Telescope find file" },
			b = { ":lua require('telescope.builtin').buffers()<CR>", " ﬘ Telescope list buffer" },
			c = { ":lua require('telescope.builtin').live_grep()<CR>", "  Telescope live grep" },
			d = { "<CMD>lua TelescopeOpen('oldfiles')<CR>", "  Telescope buffer history" },
			e = { ":lua require('telescope.builtin').help_tags()<CR>", "  Telescope help tags" },
		}
	})
	wk.register({
		["["] = {
			name = "+Actions",
			d = {":require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", " Diagnostic next"},
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
			d = {":require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", " Diagnostic prev"},
			r = {":lua require('navigator.treesitter').goto_previous_usage()<CR>", " Prev variables usage"},
			c = {":lua vim.lsp.buf.outgoing_calls()<CR>", " Outgoing calls"},
		}
	})
