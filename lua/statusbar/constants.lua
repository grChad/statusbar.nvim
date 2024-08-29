local M = {}

M.colors = {
	gold = '#DAA520',
	blue_1 = '#7DC8FC',
	blue_2 = '#51AFEF',
	teal_1 = '#79dac8',
	teal_2 = '#3CD2D2',
	red = '#ff6c6b',
	green = '#35BF5C',
	orange = '#FF8800',

	whiteSmoke = '#DCD9D5',
	text = '#C6D0F5',
	subtext = '#a5adce',
	mantle = '#292C3C',
	dark = '#181818',

	fedora = '#51A2DA',
	git = '#FB7D68',
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
	git = { branch = ' ', add = '  ', remove = '  ', change = '  ' },
	others = { empty = '', lsp = ' ', directory = '󰉋 ', user = ' ' },
	ia = {
		supermaven = ' ',
		codeium = ' ',
	},
}

M.opts_default = {
	background = M.colors.mantle,
	user = {
		enabled = true,
		icon = M.icons.others.user,
		color_icon = M.colors.fedora,
		name = 'User',
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
	error = 'DiagnosticSignError',
	warn = 'DiagnosticSignWarn',
	info = 'DiagnosticSignInfo',
	hint = 'DiagnosticSignHint',

	-- git
	gitIcon = 'S_GitIcon',
	gitAdd = 'GitSignsAdd',
	gitRemove = 'GitSignsDelete',
	gitChange = 'GitSignsChange',

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
