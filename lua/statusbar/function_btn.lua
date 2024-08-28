local M = {}

local time = 10000

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

M.supermaven = function()
	local status_ok, api = pcall(require, 'supermaven-nvim.api')

	if status_ok then
		if api.is_running() then
			api.stop()
		else
			api.start()
		end
	end

	vim.cmd('redraw!')
end

M.codeium = function()
	local status_ok, codeium = pcall(function()
		return vim.api.nvim_call_function('codeium#GetStatusString', {})
	end)

	if status_ok then
		if codeium == 'OFF' then
			vim.cmd('CodeiumEnable')
			vim.notify(' Codeium: Se ha habilitado 😊')
		else
			vim.cmd('CodeiumDisable')
			vim.notify(' Codeium: Se ha deshabilitado 😭')
		end
	end

	vim.cmd('redraw!')
end

M.position = function()
	if vim.g.s_position_is_active then
		vim.g.s_position_is_active = false
		vim.api.nvim_command('redraw!')
	else
		vim.g.s_position_is_active = true
		vim.api.nvim_command('redraw!')
	end
end

M.showCwd = function()
	vim.g.s_show_cwd = true
	vim.api.nvim_command('redraw!')

	vim.defer_fn(function()
		vim.g.s_show_cwd = false
		vim.api.nvim_command('redraw!')
	end, time)
end

return M
