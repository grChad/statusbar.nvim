local M = {}
local icon_separator = require('statusbar.icons').separator.line
local hl_separator = require('statusbar.hl_groups').separator

---@param hl string
---@param str string
---@return string
M.txt = function(hl, str)
	str = str or ''
	local a = '%#' .. hl .. '#' .. str
	return a
end

---@param str_hl string
---@param func string
---@param arg? integer
---@return string
M.button = function(str_hl, func, arg)
	arg = arg or 0
	local arg_str = string.format('%s', arg)

	return '%' .. arg_str .. '@' .. func .. '@' .. str_hl .. '%X'
end

---@return string
M.separator = function()
	local str = icon_separator

	return M.txt(hl_separator, str)
end

return M
