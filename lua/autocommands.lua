local au = require("au")
local api = vim.api
local cmd = api.nvim_command


au.augroup(
    "MyFileTypes",
    {
        {
            event = "BufNewFile,BufRead",
            pattern = ".eslintrc,.prettierrc,.tsconfig.json",
            callback = function()
                vim.bo.filetype = "json"
            end
        },
        {
            event = "BufNewFile,BufRead",
            pattern = ".eslintignore,.prettierignore ",
            callback = function()
                vim.bo.filetype = "conf"
            end
        },
        {
            event = "BufNewFile,BufRead",
            pattern = "*.java",
            callback = function()
				require("plugins._lsp").start_jdtls
            end
        }
    }
)

