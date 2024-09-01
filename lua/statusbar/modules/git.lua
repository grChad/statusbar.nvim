local icons = require('statusbar.constants').icons
local hl = require('statusbar.constants').hl_groups
local txt = require('statusbar.utils').txt
local button = require('statusbar.utils').button
local selectTable = require('statusbar.utils').selectTable
local selectStr = require('statusbar.utils').selectStr
local gitStatusAndPad = require('statusbar.utils').gitStatusAndPad
local trimAndPad = require('statusbar.utils').trimAndPad
local default_git = require('statusbar.constants').opts_default.git
local separator = require('statusbar.utils').separator()

--------------------------------- [ btn onclick function ] ---------------------------
vim.cmd([[
   function! ShowBranchName(a,b,c,d)
      lua require('statusbar.function_btn').showBranchName()
   endfunction
]])

------------------------------------ [ functions ] ------------------------------------
---@return { icons: string, show: boolean }
local diagnostics = function(status, add, remove, change)
	add = gitStatusAndPad(add, status.added)
	remove = gitStatusAndPad(remove, status.removed)
	change = gitStatusAndPad(change, status.changed)

	local show_diagnostics = add == '' and change == '' and remove == ''

	-- add highlight group
	add = txt(hl.gitAdd, add)
	remove = txt(hl.gitRemove, remove)
	change = txt(hl.gitChange, change)

	return { icons = add .. remove .. change, show = show_diagnostics }
end

return function(table_git)
	---@type GrConfigGit
	table_git = selectTable(table_git, default_git)
	local i_add = selectStr(table_git.icon_add, default_git.icon_add)
	local i_remove = selectStr(table_git.icon_remove, default_git.icon_remove)
	local i_change = selectStr(table_git.icon_change, default_git.icon_change)
	local i_branch = selectStr(table_git.icon_branch, default_git.icon_branch)

	if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
		return ''
	end

	local git_status = vim.b.gitsigns_status_dict
	local get_diagnostics = diagnostics(git_status, i_add, i_remove, i_change)

	local caret_left = icons.separator.arrow.left
	if get_diagnostics.show then
		caret_left = ''
	end

	local name_branch = git_status.head
	local branch = caret_left .. trimAndPad(i_branch, 2)

	-- add highlight group
	branch = txt(hl.gitIcon, branch)
	name_branch = txt(hl.gitIcon, name_branch)

	---@type string
	local str
	if vim.g.s_show_name_branch then
		str = get_diagnostics.icons .. branch .. name_branch
	else
		str = get_diagnostics.icons .. branch
	end

	return button(str, 'ShowBranchName') .. separator
end
