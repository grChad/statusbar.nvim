local modes = require('statusbar.modules.modes')
local filename = require('statusbar.modules.filename')
local lsp = require('statusbar.modules.lsp')

vim.g.s_filename_is_active = false
vim.g.s_servers_is_active = false

local M = {}

function M.run()
	return table.concat({
		modes(),
		filename(),
		lsp(),
		-- file.file_size(),
		-- modules.fileName(),
		-- modules.LSP_status(),
		-- modules.LSP_Diagnostics(),
		--
		-- "%=",
		-- "%=",
		--
		-- modules.git(),
		-- modules.user(),
		-- modules.cwd(),
		-- modules.cursor_position(),
		-- modules.get_supermaven(),
		-- modules.get_codeium(),
	})
end

M.setup = function()
	vim.opt.statusline = "%!v:lua.require('grbar').run()"
end

return M
