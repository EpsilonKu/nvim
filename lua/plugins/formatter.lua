local M = {}

function M.config()
	-- vim.g.neoformat_javascript_prettier = {
	--         exe = "prettier",
	--         args = {"--print-width","80", "--tab-width","4", "--use-tabs", "--semi"},
	-- }
	vim.g.neoformat_enabled_java = { "astyle" }
	vim.g.neoformat_enabled_javascript = { "prettier" }
	vim.g.neoformat_enabled_html = { "prettier" }
	vim.g.neoformat_basic_format_retab = 1


end

return M
