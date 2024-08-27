local separator = require('statusbar.utils').separator()
local icons = require('statusbar.icons')
local txt = require('statusbar.utils').txt
local button = require('statusbar.utils').button
local hl = require('statusbar.hl_groups')

--------------------------------- [ btn onclick function ] ---------------------------
vim.cmd([[
   function! ToggleServers(a,b,c,d)
      lua require('statusbar.function_btn').toggle_servers()
   endfunction
]])

------------------------------------ [ functions ] ------------------------------------
local servers_name = function()
	local icon = icons.separator.arrow.right
	local servers = {}

	local clients = vim.lsp.get_active_clients({ bufnr = 0 })
	for _, server in pairs(clients) do
		table.insert(servers, server.name)
	end

	---@type string
	local str
	if #servers > 0 then
		str = icon .. '[' .. table.concat(servers, ' ') .. ']'
	end

	return { str = str, hasLsp = #servers > 0 }
end

local diagnostic = function()
	if not rawget(vim, 'lsp') then
		return ''
	end

	local i_error = txt(hl.error, icons.diagnostic.error)
	local i_warn = txt(hl.warn, icons.diagnostic.warning)
	local i_hint = txt(hl.hint, icons.diagnostic.hint)
	local i_info = txt(hl.info, icons.diagnostic.info)

	local messages = {
		{ severity = vim.diagnostic.severity.ERROR, hl = i_error },
		{ severity = vim.diagnostic.severity.WARN, hl = i_warn },
		{ severity = vim.diagnostic.severity.HINT, hl = i_hint },
		{ severity = vim.diagnostic.severity.INFO, hl = i_info },
	}

	local caret_right = txt(hl.lspIcon, icons.separator.arrow.right)
	local message_str = ''

	for _, message in ipairs(messages) do
		local count = #vim.diagnostic.get(0, { severity = message.severity })
		if count > 0 then
			message_str = message_str .. message.hl .. count .. ' '
		end
	end

	if #vim.diagnostic.get(0) == 0 then
		caret_right = ''
	end

	return caret_right .. message_str
end

return function()
	local lspIcon = txt(hl.lspIcon, icons.others.lsp)
	local servers = servers_name().str
	local hasLsp = servers_name().hasLsp

	if not hasLsp then
		return ''
	end

	---@type string
	local finalStr
	if vim.g.s_servers_is_active then
		finalStr = lspIcon .. servers .. diagnostic()
	else
		finalStr = lspIcon .. diagnostic()
	end

	return separator .. button(finalStr, 'ToggleServers')
end
