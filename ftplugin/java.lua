
local function jdtls_on_attach()
    require("jdtls.setup").add_commands()
    require("jdtls").setup_dap()
    require("jdtls.dap").setup_dap_main_class_configs()
    require("lsp_signature").on_attach(
        {
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            handler_opts = {
                border = "single"
            }
        }
    )
end

local wk = require("which-key")

local config = {}
local home = os.getenv("HOME")
local workspace_folder = home .. "/.workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
local bundles = {
    vim.fn.glob(
        home .. "/.local/bin/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"
    )
}
local settings =
	{
        java = {
            contentProvider = {
                preferred = "fernflower"
            },
			project = {
        		referencedLibraries = { 'libs/*.jar' },
      		},
        },
    }

config.init_options = {
    bundles = bundles,
}
config.settings = settings
config.cmd = {
    "/usr/lib/jvm/java-11-openjdk/bin/java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1G",
    "-Xmx2G",
    "-jar",
    "-javaagent:" .. home .. "/.local/bin/lombok.jar",
    vim.fn.glob(home .. "/.local/bin/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
    "-configuration",
    vim.fn.glob(home .. "/.local/bin/jdtls/config_linux"),
    "-data",
    workspace_folder,
    "--add-modules=ALL-SYSTEM",
    "--add-opens java.base/java.util=ALL-UNNAMED",
    "--add-opens java.base/java.lang=ALL-UNNAMED"
}
config.root_dir = require("jdtls.setup").find_root({".git", "mvnw", "gradlew", "pom.xml"})
config.on_attach = jdtls_on_attach
config.filetype = {"java"}
require("jdtls").start_or_attach(config)
