local util = require('tabby.util')
local hl_tabline = util.extract_nvim_hl('TabLine')
local hl_normal = util.extract_nvim_hl('Normal')
local hl_tabline_sel = util.extract_nvim_hl('TabLineSel')
local active_tab_hl = { fg = hl_normal.fg, bg = hl_normal.bg, style = 'bold' }
local inactive_tab_hl = { fg = hl_tabline.fg, bg = hl_tabline.bg }

local function fileIcon()
	return '  ' .. require ('nvim-web-devicons').get_icon(vim.fn.expand('%:t'), vim.fn.expand('%:e'), {default = true}) .. '  '
end

----
local function tab_label(tabid, active)
  local icon = active and '' or ''
  local number = vim.api.nvim_tabpage_get_number(tabid)
  local name = util.get_tab_name(tabid)
  return string.format(' %s %d: %s ', icon, number, name)
end

local function tab_label_no_fallback(tabid, active)
  local icon = active and '' or ''
  local fallback = function()
    return ''
  end
  local number = vim.api.nvim_tabpage_get_number(tabid)
  local name = util.get_tab_name(tabid, fallback)
  if name == '' then
    return string.format(' %s %d ', icon, number)
  end
  return string.format(' %s %d: %s ', icon, number, name)
end

local function win_label(winid, top)
  local icon = top and '' or ''
  local fname = require("tabby.filename").tail(winid)
  local extension = vim.fn.fnamemodify(fname, ':e')
  local fileIcon = require'nvim-web-devicons'.get_icon(filename, extension)
  local buid = vim.api.nvim_win_get_buf(winid)
  local is_modified = vim.api.nvim_buf_get_option(buid, 'modified')
  local modifiedIcon = is_modified and '' or ''
  return string.format(' %s  %s %s %s', icon, fileIcon, filename.unique(winid), modifiedIcon)
end

local function buffer_render (bufid, is_current)
	local buftype = vim.bo[bufid].buftype
	local modified = vim.bo[bufid].modified
	local modified_icon = modified and '' or ' '
	local path = vim.fn.bufname(bufid);
	local extension = vim.fn.fnamemodify(path, ":e")
	local filename = vim.fn.fnamemodify(path, ":t")
	local fileicon = require'nvim-web-devicons'.get_icon (filename, extension, { default = true})
	local buf_name = ' ' .. fileicon .. ' ' .. filename ..' ' .. modified_icon .. ' '
	local buf_color = is_current and active_tab_hl or inactive_tab_hl
	return {
		type = 'text',
		text = {
			string.format(' %s ', buf_name) ,
				hl = buf_color,
			}
	}
end
----

local function gitBranch()
	local cmd = io.popen('git branch --show-current 2> /dev/null')
	local branch = cmd:read("*l") or cmd:read("*a")
	cmd:close()

	if branch ~= "" then
		return '  ' .. branch .. ' '
	else
		return ''
	end
end

local components = function()
	local coms = {
		{
			type = 'text',
			text = {
				fileIcon,
				hl = { fg = hl_tabline_sel.fg, bg = hl_tabline_sel.bg, style = 'bold' },
			},
		},
		{
			type = 'text',
			text = {
				' ',
				hl = 'TabLineFill'
			}
		},
	}
	local tabs = vim.api.nvim_list_tabpages()
	local current_tab = vim.api.nvim_get_current_tabpage()
	for _, tabid in ipairs(tabs) do
		if tabid == current_tab then
			table.insert(coms, {
				type = 'tab',
				tabid = tabid,
				label = {
					'  ' .. vim.api.nvim_tabpage_get_number(tabid) .. '  ',
					hl = active_tab_hl
				},
			})
		end
		if tabid ~= current_tab then
			table.insert(coms, {
				type = 'tab',
				tabid = tabid,
				label = {
					'  ' .. vim.api.nvim_tabpage_get_number(tabid) .. '  ',
					hl = inactive_tab_hl
				},
			})
		end
	end
	table.insert(coms,
		{
			type = 'text',
			text = {
				' ',
				hl = 'TabLineFill'
			}
		}
	)
	table.insert(coms, { type = 'spring' } )
	local cur_bufid = vim.api.nvim_get_current_buf()
	for _, bufid in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_valid(bufid) and vim.bo[bufid].buflisted then
			-- local buf_name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufid), ':~:.')
			local is_current = false;
			if bufid == cur_bufid then
				is_current = true
			end
			local buf_render = buffer_render (bufid,is_current)
			-- local focus_win = vim.api.nvim_tabpage_get_win(tabid)
			-- local filename = require("tabby.filename").tail(focus_win)
			-- local extension =  vim.fn.fnamemodify(name, ':t')
			-- local icon = require'nvim-web-devicons'.get_icon(filename, extension)
			-- print (extension)
				table.insert(coms, buf_render)
			table.insert(coms,
				{
					type = 'text',
					text = {
						' ',
						hl = 'TabLineFill'
					}
				}
			)
		end
	end
	table.insert(coms,
		{
			type = 'text',
			text = {
				gitBranch,
				hl = { fg = hl_tabline_sel.fg, bg = hl_tabline_sel.bg, style = 'bold' },
			},
		}
	)
	return coms
end

require('tabby').setup{
	components = components,
}


