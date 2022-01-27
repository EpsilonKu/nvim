local M = {}
local luv = vim.loop

function M.config()
	vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
	vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
	vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
	vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
	vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
	vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
	vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
	vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
	
	local jdtls_ui = require'jdtls.ui'
	function jdtls_ui.pick_one_async(items, _, _, cb)
		require'lsputil.codeAction'.code_action_handler(nil, nil, items, nil, nil, nil, cb)
	end
end

function M.file_readable(path)
  local fd = luv.fs_open(path, "r", 438)
  if fd then
    luv.fs_close(fd)
    return true
  end

  return false
end
function M.get_local_settings()
  if local_settings then return local_settings end

  if M.file_readable(".vim/lsp-settings.lua") then
    local code_chunk = loadfile(".vim/lsp-settings.lua")
    if code_chunk then
      local_settings = code_chunk()
    end
  else
    local_settings = {}
  end

  return local_settings
end


return M

