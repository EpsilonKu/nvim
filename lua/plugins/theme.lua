-- Lua initialization file
vim.opt.termguicolors = true
vim.cmd('set background=dark')
vim.cmd [[colorscheme melange]]

-- local lush = require('lush')
-- local harbour = require("lush")(require("melange"))
-- local hsluv = lush.hsluv
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
--
