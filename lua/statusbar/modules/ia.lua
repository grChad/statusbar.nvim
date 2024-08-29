local icons_ia = require('statusbar.constants').icons.ia
local txt = require('statusbar.utils').txt
local button = require('statusbar.utils').button
local hl = require('statusbar.constants').hl_groups

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
		showIcon = txt(hl.supermaven, icons_ia.supermaven)
	else
		showIcon = txt(hl.subText, icons_ia.supermaven)
	end

	return button(showIcon, 'ToggleSupermaven')
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
		showIcon = txt(hl.subText, icons_ia.codeium)
	else
		showIcon = txt(hl.codeium, icons_ia.codeium)
	end
	return button(showIcon, 'ToggleCodeium')
end

return M
