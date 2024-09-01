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

---@return string
M.space = function()
	return M.txt(hl_separator, ' ')
end

---@param table_user? table
---@param table_default table
---@return table
M.selectTable = function(table_user, table_default)
	if table_user == nil then
		return table_default
	elseif type(table_user) ~= 'table' then
		return table_default
	end
	return table_user
end

---@param str_user? string
---@param str_default string
---@return string
M.selectStr = function(str_user, str_default)
	if str_user == nil then
		return str_default
	elseif str_user == '' then
		return str_default
	elseif type(str_user) ~= 'string' then
		return str_default
	end
	return str_user
end

---@param bool_use? boolean
---@param bool_default boolean
---@return boolean
M.selectBool = function(bool_use, bool_default)
	if bool_use == nil then
		return bool_default
	elseif type(bool_use) ~= 'boolean' then
		return bool_default
	end
	return bool_use
end

---@param icon string
---@param status integer
---@return string
M.gitStatusAndPad = function(icon, status)
	local blank = ''
	if status == nil then
		return blank
	elseif status == 0 then
		return blank
	end
	return M.trimAndPad(icon, 3) .. status
end

---@param str string
---@return string
M.trim = function(str)
	return str:match('^%s*(.-)%s*$') or ''
end

---@alias TrimAndPadOpts 2 | 3
---@param str string
---@param len TrimAndPadOpts
---@return string
M.trimAndPad = function(str, len)
	str = M.trim(str)

	if len == 2 then
		return str .. ' '
	elseif len == 3 then
		return ' ' .. str .. ' '
	else
		return str
	end
end

return M
