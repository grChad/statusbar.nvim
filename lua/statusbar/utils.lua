local icon_separator = require('statusbar.constants').icons.separator.line
local hl_separator = require('statusbar.constants').hl_groups.separator

local M = {}

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

---@param userStr string
---@param defaultStr string
local validateStr = function(userStr, defaultStr)
	if userStr == nil then
		return defaultStr
	elseif userStr == '' then
		return defaultStr
	elseif type(userStr) ~= 'string' then
		return defaultStr
	end
	return userStr
end

---@param userBool boolean
---@param defaultBool boolean
local validateBool = function(userBool, defaultBool)
	if userBool == nil then
		return defaultBool
	elseif type(userBool) ~= 'boolean' then
		return defaultBool
	end
	return userBool
end

---@param userTable table | nil
---@param defaultTable table
local validateTable = function(userTable, defaultTable)
	if userTable == nil then
		return defaultTable
	elseif type(userTable) ~= 'table' then
		return defaultTable
	end
	return userTable
end

M.validate = {
	str = validateStr,
	bool = validateBool,
	table = validateTable,
}

return M
