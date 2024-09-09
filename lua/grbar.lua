-- [left] modules
local modes = require('statusbar.modules.modes')
local filename = require('statusbar.modules.filename')
local lsp = require('statusbar.modules.lsp')

-- [right] modules
local git = require('statusbar.modules.git')
local user = require('statusbar.modules.user')
local directory = require('statusbar.modules.directory')
local spellCheck = require('statusbar.modules.spellCheck')
local position = require('statusbar.modules.cursor_position')
local ia = require('statusbar.modules.ia')

vim.g.s_filename_is_active = false
vim.g.s_servers_is_active = false
vim.g.s_show_user = false
vim.g.s_status_cwd = 0 -- % 3 == 0
vim.g.s_show_spell = false
vim.g.s_position_is_active = false
vim.g.s_show_name_branch = true

---@alias GrConfigModes 'foreground' | 'background'
---@alias GrConfigUser { enabled?: boolean, icon?: string, color_icon?: string, name?: string }

---@alias GrConfigIaCodeium { enabled?: boolean, icon?: string, color_icon?: string }
---@alias GrConfigIaSupermaven { enabled?: boolean, icon?: string, color_icon?: string }
---@alias GrConfigIa { codeium?: GrConfigIaCodeium, supermaven?: GrConfigIaSupermaven }

---@alias GrConfigGit { icon_add?: string, color_add?: string, icon_remove?: string, color_remove?: string, icon_change?: string, color_change?: string, icon_branch?: string, color_branch?: string }

---@alias GrConfigLsp { icon_error?: string, color_error?: string, icon_warning?: string, color_warning?: string, icon_hint?: string, color_hint?: string, icon_info?: string, color_info?: string }

---@class GrConfig
---@field background? string
---@field foreground? string
---@field sub_foreground? string
---@field separator_color? string
---@field mode_style? GrConfigModes
---@field lsp? GrConfigLsp
---@field git? GrConfigGit
---@field user? GrConfigUser
---@field ia? GrConfigIa

---@type GrConfig
local opts = {}

local M = {}

M.StatusLine = function()
	return table.concat({
		modes(opts.mode_style),
		filename(opts.background),
		lsp(opts.lsp),
		'%=',
		'%=',
		git(opts.git),
		user(opts.user),
		directory(),
		spellCheck(),
		ia.supermaven(opts.ia),
		ia.codeium(opts.ia),
		position(),
	})
end

---@param config? GrConfig
M.setup = function(config)
	local count_configs = 0

	if type(config) == 'table' and config ~= nil then
		for _ in pairs(config) do
			count_configs = count_configs + 1
		end

		if count_configs > 0 then
			opts = config
		end
	end

	require('statusbar.highlights')(opts)

	vim.o.statusline = "%!v:lua.require('grbar').StatusLine()"
end

return M
