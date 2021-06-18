
local M = {}

function M.config()
vim.g.indent_blankline_char = ''
vim.g.indent_blankline_space_char = '.'
vim.g.indent_blankline_enabled = true
vim.g.indent_blankline_filetype_exclude = {'help', 'md'}
vim.g.indent_blankline_char_highlight_list = {'Error', 'Function'}
end

return M

