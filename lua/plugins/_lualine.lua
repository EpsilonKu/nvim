local M = {}

function M.config()
    local gps = require("nvim-gps")
    gps.setup(
        {
            icons = {
                ["class-name"] = " ", -- Classes and class-like objects
                ["function-name"] = " ", -- Functions
                ["method-name"] = " " -- Methods (functions inside class-like objects)
            },
            languages = {
                -- You can disable any language individually here
                ["c"] = true,
                ["cpp"] = true,
                ["java"] = true,
                ["javascript"] = true,
                ["lua"] = true
            },
            separator = "  "
        }
    )
	local lsp_status = require('lsp-status');
	local config = {
    	indicator_errors = '',
   		indicator_warnings = '',
   		indicator_info = 'i',
    	indicator_hint = '?',
    	indicator_ok = '',
		status_symbol = ''
	};
	-- config.capabilities = vim.tbl_extend('keep', config.capabilities or {}, lsp_status.capabilities)
	lsp_status.config(config);
    require("lualine").setup {
        options = {theme = "material"},
        sections = {
            lualine_a = {"mode"},
            lualine_b = {"filename"},
            lualine_c = {
                {gps.get_location, condition = gps.is_available}
            },
            lualine_x = {"filetype"},
            lualine_y = {lsp_status.status},
            lualine_z = {"location"}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {}
        },
    }
end

return M
