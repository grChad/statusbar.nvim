local cp = require('statusbar.constants').colors
local hl = require('statusbar.constants').hl_groups
local default = require('statusbar.constants').opts_default
local selectTable = require('statusbar.utils').selectTable
local selectStr = require('statusbar.utils').selectStr

return function(config)
	---@type GrConfig
	config = selectTable(config, default)
	local background = selectStr(config.background, default.background)

	---@type GrConfigUser --------------------------------------------------------------
	local table_user = selectTable(config.user, default.user)
	local user_color_icon = selectStr(table_user.color_icon, default.user.color_icon)

	---@type GrConfigGit ---------------------------------------------------------------
	local table_git = selectTable(config.git, default.git)
	local color_add = selectStr(table_git.color_add, default.git.color_add)
	local color_remove = selectStr(table_git.color_remove, default.git.color_remove)
	local color_change = selectStr(table_git.color_change, default.git.color_remove)
	local color_branch = selectStr(table_git.color_branch, default.git.color_branch)

	---@type GrConfigIa ----------------------------------------------------------------
	local table_ia = selectTable(config.ia, default.ia)

	---@type GrConfigIaSupermaven
	local table_supermaven = selectTable(table_ia.supermaven, default.ia.supermaven)
	local color_supermaven = selectStr(table_supermaven.color_icon, default.ia.supermaven.color_icon)

	---@type GrConfigIaCodeium
	local table_codeium = selectTable(table_ia.codeium, default.ia.codeium)
	local color_codeium = selectStr(table_codeium.color_icon, default.ia.codeium.color_icon)

	local pre_hl = {
		[hl.separator] = { fg = cp.whiteSmoke, bg = background },
		[hl.text] = { fg = cp.text, bg = background },
		[hl.textBold] = { fg = cp.text, bg = background, bold = true },
		[hl.subText] = { fg = cp.subtext, bg = background },

		-- MODES
		[hl.normalMode] = { fg = cp.dark, bg = cp.gold, bold = true },
		[hl.insertMode] = { fg = cp.dark, bg = cp.blue_2, bold = true },
		[hl.visualMode] = { fg = cp.dark, bg = cp.teal_1, bold = true },
		[hl.replaceMode] = { fg = cp.dark, bg = cp.red, bold = true },
		[hl.terminalMode] = { fg = cp.dark, bg = cp.blue_1, bold = true },
		[hl.confirmMode] = { fg = cp.dark, bg = cp.teal_2, bold = true },
		[hl.commandMode] = { fg = cp.dark, bg = cp.green, bold = true },
		[hl.selectMode] = { fg = cp.dark, bg = cp.orange, bold = true },

		-- LSP
		[hl.lspIcon] = { fg = cp.blue_2, bg = background },

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
		[hl.iconPositionBar] = { fg = cp.green, bg = background },
	}

	for hl_group, values in pairs(pre_hl) do
		vim.api.nvim_set_hl(0, hl_group, values)
	end
end
