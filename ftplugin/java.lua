
local M = {}

function M.build()
    local term = require("FTerm.terminal")
    local springTerm =
        term:new():setup(
        {
            cmd = "./mvnw spring-boot:run",
            dimensions = {
                height = 0.8,
                width = 0.8
            }
        }
    )
    springTerm:toggle()
end

-- local function jdtls_on_attach()
--     require("jdtls.setup").add_commands()
--     require("jdtls").setup_dap()
--     require("jdtls.dap").setup_dap_main_class_configs()
--     require("lsp_signature").on_attach(
--         {
--             bind = true, -- This is mandatory, otherwise border config won't get registered.
--             handler_opts = {
--                 border = "single"
--             }
--         }
--     )
-- end

    local wk = require("which-key")

    wk.register(
        {
            ["<leader>j"] = {
                name = "+Java",
                b = {"<CMD>lua require('filetype._java').build()<CR>", "  Java Build Spring"},
                d = {":lua require'dap'.continue()<CR>", "  Java Debug Run"}
            }
        }
    )
    wk.register(
        {
            ["<leader>j"] = {
                name = "+Java",
                b = {"<CMD>lua require('filetype._java').build()<CR>", "  Java Build Spring"},
                d = {":lua require'dap'.continue()<CR>", "  Java Debug Run"}
            }
        },
        {
            mode = "v"
        }
    )

    local config = {}
    local home = os.getenv("HOME")
    local workspace_folder = home .. "/.workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
    local bundles = {
        vim.fn.glob(home .. "/.local/bin/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"),
		vim.fn.glob(home .. "/.local/bin/vscode-java-decompiler/server/*.jar")
    }

    -- config.init_options = {
    --     bundles = bundles,
    --     settings = {
    --         java = {
    --             signatureHelp = {enabled = true},
    --             contentProvider = {preferred = "fernflower"}
    --         }
    --     },
    -- }
    config.cmd = {
 		'/usr/lib/jvm/java-11-openjdk/bin/java',
 		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
    	'-Dosgi.bundles.defaultStartLevel=4',
		'-Declipse.product=org.eclipse.jdt.ls.core.product',
  		'-Dlog.protocol=true',
		'-Dlog.level=ALL',
		'-Xmx1G',
  		'-Xmx2G',
		'-jar' , vim.fn.glob(home .. "/.local/bin/plugins/org.eclipse.equinox.launcher_*.jar"),
		'-configuration', vim.fn.glob( home .. "/.local/bin/config_linux"),
		'-data' , workspace_folder,
		'--add-modules=ALL-SYSTEM',
		'--add-opens java.base/java.util=ALL-UNNAMED',
		'--add-opens java.base/java.lang=ALL-UNNAMED'
	}
		-- '-jar ' .. vim.fn.glob(home .. "/.local/bin/plugins/org.eclipse.equinox.launcher_*.jar"),
  --add-modules=ALL-SYSTEM \
  --add-opens java.base/java.util=ALL-UNNAMED \
  --add-opens java.base/java.lang=ALL-UNNAMED
    config.root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'})
    -- config.on_attach = jdtls_on_attach
    require("jdtls").start_or_attach(config)