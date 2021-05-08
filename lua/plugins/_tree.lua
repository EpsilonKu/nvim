local M = {}

function M.config()
	local U = require "utils"
	local g = vim.g

	g.nvim_tree_side = "left"
	g.nvim_tree_width = 35
	g.nvim_tree_auto_ignore_ft = { 'dashboard' }

    -- 0 by default, opens the tree when typing `vim $DIR` or `vim`
    g.nvim_tree_auto_open = 1

    -- 0 by default, closes the tree when it's the last window
    g.nvim_tree_auto_close = 1

    -- 0 by default, this option allows the cursor to be updated when entering a buffer
    g.nvim_tree_follow = 1

    -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
    -- g.nvim_tree_git_hl = 1

    -- 0 by default, this option shows indent markers when folders are open
    g.nvim_tree_indent_markers = 1

    -- 0 by default, this option hides files and folders starting with a dot `.`
    -- g.nvim_tree_hide_dotfiles = 1

    -- This is the default. See :help filename-modifiers for more options
    -- g.nvim_tree_root_folder_modifier = ':~'

    -- 0 by default, will open the tree when entering a new tab and the tree was previously open
    -- g.nvim_tree_tab_open = 1

    -- "If 0, do not show the icons for one of 'git' 'folder' and 'files'
    -- "1 by default, notice that if 'files' is 1, it will only display
    -- "if nvim-web-devicons is installed and on your runtimepath
    -- g.nvim_tree_show_icons = {
    --     git = 1,
    --     folders = 0,
    --     files = 0,
    -- }

    -- " default will show icon by default if no icon is provided
    -- " default shows no icon by default
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
--	nnoremap <leader>r :NvimTreeRefresh<CR>
--	nnoremap <leader>n :NvimTreeFindFile<CR>
--	let nvim_tree_disable_keybindings=1
	local tree_cb = require'nvim-tree.config'.nvim_tree_callback
	g.nvim_tree_bindings = {
--		["<CR>"] = ":YourVimFunction()<cr>",
--		["u"] = ":lua require'some_module'.some_function()<cr>",
      -- default mappings
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
--		["[c"]             = tree_cb("prev_git_item"),
--		["]c"]             = tree_cb("next_git_item"),
		["-"]              = tree_cb("dir_up"),
		["<C-q>"]          = tree_cb("close"),
    }
    -- U.augroup("LuaTreeOverride", function nvim_tree_override()
    --     cmd("au FileType LuaTree setlocal nowrap")
    -- end)

    -- a list of groups can be found at `:help nvim_tree_highlight`


end

return M
