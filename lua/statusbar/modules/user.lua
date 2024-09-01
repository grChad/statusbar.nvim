local txt = require('statusbar.utils').txt
local button = require('statusbar.utils').button
local selectTable = require('statusbar.utils').selectTable
local selectStr = require('statusbar.utils').selectStr
local selectBool = require('statusbar.utils').selectBool
local user_default = require('statusbar.constants').opts_default.user
local hl = require('statusbar.constants').hl_groups

--------------------------------- [ btn onclick function ] ---------------------------
vim.cmd([[
   function! ShowUser(a,b,c,d)
      lua require('statusbar.function_btn').showUser()
   endfunction
]])

------------------------------------ [ functions ] ------------------------------------
---@param user GrConfigUser
---@return string
return function(user)
	user = selectTable(user, user_default)

	local enabled, icon, name
	enabled = selectBool(user.enabled, user_default.enabled)
	icon = selectStr(user.icon, user_default.icon)
	name = selectStr(user.name, user_default.name)

	if not enabled then
		return ''
	end

	local icon_os = txt(hl.userIcon, icon)
	local user_name = txt(hl.text, name)

	---@type string
	local str
	if vim.g.s_show_user then
		str = icon_os .. user_name
	else
		str = icon_os
	end

	return button(str, 'ShowUser') .. ' '
end
