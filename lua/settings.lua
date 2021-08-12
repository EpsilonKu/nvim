local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

-- {{{ Global Map
local U = require "utils"
U.map ("n", "d", '"_d')
U.map ("v", "d", '"_d')
U.map ("n", "x", '"_x')
U.map ("v", "x", '"_x')
U.map ("n", ";", "l")
U.map ("n", "l", "k")
U.map ("n", "k", "j")
U.map ("n", "j", "h")
U.map ("v", ";", "l")
U.map ("v", "l", "k")
U.map ("v", "k", "j")
U.map ("v", "j", "h")
-- }}}

vim.cmd(([[
	set autoindent smartindent
]]))

local indent = 4
opt('b', 'shiftwidth', indent)                        -- Size of an indent
opt('b', 'smartindent', true)                         -- Insert indents automatically
opt('b', 'tabstop', indent)                           -- Number of spaces tabs count for
opt('o', 'hidden', true)                              -- Enable modified buffers in background
opt('o', 'ignorecase', true)                          -- Ignore case
opt('o', 'joinspaces', false)                         -- No double spaces with join after a dot
opt('o', 'scrolloff', 4 )                             -- Lines of context
opt('o', 'shiftround', true)                          -- Round indent
opt('o', 'sidescrolloff', 8 )                         -- Columns of context
opt('o', 'smartcase', true)                           -- Don't ignore case with capitals
opt('o', 'splitbelow', true)                          -- Put new windows below current
opt('o', 'splitright', true)                          -- Put new windows right of current
opt('o', 'termguicolors', true)                       -- True color support
opt('o', 'wildmode', 'list:longest')                  -- Command-line completion mode
opt('o', 'timeoutlen', 0)
opt('o', 'encoding', 'UTF-8')
opt('o', 'mouse', 'a')
opt('o', 'clipboard', 'unnamedplus')
opt('o', 'pastetoggle', '<F10>')
opt('w', 'list', true)                                -- Show some invisible characters (tabs...)
opt('w', 'listchars', 'eol:↴,tab:»·,trail:.,extends:>,precedes:<')
opt('w', 'number', true)                              -- Print line number
opt('w', 'relativenumber', true)                      -- Relative line numbers

