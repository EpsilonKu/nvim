
local M = {}

function M.config()
	local g = vim.g
	require("trouble").setup {
		auto_open = false, -- automatically open the list when you have diagnostics
		auto_preview = false, -- automatyically preview the location of the diagnostic. <esc> to close preview and go back to last window
		auto_fold = false, -- automatically fold a file trouble list at creation
		auto_close = false,
	}

	-- Lua
	-- vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",
	-- 	{silent = true, noremap = true}
	-- )
	-- vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>",
	-- 	{silent = true, noremap = true}
	-- )
	-- vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>",
	-- 	{silent = true, noremap = true}
	-- )
	-- vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
	-- 	{silent = true, noremap = true}
	-- )
	-- vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
	-- 	{silent = true, noremap = true}
	-- )
	-- vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",
	-- 	{silent = true, noremap = true}
	-- )
end

return M

