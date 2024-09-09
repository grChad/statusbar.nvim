local M = {}

M.colors = {
	gold = '#DAA520',
	blue_1 = '#7DC8FC',
	blue_2 = '#51AFEF',
	orange = '#FF8800',
	red = '#E78284',
	yellow = '#E5C890',
	sky = '#99D1DB',
	teal_1 = '#79dac8',
	teal_2 = '#3CD2D2',
	green_1 = '#B2E292',
	green_2 = '#35BF5C',

	whiteSmoke = '#DCD9D5',
	text = '#C6D0F5',
	subtext = '#a5adce',
	crust = '#232634',
	dark = '#181818',

	git = '#f26359',
	fedora = '#51A2DA',
	supermaven = '#6CC644',
	codeium = '#09B6A2',
}

M.icons = {
	separator = {
		line = ' | ',
		arrow = { left = '  ', right = '  ' },
	},
	percent_bar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' },
	diagnostic = { error = ' ', warning = ' ', hint = '󰌵 ', info = ' ' },
	git = { branch = ' ', add = ' ', remove = ' ', change = ' ' },
	others = { empty = '', lsp = ' ', directory = '󰉋 ', user = ' ' },
	ia = {
		supermaven = ' ',
		codeium = ' ',
	},
}

M.opts_default = {
	background = M.colors.crust,
	foreground = M.colors.text,
	sub_foreground = M.colors.subtext,
	separator_color = M.colors.whiteSmoke,
	mode_style = 'background', -- 'foreground' | 'background'
	user = {
		enabled = true,
		icon = M.icons.others.user,
		color_icon = M.colors.fedora,
		name = 'User',
	},
	lsp = {
		icon_error = M.icons.diagnostic.error,
		color_error = M.colors.red,
		icon_warning = M.icons.diagnostic.warning,
		color_warning = M.colors.yellow,
		icon_hint = M.icons.diagnostic.hint,
		color_hint = M.colors.teal_1,
		icon_info = M.icons.diagnostic.info,
		color_info = M.colors.sky,
	},
	git = {
		icon_add = M.icons.git.add,
		color_add = M.colors.green_1,
		icon_remove = M.icons.git.remove,
		color_remove = M.colors.red,
		icon_change = M.icons.git.change,
		color_change = M.colors.yellow,
		icon_branch = M.icons.git.branch,
		color_branch = M.colors.git,
	},
	ia = {
		codeium = {
			enabled = false,
			icon = M.icons.ia.codeium,
			color_icon = M.colors.codeium,
		},
		supermaven = {
			enabled = false,
			icon = M.icons.ia.supermaven,
			color_icon = M.colors.supermaven,
		},
	},
}

M.hl_groups = {
	separator = 'S_Separator',
	text = 'S_Text',
	subText = 'S_SubText',
	textBold = 'S_TextBold',

	-- modes
	normalMode = 'S_NormalMode',
	insertMode = 'S_InsertMode',
	visualMode = 'S_VisualMode',
	replaceMode = 'S_ReplaceMode',
	selectMode = 'S_SelectMode',
	commandMode = 'S_CommandMode',
	confirmMode = 'S_ConfirmMode',
	terminalMode = 'S_TerminalMode',

	-- file name
	iconFtColor = 'S_iconColor',

	-- lsp
	lspIcon = 'S_IconLsp',
	lspError = 'S_DiagnosticSignError',
	lspWarning = 'S_DiagnosticSignWarn',
	lspInfo = 'S_DiagnosticSignInfo',
	lspHint = 'S_DiagnosticSignHint',

	-- git
	gitIcon = 'S_GitIcon',
	gitAdd = 'S_GitSignsAdd',
	gitRemove = 'S_GitSignsDelete',
	gitChange = 'S_GitSignsChange',

	-- Linux
	userIcon = 'S_UserIcon',

	-- directory
	cwdIcon = 'S_CwdIcon',

	-- ia
	supermaven = 'S_Supermaven',
	codeium = 'S_Codeium',

	-- cursor position
	iconPositionBar = 'S_PositionIconBar',
}

return M
