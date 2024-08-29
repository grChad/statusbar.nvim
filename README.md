<h1 align="center">statusbar.nvim</h1>

> es un plugin de barra de estado que se caracteriza por ser _estática_. Esta opción fue elegida para proporcionar una barra de estado simple y rápida, sin necesidad de una configuración adicional.

## ¿Cual es la ventaja?

- [x] Los colores utilizados para mostrar los diagnósticos lsp y git status se basan en los colores definidos por gitsigns y lsp del sistema.
- [x] El estilo de la barra de estado es simple y minimalist, proporcionando solo la información esencial que necesita el usuario.
- [x] **Clickeable!!:** Para tener más y más opciones. Lo puedes ver [aquí](#zonas-clickebles).
- [x] Muestra el icono de [supermaven](https://github.com/supermaven-inc/supermaven-nvim), [codeium](https://github.com/Exafunction/codeium.vim).
- [x] Directorio de trabajo con 3 modos de vista.

## Instalar

Con [Lazy](https://github.com/folke/lazy.nvim):

```lua
{
  'grChad/statusbar.nvim',
  lazy = false,
  config = function()
    require('grbar').setup()
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

Opciones por defecto. Si quiere modificar un comportamiento puede cambiarlo.

```lua
require('grbar').setup({
  -- background de la statusline o barra de estado.
  background = '#292C3C'
  user = {
    enabled = true, -- false para desactivarlo
    icon = ' ', -- icono con 2 espacios de preferencia.
    color_icon = '#51A2DA'
    name = 'User', -- Elije tu nombre o tu nick
  },
  ia = {
    -- se requiere 'supermaven-inc/supermaven-nvim'
    supermaven = {
      enabled = false,
      icon = ' ',
      color_icon = '#6CC644',
    },
    -- se requiere 'Exafunction/codeium.vim'
    codeium = {
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
