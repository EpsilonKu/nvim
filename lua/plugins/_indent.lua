
local M = {}

function M.config()
vim.g.indent_blankline_char = '|'
vim.g.indent_blankline_space_char = '.'
vim.g.indent_blankline_filetype_exclude = {'help', 'md'}
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_context_patterns = {'class', 'function', 'method', 'if',  'else', 'for', 'while', 'public', 'private'}
vim.g.indent_blankline_filetype_exclude = {'help', 'chadtree', 'startify', 'fzf', 'tagbar', 'dashboard', 'packer'}
vim.g.indent_blankline_buftype_exclude = {'terminal'}
end

return M

