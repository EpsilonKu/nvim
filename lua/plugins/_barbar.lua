	local U = require "utils"
	local g = vim.g
	
-- 	U.map ("n", "<C-d>", ":BufferNext <CR>")
-- 	U.map ("n", "<C-a>", ":BufferPrevious <CR>")
-- 
-- 	U.map ("i", "<C-d>", ":BufferNext <CR>")
-- 	U.map ("i", "<C-a>", ":BufferPrevious <CR>")
-- 	
-- 	U.map ("n", "<C-F4>",":BufferClose <CR>")
-- 	U.map ("n", "<C-S-F4>",":BufferCloseAllButCurrent <CR>")

vim.opt.termguicolors = true
require("bufferline").setup{}

	U.map ("n", "<C-d>", ":BufferLineCycleNext <CR>")
	U.map ("n", "<C-a>", ":BufferLineCyclePrev <CR>")

	U.map ("i", "<C-d>", ":BufferLineCycleNext <CR>")
	U.map ("i", "<C-a>", ":BufferLineCyclePrev <CR>")
	
	-- U.map ("n", "<C-q>",":BufferCloseAllButCurrent <CR>")

require('bufferline').setup {
  options = {
    close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
      -- remove extension from markdown files for example
      if buf.name:match('%.md') then
        return vim.fn.fnamemodify(buf.name, ':t:r')
      end
    end,
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
	diagnostics_indicator = function(count, level, diagnostics_dict, context)
		local icon = level:match("error") and " " or " "
		return " " .. icon .. count
	end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    offsets = {
			{
				filetype = "NvimTree", 
				text = "File Explorer", 
				text_align = "center"
			}
		},
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "thin",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    sort_by = 'id'
  }
}

