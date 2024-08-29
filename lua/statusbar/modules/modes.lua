local txt = require('statusbar.utils').txt
local hl = require('statusbar.constants').hl_groups

local modes = {
	['n'] = { 'NORMAL', hl.normalMode },
	['niI'] = { 'NORMAL i', hl.normalMode },
	['niR'] = { 'NORMAL r', hl.normalMode },
	['niV'] = { 'NORMAL v', hl.normalMode },
	['no'] = { 'N-PENDING', hl.normalMode },
	['i'] = { 'INSERT', hl.insertMode },
	['ic'] = { 'INSERT (completion)', hl.insertMode },
	['ix'] = { 'INSERT completion', hl.insertMode },
	['v'] = { 'VISUAL', hl.visualMode },
	['V'] = { 'V-LINE', hl.visualMode },
	['Vs'] = { 'V-LINE (Ctrl O)', hl.visualMode },
	[''] = { 'V-BLOCK', hl.visualMode },
	['R'] = { 'REPLACE', hl.replaceMode },
	['Rv'] = { 'V-REPLACE', hl.replaceMode },
	['s'] = { 'SELECT', hl.selectMode },
	['S'] = { 'S-LINE', hl.selectMode },
	[''] = { 'S-BLOCK', hl.selectMode },
	['c'] = { 'COMMAND', hl.commandMode },
	['cv'] = { 'COMMAND', hl.commandMode },
	['ce'] = { 'COMMAND', hl.commandMode },
	['r'] = { 'PROMPT', hl.confirmMode },
	['rm'] = { 'MORE', hl.confirmMode },
	['r?'] = { 'CONFIRM', hl.confirmMode },
	['t'] = { 'TERMINAL', hl.terminalMode },
	['nt'] = { 'NTERMINAL', hl.terminalMode },
	['!'] = { 'SHELL', hl.terminalMode },
}

return function()
	local mode = vim.api.nvim_get_mode().mode
	local hl_mode = txt(modes[mode][2], ' ' .. modes[mode][1])

	return hl_mode .. ' '
end
