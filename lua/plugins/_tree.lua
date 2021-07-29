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
	 vim.g.nvim_tree_bindings = {
      { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
      { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
      { key = "<C-v>",                        cb = tree_cb("vsplit") },
      { key = "<C-x>",                        cb = tree_cb("split") },
      { key = "<C-t>",                        cb = tree_cb("tabnew") },
      { key = "<",                            cb = tree_cb("prev_sibling") },
      { key = ">",                            cb = tree_cb("next_sibling") },
      { key = "P",                            cb = tree_cb("parent_node") },
      { key = "<BS>",                         cb = tree_cb("close_node") },
      { key = "<S-CR>",                       cb = tree_cb("close_node") },
      { key = "<Tab>",                        cb = tree_cb("preview") },
      { key = "K",                            cb = tree_cb("first_sibling") },
      { key = "J",                            cb = tree_cb("last_sibling") },
      { key = "I",                            cb = tree_cb("toggle_ignored") },
      { key = "H",                            cb = tree_cb("toggle_dotfiles") },
      { key = "R",                            cb = tree_cb("refresh") },
      { key = "<C-n>",                        cb = tree_cb("create") },
      { key = "<Del>",                        cb = tree_cb("remove") },
      { key = "r",                            cb = tree_cb("rename") },
      { key = "<C-r>",                        cb = tree_cb("full_rename") },
      { key = "<C-x>",                        cb = tree_cb("cut") },
      { key = "<C-c>",                        cb = tree_cb("copy") },
      { key = "<C-v>",                        cb = tree_cb("paste") },
      { key = "y",                            cb = tree_cb("copy_name") },
      { key = "Y",                            cb = tree_cb("copy_path") },
      { key = "gy",                           cb = tree_cb("copy_absolute_path") },
      { key = "[c",                           cb = tree_cb("prev_git_item") },
      { key = "]c",                           cb = tree_cb("next_git_item") },
      { key = "-",                            cb = tree_cb("dir_up") },
      { key = "<C-q>",                            cb = tree_cb("close") },
      { key = "g?",                           cb = tree_cb("toggle_help") },
    }
end

return M
