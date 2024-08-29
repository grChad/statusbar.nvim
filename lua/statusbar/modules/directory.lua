local icon_directory = require('statusbar.constants').icons.others.directory
local hl = require('statusbar.constants').hl_groups
local txt = require('statusbar.utils').txt
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

local widthCwdBelow = function(cwd)
	---@type integer
	local winwidth
	if vim.o.laststatus == 3 then
		winwidth = vim.o.columns
	else
		winwidth = vim.api.nvim_win_get_width(0)
	end

	local is_width = #cwd / winwidth <= 0.25
	if not is_width then
		cwd = vim.fn.pathshorten(cwd)
	end

	return txt(hl.text, cwd)
end

return function()
	local multiple = 3
	local status_cwd = vim.g.s_status_cwd % multiple

	---@type string
	local str
	if status_cwd == 0 then
		str = iconCwd()
	else
		if status_cwd == 1 then
			local cwd = vim.fn.fnamemodify(vim.fn.getcwd(0), ':t')
			str = iconCwd() .. widthCwdBelow(cwd)
		elseif status_cwd == 2 then
			local cwd = vim.fn.fnamemodify(vim.fn.getcwd(0), ':~')
			str = iconCwd() .. widthCwdBelow(cwd)
		end
	end

	return button(str, 'ShowCwd')
end
