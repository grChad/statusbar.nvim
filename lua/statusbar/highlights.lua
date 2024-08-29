local hl = require('statusbar.constants').hl_groups
local default = require('statusbar.constants').opts_default
local validate = require('statusbar.utils').validate
local cp = require('statusbar.constants').colors

---@param config GrConfig
return function(config)
	local background, user_color_icon
	local color_supermaven, color_codeium

	if validate.isTable(config) then
		background = validate.str(config.background, default.background)

		if validate.isTable(config.user) then
			user_color_icon = validate.str(config.user.color_icon, default.user.color_icon)
		end

		if validate.isTable(config.ia) then
			if validate.isTable(config.ia.supermaven) then
				color_supermaven = validate.str(config.ia.supermaven.color_icon, default.ia.supermaven.color_icon)
			end
			if validate.isTable(config.ia.codeium) then
				color_codeium = validate.str(config.ia.codeium.color_icon, default.ia.codeium.color_icon)
			end
		end
	else
		background = default.background
		user_color_icon = default.user.color_icon
		color_supermaven = default.ia.supermaven.color_icon
		color_codeium = default.ia.codeium.color_icon
	end

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
