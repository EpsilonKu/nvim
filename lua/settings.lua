local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

-- {{{ Global Map
-- U.map ("n", "<Esc>", ":lua ListView.close()<CR>")
-- }}}

vim.cmd [[
 au! TabNewEntered * Alpha 
]]
-- vim.cmd [[
-- autocmd BufNewFile *.java call InsertJavaPackage()
-- function! InsertJavaPackage()
--
--   let dir = getcwd()
--   let dir = substitute(dir, "^.*\/com\/", "com/", "")
--   let dir = substitute(dir, "\/", ".", "g")
--   let dir = "package " . dir . ";"
--   let result = append(0, "")
--   let result = append(1, dir)
--   let filename = expand("%")
--   let filename = substitute(filename, "\.java", "", "")
--   let result = append(2, "")
--   let result = append(3, "class " . filename . " {")
--   let result = append(4, "}")
-- endfunction TODO: make auto fill on new java file
-- ]]

local indent = 4
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.g.neovide_refresh_rate=60
-- vim.g.neovide_fullscreen=true
vim.g.neovide_window_floating_opacity = 100
vim.g.neovide_floating_blur = 100
-- vim.g.neovide_remember_window_size = true
vim.g.neovide_cursor_antialiasing=true
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
opt('o', 'timeoutlen', 500)
opt('o', 'encoding', 'UTF-8')
opt('o', 'clipboard', 'unnamedplus')
opt('o', 'pastetoggle', '<F10>')
opt('w', 'list', true)                                -- Show some invisible characters (tabs...)
opt('w', 'number', true)                              -- Print line number
opt('w', 'relativenumber', true)                      -- Relative line numbers

