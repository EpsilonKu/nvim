local M = {}

function M.build()
	local term = require("FTerm.terminal")
	local springTerm = term:new():setup({
		cmd = "./mvnw spring-boot:run",
		dimensions = {
			height = 0.8,
			width = 0.8
		}
	})
	springTerm:toggle()
end

local function jdtls_on_attach()
	require('jdtls.setup').add_commands ()
	require('jdtls').setup_dap({hotcodereplace = 'auto'})
	require('jdtls.dap').setup_dap_main_class_configs()
end

local function jdtls_start()
	-- find_root looks for parent directories relative to the current buffer containing one of the given arguments.
	local config = {}
	config.init_options = {
		bundles = {
			vim.fn.glob("$HOME/.config/nvim/etc/dependencies/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.32.0.jar")
		}
	}
	config.cmd = {'java-lsp.sh'}
	config.root_dir = require('jdtls.setup').find_root({'gradle.build', 'pom.xml'})
	config.on_attach = jdtls_on_attach
	require ('jdtls').start_or_attach (config)
end

function M.init()
	local wk = require("which-key")

	wk.register({
		["<leader>j"] = {
			name = "+Java",
			b = { "<CMD>lua require('filetype._java').build()<CR>", "  Java Build Spring" },
			d = { ":lua require'dap'.continue()<CR>", "  Java Debug Run"}
		}
	})


-- 	command! -buffer JdtCompile lua require('jdtls').compile()
-- command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()
-- command! -buffer JdtJol lua require('jdtls').jol()
-- command! -buffer JdtBytecode lua require('jdtls').javap()
-- command! -buffer JdtJshell lua require('jdtls').jshell()

	jdtls_start()
end


return M

