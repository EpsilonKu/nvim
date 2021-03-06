local M = {}

function M.config()
  require("formatter").setup(
    {
      logging = false,
      filetype = {
        javascript = {
          -- prettier
          function()
            return {
              exe = "prettier",
              args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
              stdin = true
            }
          end
        },
        lua = {
          -- luafmt
          function()
            return {
              exe = "luafmt",
              args = {"--indent-count", 2, "--stdin"},
              stdin = true
            }
          end
        },
        java = {
          function()
            return {
              exe = "google-java-format",
              args = { vim.api.nvim_buf_get_name(0)},
              stdin = true
            }
          end
        }
        -- html = {
        -- 	function ()
        -- 		return {
        -- 			exe - "tidy",
        -- 			args = {""},
        -- 			stdin = true
        -- 		}
        -- }
      }
    }
  )
end

return M
