local separator = require('statusbar.utils').separator()
local icons = require('statusbar.constants').icons
local txt = require('statusbar.utils').txt
local button = require('statusbar.utils').button
local hl = require('statusbar.constants').hl_groups
local selectTable = require('statusbar.utils').selectTable
local selectStr = require('statusbar.utils').selectStr
local default_lsp = require('statusbar.constants').opts_default.lsp
local trimAndPad = require('statusbar.utils').trimAndPad

--------------------------------- [ btn onclick function ] ---------------------------
vim.cmd([[
   function! ToggleServers(a,b,c,d)
      lua require('statusbar.function_btn').toggle_servers()
   endfunction
]])

------------------------------------ [ functions ] ------------------------------------
local getServers = function()
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

local diagnostic = function(error, warning, hint, info)
	if not rawget(vim, 'lsp') then
		return ''
	end

	local i_error = txt(hl.lspError, trimAndPad(error, 2))
	local i_warn = txt(hl.lspWarning, trimAndPad(warning, 2))
	local i_hint = txt(hl.lspHint, trimAndPad(hint, 2))
	local i_info = txt(hl.lspInfo, trimAndPad(info, 2))

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

return function(table_lsp)
	---@type GrConfigLsp
	table_lsp = selectTable(table_lsp, default_lsp)
	local i_err = selectStr(table_lsp.icon_error, default_lsp.icon_error)
	local i_warn = selectStr(table_lsp.icon_warning, default_lsp.icon_warning)
	local i_hint = selectStr(table_lsp.icon_hint, default_lsp.icon_hint)
	local i_info = selectStr(table_lsp.icon_info, default_lsp.icon_info)

	local lspIcon = txt(hl.lspIcon, icons.others.lsp)
	local servers = getServers()

	local icon_diagnostics = diagnostic(i_err, i_warn, i_hint, i_info)

	if not servers.hasLsp then
		return ''
	end

	---@type string
	local finalStr
	if vim.g.s_servers_is_active then
		finalStr = lspIcon .. servers.str .. icon_diagnostics
	else
		finalStr = lspIcon .. icon_diagnostics
	end

	return separator .. button(finalStr, 'ToggleServers')
end
