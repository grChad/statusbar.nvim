local M = {}

local time = 8000

M.toggle_file_name = function()
	vim.g.s_filename_is_active = true
	vim.api.nvim_command('redraw!')

	vim.defer_fn(function()
		vim.g.s_filename_is_active = false
		vim.api.nvim_command('redraw!')
	end, time)
end

M.toggle_servers = function()
	vim.g.s_servers_is_active = true
	vim.api.nvim_command('redraw!')

	vim.defer_fn(function()
		vim.g.s_servers_is_active = false
		vim.api.nvim_command('redraw!')
	end, time)
end

return M
