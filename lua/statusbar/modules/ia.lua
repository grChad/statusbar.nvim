-- local icons_ia = require('statusbar.constants').icons.ia
local selectTable = require('statusbar.utils').selectTable
local selectStr = require('statusbar.utils').selectStr
local selectBool = require('statusbar.utils').selectBool
local txt = require('statusbar.utils').txt
local button = require('statusbar.utils').button
local space = require('statusbar.utils').space()
local hl = require('statusbar.constants').hl_groups
local trimAndPad = require('statusbar.utils').trimAndPad
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

---@param user_ia GrConfigIa
M.supermaven = function(user_ia)
	user_ia = selectTable(user_ia, default_ia)
	---@type GrConfigIaSupermaven
	local table_supermaven = selectTable(user_ia.supermaven, default_ia.supermaven)

	local enabled, icon
	enabled = selectBool(table_supermaven.enabled, default_ia.supermaven.enabled)
	icon = selectStr(table_supermaven.icon, default_ia.supermaven.icon)

	local status_ok, api = pcall(require, 'supermaven-nvim.api')
	if not status_ok or enabled == false then
		return ''
	end

	local showIcon

	if api.is_running() then
		showIcon = txt(hl.supermaven, trimAndPad(icon, 2))
	else
		showIcon = txt(hl.subText, trimAndPad(icon, 2))
	end

	return space .. button(showIcon, 'ToggleSupermaven')
end

---@param user_ia GrConfigIa
M.codeium = function(user_ia)
	user_ia = selectTable(user_ia, default_ia)
	---@type GrConfigIaCodeium
	local table_codeium = selectTable(user_ia.codeium, default_ia.codeium)

	local enabled, icon
	enabled = selectBool(table_codeium.enabled, default_ia.codeium.enabled)
	icon = selectStr(table_codeium.icon, default_ia.codeium.icon)

	local status_ok, codeium = pcall(function()
		return vim.api.nvim_call_function('codeium#GetStatusString', {})
	end)
	if not status_ok or enabled == false then
		return ''
	end

	local showIcon

	if codeium == 'OFF' then
		showIcon = txt(hl.subText, trimAndPad(icon, 2))
	else
		showIcon = txt(hl.codeium, trimAndPad(icon, 2))
	end
	return space .. button(showIcon, 'ToggleCodeium')
end

return M
