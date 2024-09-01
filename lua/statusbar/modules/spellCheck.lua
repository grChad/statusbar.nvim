local hl = require('statusbar.constants').hl_groups
local txt = require('statusbar.utils').txt
local button = require('statusbar.utils').button

--------------------------------- [ btn onclick function ] ---------------------------
vim.cmd([[
   function! ActiveSpell(a,b,c,d)
      lua require('statusbar.function_btn').activeSpell()
   endfunction
]])

------------------------------------ [ functions ] ------------------------------------
return function()
	local icon_spell = '  '

	---@type string
	local str
	if vim.g.s_show_spell then
		vim.opt.spelllang = { 'en', 'es', 'cjk' } -- Establecer idiomas en ese orden
		vim.opt.spellsuggest = 'best,9' -- Muestra las 9 mejores opciones de correccion.
		vim.opt.spelloptions = 'camel' -- Para que no muestre error ortografico en los CamelCase

		str = txt(hl.separator, icon_spell)
	else
		str = txt(hl.subText, icon_spell)
	end
	return button(str, 'ActiveSpell')
end
