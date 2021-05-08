local M = {}

function M.config()
	local U = require "utils"
	local g = vim.g

	
--	Move to previous/next
	U.map ("n", "<C-a>", ":BufferNext <CR>")
	U.map ("n", "<C-s>", ":BufferPrevious <CR>")
	
--	Re-order to previous/next
	U.map ("n", "<C-<>",":BufferMovePrevious <CR>")
	U.map ("n", "<C->>",":BufferMoveNext <CR>")

--	Goto buffer in position...
	U.map ("n", "<C-1>",":BufferGoto 1<CR>")
	U.map ("n", "<C-2>",":BufferGoto 2<CR>")
	U.map ("n", "<C-3>",":BufferGoto 3<CR>")
	U.map ("n", "<C-4>",":BufferGoto 4<CR>")
	U.map ("n", "<C-5>",":BufferGoto 5<CR>")
	U.map ("n", "<C-6>",":BufferGoto 6<CR>")
	U.map ("n", "<C-7>",":BufferGoto 7<CR>")
	U.map ("n", "<C-8>",":BufferGoto 8<CR>")
	U.map ("n", "<C-9>",":BufferLast <CR>")

--	Close buffer
	U.map ("n", "<C-F4>",":BufferClose <CR>")
--	Wipeout buffer
--                         :BufferWipeout<CR>
--	Close commands
	U.map ("n", "<C-S-F4>",":BufferCloseAllButCurrent <CR>")

-- Magic buffer-picking mode
--nnoremap <silent> <C-s>    :BufferPick<CR>
--	Sort automatically by...
--nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
--nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>

end 
return M
