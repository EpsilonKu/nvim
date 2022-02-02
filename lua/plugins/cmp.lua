
local g = vim.g
local fn = vim.fn
local api = vim.api
local cmp = require("cmp")
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

require("nvim-autopairs").setup {
    disable_filetype = {"TelescopePrompt", "guihua", "clap_input"},
    autopairs = {enable = true},
    check_ts = false
}
vim.cmd [[
set pumheight=10
]]	

local lspkind = require('lspkind')
cmp.setup {
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end
    },
    mapping = {
 		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' })
    },
    sources = {
        {name = "nvim_lsp"},
        {name = "buffer"},
 		{ name = 'path' },
    },
	formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      return vim_item
    end
  }
}
-- vim.highlight.create('CmpItemAbbrMatch', {guibg=0}, false)
-- highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
-- highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
-- highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
-- highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
-- highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
-- highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"

-- let g:dashboard_custom_header=[
--         \' ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⣪⣭⣿⣷⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀ ',
--         \' ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠤⢤⢔⡾⣹⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀ ',
--         \' ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⢰⢳⣿⣿⣿⠋⣻⣿⣿⣿⣿⣿⣿⣾⣿⠟⠀⠀⠀ ',
--         \' ⠀⠀⠀⠀⠀⢀⠔⠁⠀⠀⠀⢸⣼⣷⣻⣧⣴⣿⣏⣿⣿⣿⣿⣿⣿⣿⣶⣶⣦⠤ ',
--         \' ⠀⠀⠀⠀⢠⠇⠀⠀⠀⠀⠀⠈⢿⣿⣷⣿⣏⡿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⠁⠀ ',
--         \' ⠀⠀⠀⢀⠇⠀⠀⠀⠀⠀⠀⠀⠀⠹⢿⣿⣿⣿⣝⣿⣯⣾⠋⣇⠀⠀⠀⠀⠀⠀ ',
--         \' ⠀⠀⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡄⠀⠀⠙⣽⣝⠋⢡⣯⣀⠘⢦⡀⠀⠀⠀⠀ ',
--         \' ⠀⠀⡷⡁⠀⡄⠀⢠⠻⠀⠀⠀⢸⠙⠀⠀⠀⠙⡇⢹⣧⠛⠂⠀⢤⣉⠢⡀⠀⠀ ',
--         \' ⡠⢊⠚⢇⣰⢣⠀⡞⠒⠣⠀⠀⠘⡄⠘⠓⠲⢆⣳⠀⠀⣠⣄⣀⣀⠙⢯⣾⡄⠀ ',
--         \' ⣇⣇⡌⠈⡜⡌⢳⣧⣤⣄⡑⠄⣀⣳⢀⣠⣤⣴⣾⡆⠀⣿⠖⣠⣮⠀⠀⣿⠇⠀ ',
--         \' ⠈⠛⢇⠀⠿⠷⡘⣿⢙⠿⡏⠀⠈⠉⢻⣻⣿⡏⢹⡟⣢⣿⣟⡻⠋⢀⡴⠁⠀⠀ ',
--         \' ⠀⠀⠈⠢⢤⣀⣋⡿⢮⡉⠁⠀⠀⠀⠈⢉⣙⠷⠛⠺⣿⣙⣛⠭⠝⠋⠀⠀⠀⠀ ',
--         \' ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡩⠒⠶⠲⠞⠓⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
--         \' ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣵⣕⣉⣫⣿⣦⠀⠱⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
--         \' ⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡾⡿⡟⣻⣿⡏⠱⣮⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
--         \' ⠀⠀⠀⠀⠀⠀⠀⣰⢿⡛⣿⣾⣜⣾⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀ ',
--         \' ⠀⠀⠀⠀⢀⣴⣿⣾⣿⣿⣿⣿⣿⣿⣾⡏⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀ ',
--         \' ⠀⠀⠀⠀⢀⣵⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⣿⣯⣿⣿⠟⠃⠀⠀⠀⠀⠀⠀ ',
--         \' ⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣶⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠟⠀⠀⠀⠀⠀⠀⠀⠀ ',
--         \' ⠀⠀⠀⠀⠀⠀⠀⠈⠻⠿⠿⣿⣿⣿⣿⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
--         \' ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣽⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
--         \]
