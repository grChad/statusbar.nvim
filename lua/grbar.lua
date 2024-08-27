local modes = require('statusbar.modules.modes')
local filename = require('statusbar.modules.filename')
local lsp = require('statusbar.modules.lsp')
local ia = require('statusbar.modules.ia')

vim.g.s_filename_is_active = false
vim.g.s_servers_is_active = false

local M = {}

function M.run()
	return table.concat({
		modes(),
		filename(),
		lsp(),
		'%=',
		'%=',
		ia.supermaven(),
		ia.codeium(),
	})
end

M.setup = function()
	vim.opt.statusline = "%!v:lua.require('grbar').run()"
end

return M
