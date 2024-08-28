local icon_directory = require('statusbar.icons').others.directory
local hl = require('statusbar.hl_groups')
local txt = require('statusbar.utils').txt
local widthPercentBelow = require('statusbar.utils').widthPercentBelow
local button = require('statusbar.utils').button

--------------------------------- [ btn onclick function ] ---------------------------
vim.cmd([[
   function! ShowCwd(a,b,c,d)
      lua require('statusbar.function_btn').showCwd()
   endfunction
]])

------------------------------------ [ functions ] ------------------------------------
local iconCwd = function()
	local icon = icon_directory
	local str = txt(hl.cwdIcon, icon)

	return str
end

local cwd = function()
	local cwd = vim.fn.getcwd(0)
	cwd = vim.fn.fnamemodify(cwd, ':~')

	if not widthPercentBelow(#cwd, 0.25) then
		cwd = vim.fn.pathshorten(cwd)
	end

	local trail = cwd:sub(-1) == '/' and cwd or cwd .. '/'

	return txt(hl.text, trail)
end

return function()
	---@type string
	local str

	if vim.g.s_show_cwd then
		str = iconCwd() .. cwd()
	else
		str = iconCwd()
	end
	return button(str, 'ShowCwd') .. ' '
end
