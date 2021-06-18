local M = {}

function M.config()
	local U = require "utils"
	local g = vim.g

	g.nvim_tree_side = "left"
	g.nvim_tree_width = 35
	g.nvim_tree_auto_ignore_ft = { 'dashboard' }
	g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }
    g.nvim_tree_auto_close = 1

    g.nvim_tree_follow = 1

    -- 0 by default, this option shows indent markers when folders are open
    g.nvim_tree_indent_markers = 1

    g.nvim_tree_icons = {
        default = "",
        symlink = "",
        git = {
            unstaged = "~",
            staged = "+",
            unmerged = "!",
            renamed = "≈",
            untracked = "?",
            deleted = "-"
        }
    }
	
	U.map("n", "<C-q>", ":NvimTreeToggle<CR>")
	U.map("n", "<A-r>", ":NvimTreeRefresh<CR>")
	U.map("n", "<A-f>", ":NvimTreeFindFile<CR>")
	local tree_cb = require'nvim-tree.config'.nvim_tree_callback
	g.nvim_tree_bindings = {
		["<CR>"]           = tree_cb("edit"),
		["<2-LeftMouse>"]  = tree_cb("edit"),
		["<2-RightMouse>"] = tree_cb("cd"),
		["<C-]>"]          = tree_cb("cd"),
		["<C-v>"]          = tree_cb("vsplit"),
		["<C-x>"]          = tree_cb("split"),
		["<C-t>"]          = tree_cb("tabnew"),
		["<BS>"]           = tree_cb("close_node"),
		["<S-CR>"]         = tree_cb("close_node"),
		["<Tab>"]          = tree_cb("preview"),
		["I"]              = tree_cb("toggle_ignored"),
		["H"]              = tree_cb("toggle_dotfiles"),
		["r"]              = tree_cb("refresh"),
		["<C-n>"]          = tree_cb("create"),
		["<Del>"]          = tree_cb("remove"),
		["<C-r>"]          = tree_cb("rename"),
		["<C-S-r>"]        = tree_cb("full_rename"),
		["<C-x>"]          = tree_cb("cut"),
		["<C-c>"]          = tree_cb("copy"),
		["<C-v>"]          = tree_cb("paste"),
		["-"]              = tree_cb("dir_up"),
		["<C-q>"]          = tree_cb("close"),
    }

end

return M
