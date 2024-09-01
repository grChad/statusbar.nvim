local M = {}

M.toggle_file_name = function()
	if vim.g.s_filename_is_active then
		vim.g.s_filename_is_active = false
	else
		vim.g.s_filename_is_active = true
	end

	vim.api.nvim_command('redraw!')
end

M.toggle_servers = function()
	if vim.g.s_servers_is_active then
		vim.g.s_servers_is_active = false
	else
		vim.g.s_servers_is_active = true
	end

	vim.api.nvim_command('redraw!')
end

M.showBranchName = function()
	if vim.g.s_show_name_branch then
		vim.g.s_show_name_branch = false
	else
		vim.g.s_show_name_branch = true
	end

	vim.api.nvim_command('redraw!')
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
	else
		vim.g.s_position_is_active = true
	end

	vim.api.nvim_command('redraw!')
end

M.showCwd = function()
	vim.g.s_status_cwd = vim.g.s_status_cwd + 1
	vim.api.nvim_command('redraw!')
end

M.showUser = function()
	if vim.g.s_show_user then
		vim.g.s_show_user = false
	else
		vim.g.s_show_user = true
	end

	vim.api.nvim_command('redraw!')
end

return M
