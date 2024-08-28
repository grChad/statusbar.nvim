local M = {}
M.nvim = '  '

M.separator = {
	line = ' | ',
	arrow = { left = '  ', right = '  ' },
}

M.percent_bar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }

M.diagnostic = { error = ' ', warning = ' ', hint = '󰌵 ', info = ' ' }

M.git = { branch = '', add = '', remove = '', modifier = '' }

M.os = {
	fedora = ' ',
	debian = ' ',
	arch = ' ',
	ubuntu = ' ',
	manjaro = ' ',
	mint = ' ',
	pop_os = ' ',
	zorin = ' ',
	cereus = '󰶵 ',
	linux = ' ',
}

M.others = { empty = '', lsp = ' ', directory = '󰉋 ', user = '󰀉 ' }

M.ia = {
	supermaven = ' ',
	codeium = ' ',
}

return M
