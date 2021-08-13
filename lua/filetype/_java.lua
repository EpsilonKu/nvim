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
	require('jdtls').setup_dap()
	require('jdtls.dap').setup_dap_main_class_configs()
	require ('lsp_signature').on_attach({
		bind = true, -- This is mandatory, otherwise border config won't get registered.
      	handler_opts = {
        	border = "single"
      	}
	})  
end

local function jdtls_start()
	-- find_root looks for parent directories relative to the current buffer containing one of the given arguments.
	local config = {}
	local home = os.getenv('HOME')
	local workspace_folder = home .. "/.workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
	local bundles = {
			vim.fn.glob("~/.local/bin/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"),
		}

	vim.list_extend(bundles, vim.split(vim.fn.glob(home .. "/.local/bin/vscode-java-decompiler/server/*.jar"), "\n"))
	config.init_options = {
		bundles = bundles,
		settings = {
			java = {
      signatureHelp = { enabled = true };
      contentProvider = { preferred = 'fernflower' };
    }

		}
		}
	config.cmd = {'jdtls.sh', workspace}
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
		},
		["<leader>c"] = {
			name = "+Code Action",
			c = {":lua require('jdtls').code_action()<CR>", " Code action"},
			r = {":lua require('jdtls').code_action(false, 'refactor')<CR>", " Code refactor"},
			i = {":lua require'jdtls'.organize_imports()<CR>", " Organize imports"},
			m = {":lua require('jdtls').extract_method(true)<CR>", "Organize methods"}
		},
		["["] = {
			name = "+Actions",
			d = {"<cmd>lua vim.lsp.buf.definition()<CR>", "Goto definition"},
			u = {"<cmd>lua vim.lsp.buf.declaration()<CR>", "Goto declarations"},
			i = {"<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto implementation"},
			t = {"<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type definition"},
			r = {"<cmd>lua vim.lsp.buf.rename()<CR>", "Type rename"},
			e = {"<cmd>lua vim.lsp.buf.references()<CR>", "References"},
			s = {"<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "Show diagnostic"},
			f = {":lua vim.lsp.buf.formatting()<CR>", "Format code with lsp"}
			}
	})
	wk.register({
		["<leader>j"] = {
			name = "+Java",
			b = { "<CMD>lua require('filetype._java').build()<CR>", "  Java Build Spring" },
			d = { ":lua require'dap'.continue()<CR>", "  Java Debug Run"}
		},
		["<leader>c"] = {
			name = "+Code Action",
			c = {"<Esc><Cmd>lua require('jdtls').code_action(true)<CR>", " Code action"},
			i = {":lua require'jdtls'.organize_imports()<CR>", " Organize imports"},
			m = {":lua require('jdtls').extract_method(true)<CR>", "Organize methods"}
		}
	},
	{
		mode = "v"
	})

--	command! -buffer JdtCompile lua require('jdtls').compile()
-- command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()
-- command! -buffer JdtJol lua require('jdtls').jol()
-- command! -buffer JdtBytecode lua require('jdtls').javap()
-- command! -buffer JdtJshell lua require('jdtls').jshell()

	jdtls_start()
end


return M

