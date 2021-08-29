
local M = {}

function M.config()
	local g = vim.g
require('nvim-autopairs').setup
  {
      disable_filetype = {"TelescopePrompt", "guihua", "clap_input"},
      autopairs = {enable = true},
      check_ts = false
    }

	require'compe'.setup({
	enabled = true,
	preselect = 'always',
	throttle_time = 80,
  	source_timeout = 200,
  	incomplete_delay = 400,
  	allow_prefix_unmatch = false,
  	with_text = false,
  	source = {
	    path = true,
   	 	buffer = true,
    	calc = true,
    	ultisnips = true,
    	vsnip = false,
    	nvim_lsp = true,
    	nvim_lua = true,
    	spell = true,
    	tags = true
  	},
	})
	-- vim.o.completeopt = "menu,preview,noinsert"
	vim.o.completeopt = "menu,menuone,noselect"
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end
-- inoremap <silent><expr> <C-Space> compe#complete()
-- inoremap <silent><expr> <CR>      compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))
-- inoremap <silent><expr> <C-e>     compe#close('<C-e>')
-- inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
-- inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
require("nvim-autopairs.completion.compe").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` after select function or method item
  auto_select = false,  -- auto select first item
})
vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", { expr = true })
-- vim.cmd('autocmd User CompeConfirmDone lua vim.lsp.buf.signature_help()')
-- vim.api.nvim_set_keymap("i", "<C-Space>", 'compe#complete()', {expr = true})
-- vim.api.nvim_set_keymap("i", "<CR>", 'compe#confirm(luaeval("require "nvim-autopairs".autopairs_cr()', {expr = true})
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

vim.api.nvim_set_keymap("s", "<C-e>", "compe#close('<C-e>')", {expr = true})
end

return M

