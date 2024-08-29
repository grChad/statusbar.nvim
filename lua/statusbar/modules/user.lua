local user_default = require('statusbar.constants').opts_default.user
local validate = require('statusbar.utils').validate
local hl = require('statusbar.constants').hl_groups
local txt = require('statusbar.utils').txt
local button = require('statusbar.utils').button

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
	local enabled, icon, name

	if validate.isTable(user) then
		enabled = validate.bool(user.enabled, user_default.enabled)
		icon = validate.str(user.icon, user_default.icon)
		name = validate.str(user.name, user_default.name)
	else
		enabled = user_default.enabled
		icon = user_default.icon
		name = user_default.name
	end

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
