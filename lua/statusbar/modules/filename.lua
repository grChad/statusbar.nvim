local icons = require('statusbar.icons')
local hl = require('statusbar.hl_groups')
local txt = require('statusbar.utils').txt
local button = require('statusbar.utils').button

--------------------------------- [ btn onclick function ] ---------------------------
vim.cmd([[
   function! ToggleFileName(a,b,c,d)
      lua require('statusbar.function_btn').toggle_file_name()
   endfunction
]])

------------------------------------ [ functions ] ------------------------------------
---@param fsize integer
local format = function(fsize)
	-- stackoverflow, compute human readable file size
	local suffix = { 'b', 'k', 'M', 'G', 'T', 'P', 'E' }

	fsize = (fsize < 0 and 0) or fsize

	if fsize < 1024 then
		return fsize .. suffix[1]
	end

	local i = math.floor((math.log(fsize) / math.log(1024)))

	return string.format('%.2g%s', fsize / math.pow(1024, i), suffix[i + 1])
end

local file_size = function()
	local icon = icons.separator.arrow.right

	local fname = vim.api.nvim_buf_get_name(0)
	local fsize = vim.fn.getfsize(fname)
	local str = string.format('%s', format(fsize))

	if fsize > 0 then
		return txt(hl.fileSize, icon .. str)
	end

	return ''
end

local file_icon = function()
	local fileIcon = icons.others.empty
	local fileIconColor = '#A6D189'
	local background = '#292C3C'
	local filename = (vim.fn.expand('%') == '' and 'Empty ') or vim.fn.expand('%:t')
	local extension = vim.fn.expand('%:e')

	if filename ~= 'Empty ' then
		local ok_devicons, devicons = pcall(require, 'nvim-web-devicons')

		if ok_devicons then
			local deviIcon, deviColor = devicons.get_icon_color(filename, extension)

			fileIcon = (deviIcon ~= nil and deviIcon) or ''
			fileIconColor = deviColor
		end
	end

	vim.api.nvim_set_hl(0, hl.iconColor, { fg = fileIconColor, bg = background })

	return txt(hl.iconColor, ' ' .. fileIcon .. ' ')
end

return function()
	local fileName = (vim.fn.expand('%') == '' and 'Empty ') or vim.fn.expand('%:t')

	local str = txt(hl.fileName, fileName)

	---@type string
	local finalStr

	if vim.g.s_filename_is_active then
		finalStr = file_icon() .. str .. file_size()
	else
		finalStr = file_icon() .. str
	end

	return button(finalStr, 'ToggleFileName')
end
