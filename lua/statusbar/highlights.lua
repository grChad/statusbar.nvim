local hl = require('statusbar.constants').hl_groups
local default = require('statusbar.constants').opts_default
local validate = require('statusbar.utils').validate
local cp = require('statusbar.constants').colors

---@param config GrConfig
return function(config)
	---@type GrConfig
	config = validate.table(config, default)

	local background = validate.str(config.background, default.background)

	local user = validate.table(config.user, default.user)
	local user_icon_color = validate.str(user.color_icon, default.user.color_icon)

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
		[hl.gitIcon] = { fg = cp.git, bg = background },

		-- user
		[hl.userIcon] = { fg = user_icon_color, bg = background },

		-- PWD directory
		[hl.cwdIcon] = { fg = cp.gold, bg = background },

		-- Ia
		[hl.codeium] = { fg = cp.codeium, bg = background },
		[hl.supermaven] = { fg = cp.supermaven, bg = background },

		-- position
		[hl.iconPositionBar] = { fg = cp.green, bg = background },
	}

	for hl_group, values in pairs(pre_hl) do
		vim.api.nvim_set_hl(0, hl_group, values)
	end
end
