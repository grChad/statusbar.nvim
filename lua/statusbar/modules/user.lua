local default = require('statusbar.constants').opts_default.user
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
---@param user GrConfigUser | nil
---@return string
return function(user)
	---@type GrConfigUser
	user = validate.table(user, default)

	local is_enabled = validate.bool(user.enabled, default.enabled)
	if is_enabled == false then
		return ''
	end

	local icon_os = txt(hl.userIcon, validate.str(user.icon, default.icon))
	local user_name = txt(hl.text, validate.str(user.name, default.name))

	---@type string
	local str
	if vim.g.s_show_user then
		str = icon_os .. user_name
	else
		str = icon_os
	end

	return button(str, 'ShowUser') .. ' '
end
