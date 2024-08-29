local icons_ia = require('statusbar.constants').icons.ia
local txt = require('statusbar.utils').txt
local button = require('statusbar.utils').button
local space = require('statusbar.utils').space()
local hl = require('statusbar.constants').hl_groups
local validate = require('statusbar.utils').validate
local default_ia = require('statusbar.constants').opts_default.ia

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

---@param opt_ia GrConfigIa
M.supermaven = function(opt_ia)
	local enabled, icon

	if validate.isTable(opt_ia) then
		if validate.isTable(opt_ia.supermaven) then
			enabled = validate.bool(opt_ia.supermaven.enabled, default_ia.supermaven.enabled)
			icon = validate.str(opt_ia.supermaven.icon, default_ia.supermaven.icon)
		else
			enabled = default_ia.supermaven.enabled
			icon = default_ia.supermaven.icon
		end
	else
		enabled = default_ia.supermaven.enabled
		icon = default_ia.supermaven.icon
	end

	local status_ok, api = pcall(require, 'supermaven-nvim.api')
	if not status_ok or enabled == false then
		return ''
	end

	local showIcon

	if api.is_running() then
		showIcon = txt(hl.supermaven, icon)
	else
		showIcon = txt(hl.subText, icon)
	end

	return space .. button(showIcon, 'ToggleSupermaven')
end

---@param opt_ia GrConfigIa
M.codeium = function(opt_ia)
	local enabled, icon

	if validate.isTable(opt_ia) then
		if validate.isTable(opt_ia.codeium) then
			enabled = validate.bool(opt_ia.codeium.enabled, default_ia.codeium.enabled)
			icon = validate.str(opt_ia.codeium.icon, default_ia.codeium.icon)
		else
			enabled = default_ia.codeium.enabled
			icon = default_ia.codeium.icon
		end
	else
		enabled = default_ia.codeium.enabled
		icon = default_ia.codeium.icon
	end

	local status_ok, codeium = pcall(function()
		return vim.api.nvim_call_function('codeium#GetStatusString', {})
	end)
	if not status_ok or enabled == false then
		return ''
	end

	local showIcon

	if codeium == 'OFF' then
		showIcon = txt(hl.subText, icon)
	else
		showIcon = txt(hl.codeium, icon)
	end
	return space .. button(showIcon, 'ToggleCodeium')
end

return M
