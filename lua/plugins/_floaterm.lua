local U = require "utils"

vim.g.floaterm_keymap_toggle = "<F1>"
vim.g.floaterm_keymap_kill = "<F2>"

U.map ("","<F6>",":cd %:p:h<CR>:w <bar> :FloatermNew --height=0.7 --width=0.7 --wintype=floating --name=Application --autoclose=0 g++ -std=c++17 -O2 -Wall % -o %:r && ./%:r<CR>")

