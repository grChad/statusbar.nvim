local modes = require('statusbar.modules.modes')
local filename = require('statusbar.modules.filename')

vim.g.s_filename_is_active = false

local M = {}

function M.run()
	return table.concat({
		modes(),
		filename(),
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
