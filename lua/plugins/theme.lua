local M = {}

function M.config()

-- Lua initialization file
vim.opt.termguicolors = true
vim.cmd('set background=dark')
vim.cmd [[colorscheme melange]]

-- local lush = require('lush')
-- local harbour = require("lush")(require("melange"))
-- 	local hsluv = lush.hsluv
--TODO: make it
	--
-- local spec = lush.extends({harbour}).with(function()
--   return {
-- -- #B85B5E
-- CursorLine ={hsluv (184,91,94)} 
--   }
-- end)
--
-- -- You may prefer to put this in its own module, shown on _G for brevity.
-- _G.customise_colorscheme = function()
--   -- now we can apply the modified spec.
--   lush(spec)
-- end

-- vim.g.rose_pine_variant = 'moon'
-- vim.g.material_style = "lighter"
-- require('material').set()
	

-- require('material').setup({
--
-- 	contrast = true, -- Enable contrast for sidebars, floating windows and popup menus like Nvim-Tree
-- 	borders = false, -- Enable borders between verticaly split windows
--
-- 	popup_menu = "dark", -- Popup menu style ( can be: 'dark', 'light', 'colorful' or 'stealth' )
--
-- 	italics = {
-- 		comments = true, -- Enable italic comments
-- 		keywords = false, -- Enable italic keywords
-- 		functions = false, -- Enable italic functions
-- 		strings = false, -- Enable italic strings
-- 		variables = false -- Enable italic variables
-- 	},
--
-- 	contrast_windows = { -- Specify which windows get the contrasted (darker) background
-- 		"terminal", -- Darker terminal background
-- 		"packer", -- Darker packer background
-- 		"qf" -- Darker qf list background
-- 	},
--
-- 	text_contrast = {
-- 		lighter = false, -- Enable higher contrast text for lighter style
-- 		darker = false -- Enable higher contrast text for darker style
-- 	},
--
-- 	disable = {
-- 		background = true, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
-- 		term_colors = true, -- Prevent the theme from setting terminal colors
-- 		eob_lines = false -- Hide the end-of-buffer lines
-- 	},
--
-- 	custom_highlights = {} -- Overwrite highlights with your own
-- })
--
-- vim.g.material_style = "darker"
-- vim.cmd 'colorscheme material'
 end

return M

