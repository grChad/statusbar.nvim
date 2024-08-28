local modes = require('statusbar.modules.modes')
local filename = require('statusbar.modules.filename')
local lsp = require('statusbar.modules.lsp')
local directory = require('statusbar.modules.directory')
local position = require('statusbar.modules.cursor_position')
local ia = require('statusbar.modules.ia')

vim.g.s_filename_is_active = false
vim.g.s_servers_is_active = false
vim.g.s_position_is_active = false
vim.g.s_show_cwd = false

local M = {}

function M.run()
	return table.concat({
		modes(),
		filename(),
		lsp(),
		'%=',
		'%=',
		directory(),
		ia.supermaven(),
		ia.codeium(),
		position(),
	})
end

M.setup = function()
	vim.opt.statusline = "%!v:lua.require('grbar').run()"
end

return M
