-- local function pre_save()
-- 	
-- end
vim.o.sessionoptions =
    "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
require('auto-session').setup {
    log_level = 'info',
    auto_save_enabled = true,
	-- pre_save_cmds = { "br"},
    auto_session_suppress_dirs = {'~/', '~/Projects'}
}
