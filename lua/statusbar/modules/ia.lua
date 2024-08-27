local icons = require('statusbar.icons')
local separator = require('statusbar.utils').separator()
local txt = require('statusbar.utils').txt
local button = require('statusbar.utils').button
local hl = require('statusbar.hl_groups')

--------------------------------- [ btn onclick function ] ---------------------------
vim.cmd([[
   function! ToggleSupermaven(a,b,c,d)
      lua require('statusbar.function_btn').supermaven()
   endfunction
]])

vim.cmd([[
   function! ToggleCodeium(a,b,c,d)
      lua require('statusbar.function_btn').codeium()
   endfunction
]])

------------------------------------ [ functions ] ------------------------------------
local M = {}

M.supermaven = function()
	local status_ok, api = pcall(require, 'supermaven-nvim.api')
	if not status_ok then
		return ''
	end

	local showIcon

	if api.is_running() then
		showIcon = txt(hl.supermaven, icons.ia.supermaven)
	else
		showIcon = txt(hl.fileSize, icons.ia.supermaven)
	end
	local str = button(showIcon, 'ToggleSupermaven')

	return separator .. str
end

M.codeium = function()
	local status_ok, codeium = pcall(function()
		return vim.api.nvim_call_function('codeium#GetStatusString', {})
	end)
	if not status_ok then
		return ''
	end

	local showIcon

	if codeium == 'OFF' then
		showIcon = txt(hl.fileSize, icons.ia.codeium)
	else
		showIcon = txt(hl.codeium, icons.ia.codeium)
	end
	local str = button(showIcon, 'ToggleCodeium')

	return separator .. str
end

return M
