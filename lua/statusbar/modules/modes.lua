local txt = require('statusbar.utils').txt
local hl = require('statusbar.hl_groups')

local modes = {
	['n'] = { 'NORMAL', hl.NormalMode },
	['niI'] = { 'NORMAL i', hl.NormalMode },
	['niR'] = { 'NORMAL r', hl.NormalMode },
	['niV'] = { 'NORMAL v', hl.NormalMode },
	['no'] = { 'N-PENDING', hl.NormalMode },
	['i'] = { 'INSERT', hl.InsertMode },
	['ic'] = { 'INSERT (completion)', hl.InsertMode },
	['ix'] = { 'INSERT completion', hl.InsertMode },
	['v'] = { 'VISUAL', hl.VisualMode },
	['V'] = { 'V-LINE', hl.VisualMode },
	['Vs'] = { 'V-LINE (Ctrl O)', hl.VisualMode },
	[''] = { 'V-BLOCK', hl.VisualMode },
	['R'] = { 'REPLACE', hl.ReplaceMode },
	['Rv'] = { 'V-REPLACE', hl.ReplaceMode },
	['s'] = { 'SELECT', hl.SelectMode },
	['S'] = { 'S-LINE', hl.SelectMode },
	[''] = { 'S-BLOCK', hl.SelectMode },
	['c'] = { 'COMMAND', hl.CommandMode },
	['cv'] = { 'COMMAND', hl.CommandMode },
	['ce'] = { 'COMMAND', hl.CommandMode },
	['r'] = { 'PROMPT', hl.ConfirmMode },
	['rm'] = { 'MORE', hl.ConfirmMode },
	['r?'] = { 'CONFIRM', hl.ConfirmMode },
	['t'] = { 'TERMINAL', hl.TerminalMode },
	['nt'] = { 'NTERMINAL', hl.NTerminalMode },
	['!'] = { 'SHELL', hl.TerminalMode },
}

return function()
	local mode = vim.api.nvim_get_mode().mode
	local hl_mode = txt(modes[mode][2], ' ' .. modes[mode][1])

	return hl_mode .. ' '
end
