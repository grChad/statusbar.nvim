local M = {}

M.toggle_file_name = function()
	vim.g.s_filename_is_active = true
	vim.api.nvim_command('redraw!')

	vim.defer_fn(function()
		vim.g.s_filename_is_active = false
		vim.api.nvim_command('redraw!')
	end, 5000)
end

return M
