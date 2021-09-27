
local g = vim.g
local fn = vim.fn
local api = vim.api
local cmp = require("cmp")

-- local function t(str)
--     return api.nvim_replace_termcodes(str, true, true, true)
-- end

-- local function check_back_space()
--     local col = fn.col(".") - 1
--     return col == 0 or fn.getline("."):sub(col, col):match("%s") ~= nil
-- end

-- local function __tab(fallback)
--     if fn.pumvisible() == 1 then
--         fn.feedkeys(t("<C-n>"), "n")
--     elseif check_back_space() then
--         fn.feedkeys(t("<tab>"), "n")
--     else
--         fallback()
--     end
-- end
-- 
-- local function __shift_tab(fallback)
--     if fn.pumvisible() == 1 then
--         fn.feedkeys(t("<C-p>"), "n")
--     else
--         fallback()
--     end
-- end
require("nvim-autopairs").setup {
    disable_filetype = {"TelescopePrompt", "guihua", "clap_input"},
    autopairs = {enable = true},
    check_ts = false
}

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
    }
}

-- you need setup cmp first put this after cmp.setup()
require("nvim-autopairs.completion.cmp").setup(
    {
        map_cr = true, --  map <CR> on insert mode
        map_complete = true, -- it will auto insert `(` after select function or method item
        auto_select = true -- automatically select the first item
    }
)
