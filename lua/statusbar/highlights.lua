local cp = require('statusbar.constants').colors
local hl = require('statusbar.constants').hl_groups
local default = require('statusbar.constants').opts_default
local selectTable = require('statusbar.utils').selectTable
local selectStr = require('statusbar.utils').selectStr

return function(config)
	---@type GrConfig
	config = selectTable(config, default)
	local background = selectStr(config.background, default.background)
	local foreground = selectStr(config.foreground, default.foreground)
	local sub_foreground = selectStr(config.sub_foreground, default.sub_foreground)
	local separator_color = selectStr(config.separator_color, default.separator_color)

	---@type GrConfigLsp ----------------------------------------------------------------
	local table_lsp = selectTable(config.lsp, default.lsp)
	local color_lsp_error = selectStr(table_lsp.color_error, default.lsp.color_error)
	local color_lsp_warning = selectStr(table_lsp.color_warning, default.lsp.color_warning)
	local color_lsp_hint = selectStr(table_lsp.color_hint, default.lsp.color_hint)
	local color_lsp_info = selectStr(table_lsp.color_info, default.lsp.color_info)

	---@type GrConfigUser ---------------------------------------------------------------
	local table_user = selectTable(config.user, default.user)
	local user_color_icon = selectStr(table_user.color_icon, default.user.color_icon)

	---@type GrConfigGit ----------------------------------------------------------------
	local table_git = selectTable(config.git, default.git)
	local color_add = selectStr(table_git.color_add, default.git.color_add)
	local color_remove = selectStr(table_git.color_remove, default.git.color_remove)
	local color_change = selectStr(table_git.color_change, default.git.color_remove)
	local color_branch = selectStr(table_git.color_branch, default.git.color_branch)

	---@type GrConfigIa -----------------------------------------------------------------
	local table_ia = selectTable(config.ia, default.ia)

	---@type GrConfigIaSupermaven
	local table_supermaven = selectTable(table_ia.supermaven, default.ia.supermaven)
	local color_supermaven = selectStr(table_supermaven.color_icon, default.ia.supermaven.color_icon)

	---@type GrConfigIaCodeium
	local table_codeium = selectTable(table_ia.codeium, default.ia.codeium)
	local color_codeium = selectStr(table_codeium.color_icon, default.ia.codeium.color_icon)

	-- NOTE: if you want to change the colors of the icons, you need to change the hl_groups
	local pre_hl = {
		[hl.separator] = { fg = separator_color, bg = background },
		[hl.text] = { fg = foreground, bg = background },
		[hl.textBold] = { fg = foreground, bg = background, bold = true },
		[hl.subText] = { fg = sub_foreground, bg = background },

		-- MODES
		[hl.normalMode] = { fg = cp.dark, bg = cp.gold, bold = true },
		[hl.insertMode] = { fg = cp.dark, bg = cp.blue_2, bold = true },
		[hl.visualMode] = { fg = cp.dark, bg = cp.teal_1, bold = true },
		[hl.replaceMode] = { fg = cp.dark, bg = cp.red, bold = true },
		[hl.terminalMode] = { fg = cp.dark, bg = cp.blue_1, bold = true },
		[hl.confirmMode] = { fg = cp.dark, bg = cp.teal_2, bold = true },
		[hl.commandMode] = { fg = cp.dark, bg = cp.green_2, bold = true },
		[hl.selectMode] = { fg = cp.dark, bg = cp.orange, bold = true },

		-- LSP
		[hl.lspIcon] = { fg = cp.blue_2, bg = background },
		[hl.lspError] = { fg = color_lsp_error, bg = background },
		[hl.lspWarning] = { fg = color_lsp_warning, bg = background },
		[hl.lspInfo] = { fg = color_lsp_info, bg = background },
		[hl.lspHint] = { fg = color_lsp_hint, bg = background },

		-- Git
		[hl.gitIcon] = { fg = color_branch, bg = background },
		[hl.gitAdd] = { fg = color_add, bg = background },
		[hl.gitRemove] = { fg = color_remove, bg = background },
		[hl.gitChange] = { fg = color_change, bg = background },

		-- user
		[hl.userIcon] = { fg = user_color_icon, bg = background },

		-- PWD directory
		[hl.cwdIcon] = { fg = cp.gold, bg = background },

		-- Ia
		[hl.supermaven] = { fg = color_supermaven, bg = background },
		[hl.codeium] = { fg = color_codeium, bg = background },

		-- position
		[hl.iconPositionBar] = { fg = cp.green_2, bg = background },
	}

	for hl_group, values in pairs(pre_hl) do
		vim.api.nvim_set_hl(0, hl_group, values)
	end
end
