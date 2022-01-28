local wk = require("which-key")

local U = require "utils"
U.map("v", "c", "d")
U.map("n", "c", "d")
U.map("n", "d", '"_d')
U.map("n", "<C-q>", ":NvimTreeToggle<CR>")
U.map("v", "d", '"_d')
U.map("n", "x", '"_x')
U.map("v", "x", '"_x')
U.map("n", ";", "l")
U.map("n", "l", "k")
U.map("n", "k", "j")
U.map("n", "j", "h")
U.map("v", ";", "l")
U.map("v", "l", "k")
U.map("v", "k", "j")
U.map("v", "j", "h")
U.map("i", "<C-S-V>", "<Esc>pa")
U.map("n", "<C-S-V>", "p")
U.map("v", "<C-S-V>", "p")

U.map ("n", "<C-d>", ":bnext <CR>")
U.map ("n", "<C-a>", ":bprevious<CR>")

U.map ("i", "<C-d>", ":bnext <CR>")
U.map ("i", "<C-a>", ":bprevious<CR>")
wk.register(
    {
        ["<Space>"] = {
            name = "+Quick Actions",
            t = {":lua require('FTerm').close()<CR>", "  Terminal Close Float"},
            o = {":lua require('FTerm').open()<CR>", "  Terminal Open Float"},
            i = {":lua require('dap.ui.widgets').hover()<CR>", "  Debug Float"},
            d = {":lua require'dap'.toggle_breakpoint()<CR>", "  Toggle Breakpoint"},
            c = {":lua require'dap'.continue()<CR>", "  Debug Continue"},
            l = {":Neoformat<CR>", "  Format code"},
			q = {":tabclose<CR>", " Close tab"}
        }
    }
)
wk.register(
    {
        ["<Space>w"] = {
            name = "+Window management",
            x = {":lua require('FTerm').close()<CR>", "  Terminal Close Float"},
            o = {":lua require('FTerm').open()<CR>", "  Terminal Open Float"},
			t = {":lua require('dapui').toggle('tray')<CR>", " Dap UI toggle"},
			f = {":tabnext<CR>", " Next Tab"},
			j = {":tabprevious<CR>", "Prev Tab"},
			i = {":tabnew<CR>", "New Tab"},
			c = {":bdelete<CR>", "Buffer delete"}
        }
    }
)
wk.register(
    {
        ["<Space>r"] = {
            name = "+Sessions",
            c = {":lua require('persistence').load()<CR>", " Load session from Directory"},
            l = {":lua require('persistence').load({ last = true })<CR>", " Load last session"},
            s = {":lua require('persistence').stop()<CR>", " Exit session"}
        }
    }
)
wk.register(
    {
        ["<Space>e"] = {
            name = "+Quick Actions",
            w = {":lua vim.lsp.buf.workspace_symbol()<CR>", " Workspace symbol"},
            d = {":lua vim.lsp.buf.document_symbol()<CR>", " Document symbol"},
            r = {":lua require('lspsaga.rename').rename()<CR>", " Variable rename"},
            s = {":lua require('navigator.diagnostics').show_diagnostic()<CR>", " Show all buffer diagnostic"},
            f = {":lua vim.lsp.buf.formatting()<CR>", "Format code with lsp"}
        },
        ["<Space>d"] = {
            name = "+Debugger",
            a = {":lua require'dap'.toggle_breakpoint()<CR>", "  Toggle Breakpoint"},
            s = {":lua require'dap'.step_over()<CR>", "  Debug Step Over"},
            d = {":lua require'dap'.step_into()<CR>", "  Debug Step Into"},
            f = {":lua require'dap'.step_out()<CR>", "  Debug Step Out"},
            e = {":lua require'dap'.continue()<CR>", "  Debug Continue"},
            q = {":lua require'dap'.close()<CR>", " 栗Debug Stop Process"}
        },
        ["<Space>a"] = {
            name = "+Debugger quick actions",
            f = {":Telescope dap frames<CR>", " ﮆ Frames"},
            b = {":Telescope dap list_breakpoints<CR>", " ךּ List breakpoints"},
            v = {':lua require("dapui").eval()<CR>', "  Variables"},
            c = {":Telescope dap commands<CR>", " גּ Debug commands"},
            i = {':lua require("dapui").float_element("stacks")<CR>', "  Variables hover"}
        }
    }
)
wk.register(
    {
        ["e"] = {
            name = "+Lsp Actions",
            r = {":lua require('lspsaga.signaturehelp').signature_help()<CR>", " References"},
            d = {":lua require'lspsaga.provider'.preview_definition()<CR>", " Definition"},
            e = {":lua vim.lsp.buf.definition()<CR>", " Go to definition"},
            i = {":lua require'lspsaga.provider'.lsp_finder()<CR>", " Usage"},
            h = {":lua require('lspsaga.hover').render_hover_doc()<CR>", " Hover documentation"},
            a = {":lua require('lspsaga.codeaction').code_action()<CR>", " Code action"},
            s = {":lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", " Show diagnostic line"}
        }
    }
)
wk.register(
    {
        ["<Space>f"] = {
            name = "+Search",
            a = {":lua require('telescope.builtin').find_files()<CR>", "  Telescope find file"},
            b = {":lua require('telescope.builtin').buffers()<CR>", " ﬘ Telescope list buffer"},
            c = {":lua require('telescope.builtin').live_grep()<CR>", "  Telescope live grep"},
            d = {"<CMD>lua TelescopeOpen('oldfiles')<CR>", "  Telescope buffer history"},
            e = {":lua require('telescope.builtin').help_tags()<CR>", "  Telescope help tags"},
            r = {":lua require('spectre').open()<CR>", " Search and Replace"},
			f = {":lua require('telescope').extensions.frecency.frecency()<CR>", "Telescope frecency"}
        }
    }
)
wk.register(
    {
        ["<Space>z"] = {
            name = "+Diag Actions",
            d = {":require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", " Diagnostic next"},
            r = {":lua require('navigator.treesitter').goto_next_usage()<CR>", " Next variables usage"},
            c = {":lua vim.lsp.buf.incoming_calls()<CR>", " Incoming calls"},
            a = {":require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", " Diagnostic prev"},
            e = {":lua require('navigator.treesitter').goto_previous_usage()<CR>", " Prev variables usage"},
            v = {":lua vim.lsp.buf.outgoing_calls()<CR>", " Outgoing calls"}
    }
})

