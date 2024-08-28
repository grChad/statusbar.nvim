local icons = require('statusbar.icons')
local hl = require('statusbar.hl_groups')
local txt = require('statusbar.utils').txt
local button = require('statusbar.utils').button

--------------------------------- [ btn onclick function ] ---------------------------
vim.cmd([[
   function! ShowUser(a,b,c,d)
      lua require('statusbar.function_btn').showUser()
   endfunction
]])

------------------------------------ [ functions ] ------------------------------------
local os_icons = {
	['fedora'] = txt(hl.fedora, icons.os.fedora),
	['debian'] = txt(hl.debian, icons.os.debian),
	['arch'] = txt(hl.arch, icons.os.arch),
	['ubuntu'] = txt(hl.ubuntu, icons.os.ubuntu),
	['manjaro'] = txt(hl.manjaro, icons.os.manjaro),
	['linuxmint'] = txt(hl.linuxMint, icons.os.mint),
	['pop'] = txt(hl.pop_os, icons.os.pop_os),
	['zorin'] = txt(hl.zorin, icons.os.zorin),
	['cereus'] = txt(hl.cereus, icons.os.cereus),

	-- icono por defecto para sistemas operativos no reconocidos
	['default'] = txt(hl.linux, icons.os.linux),
}

local getSystemName = function()
	local file = io.open('/etc/os-release', 'r')
	if not file then
		return nil
	end

	local content = file:read('*all')
	file:close()

	local nameId = content and content:match('ID=(%w+)')
	return nameId
end

local getNameUser = function()
	local user = os.getenv('USER') -- obtener el usuario del sistema

	if user ~= nil then
		return string.gsub(user, '^%l', string.upper)
	end

	return 'Linux'
end

return function()
	local system_name = getSystemName()
	local icon = os_icons[system_name] or os_icons['default']
	local user_name = '%#S_Text#' .. getNameUser()

	---@type string
	local str
	if vim.g.s_show_user then
		str = icon .. user_name
	else
		str = icon
	end

	return button(str, 'ShowUser') .. ' '
end
