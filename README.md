<h1 align="center">statusbar.nvim</h1>

> es un plugin de barra de estado que se caracteriza por ser simple y rápida, sin necesidad de una configuración adicional. Pero que esconde opciones.

## ¿Cual es la ventaja?

- [x] El estilo de la barra de estado es simple y minimalista, proporcionando solo la información esencial que necesita el usuario.
- [x] **Clickeable!!:** Para tener más y más opciones. Lo puedes ver [aquí](#zonas-clickebles).
- [x] Muestra el icono de [supermaven](https://github.com/supermaven-inc/supermaven-nvim), [codeium](https://github.com/Exafunction/codeium.vim).
- [x] Directorio de trabajo con 3 modos de vista.
- [ ] puedes modificar los colores como quieras

## Instalar

Con [Lazy](https://github.com/folke/lazy.nvim):

```lua
{
    'grChad/statusbar.nvim',
    lazy = false,
    config = function()
        require('grbar').setup({})
    end,
},
```

Con [Packer](https://github.com/wbthomason/packer.nvim):

```lua
use {
    'grChad/statusbar.nvim',
    config = function()
        require('grbar').setup()
    end,
}
```

### setup

Opciones por defecto. Puedes modificar parcial o totalmente todas las opciones.

```lua
require('grbar').setup({
    background = '#292C3C'
    lsp = {
        icon_error = ' '
        color_error = '#E78284',
        icon_warning = ' ',
        color_warning =  '#E5C890',
        icon_hint = '󰌵 ',
        color_hint = '#79dac8',
        icon_info = ' ',
        color_info = '#99D1DB',
    },
    git = {
        icon_add = '',
        color_add = '#B2E292',
        icon_remove = '',
        color_remove = '#E78284',
        icon_change = '',
        color_change = '#E5C890',
        icon_branch = '',
        color_branch = '#f26359',
    },
    user = {
        enabled = true, -- false para desactivarlo
        icon = ' ',
        color_icon = '#51A2DA'
        name = 'User', -- Elije tu nombre o tu nick
    },
    ia = {
        supermaven = {
            -- se requiere 'supermaven-inc/supermaven-nvim'
            enabled = false,
            icon = ' ',
            color_icon = '#6CC644',
        },
        codeium = {
            -- se requiere 'Exafunction/codeium.vim'
            enabled = false,
            icon = ' ',
            color_icon = '#09B6A2',
        },
    },
})
```

Los colores pueden ser por nombres como `black` o hexadecimales `'#181818'`. Y de preferencia el uso de hexadecimales.

## Zonas Clickebles

**filename:** Permite visualizar cuanto pesa el archivo.

**lsp:** Muestra los nombres de los Lsp en uso.

**codeium:** Al dar click habilita y deshabilita [codeium](https://github.com/Exafunction/codeium.vim).

**supermaven:** Al dar click habilita y deshabilita [supermaven](https://github.com/supermaven-inc/supermaven-nvim)

**Position:** Muestra o oculta el eje Y con un icono correspondiente.

**Directorio:** Tiene 3 vistas que van cambiando y alternando con los clicks que reciba.

**Usuario:** Al darle click alterna el nombre de usuario.

**Git:** Muestra y oculta el nombre de la rama.
