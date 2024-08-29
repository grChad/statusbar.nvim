local icons = require('statusbar.constants').icons
local hl = require('statusbar.constants').hl_groups
local txt = require('statusbar.utils').txt
local separator = require('statusbar.utils').separator()

local gitStatus = function(icon, status)
	local blank = ''
	if status == nil then
		return blank
	elseif status == 0 then
		return blank
	end
	return icon .. status
end

---@return { icons: string, show: boolean }
local diagnostics = function(status)
	local add = gitStatus(icons.git.add, status.added)
	local change = gitStatus(icons.git.change, status.changed)
	local remove = gitStatus(icons.git.remove, status.removed)

	local show_diagnostics = add == '' and change == '' and remove == ''

	-- add highlight group
	add = txt(hl.gitAdd, add)
	remove = txt(hl.gitRemove, remove)
	change = txt(hl.gitChange, change)

	return { icons = add .. remove .. change, show = show_diagnostics }
end

return function()
	if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
		return ''
	end

	local git_status = vim.b.gitsigns_status_dict

	local caret_left = icons.separator.arrow.left
	if diagnostics(git_status).show then
		caret_left = ''
	end

	local icon_branch = icons.git.branch
	local name_branch = git_status.head
	local branch = caret_left .. icon_branch

	-- add highlight group
	branch = txt(hl.gitIcon, branch)
	name_branch = txt(hl.gitIcon, name_branch)

	return diagnostics(git_status).icons .. branch .. name_branch .. separator
end
