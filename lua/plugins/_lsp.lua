
local M = {}

function M.config()
	local g = vim.g
	require'lspconfig'.clangd.setup{}
		-- require('jdtls').start_or_attach({
		-- cmd = {'java-lsp.sh'}, 
		-- root_dir = require('jdtls.setup').find_root({'gradle.build', 'pom.xml'})
		-- })
	-- require'lspconfig'.java_language_server.setup{
	-- 	cmd = {"java-language-server"}
	-- }
	-- require'lspconfig'.jdtls.setup{}
	-- export JAR=/usr/share/java/jdtls/plugins/org.eclipse.equinox.launcher_1.6.100.v20201223-0822.jar
	-- export GRADLE_HOME=$HOME/gradle
	-- export JAVA_HOME=/usr/lib/jvm/java-11-openjdk/
	-- export JDTLS_CONFIG=/usr/share/java/jdtls/config_linux
	-- export WORKSPACE=$HOME/Projects/abay-academy/
	
end

return M

