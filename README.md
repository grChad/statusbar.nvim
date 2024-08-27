<h1 align="center">statusbar.nvim</h1>

> es un plugin de barra de estado que se caracteriza por ser _estática_. Esta opción fue elegida para proporcionar una barra de estado simple y rápida, sin necesidad de una configuración adicional.

## ¿En qué se destaca?

Se destaca por las siguientes características:

- [x] Los colores utilizados para mostrar los diagnósticos lsp y git status se basan en los colores definidos por gitsigns y lsp del sistema, por lo que es compatible con temas que colorean estos dos.
- [x] El estilo de la barra de estado es simple y minimalist, proporcionando solo la información esencial que necesita el usuario. Esto hace que sea fácil de usar y visualmente atractiva.
- [x] **Clickeable!!**, solo algunas zonas lo son. Lo puedes ver [aquí](#zonas-clickebles).
- [ ] Detecta automáticamente el nombre de usuario del sistema `whoami` y lo muestra junto al icono del sistema correspondiente.
- [ ] El icono del sistema se adapta a una lista de sistemas operativos populares, como Fedora, Debian, Arch, Ubuntu, Manjaro, Linux Mint, Pop Os y Zorin. El icono de Linux por defecto.
- [ ] Muestra el icono de _supermaven_, _codeium_ si eres usuario.

## Instalar

Con [Lazy](https://github.com/folke/lazy.nvim)

```lua
{
  'grChad/statusbar.nvim',
  lazy = false,
  config = function()
    require('grbar').setup()
  end,
},
```

Con [Packer](https://github.com/wbthomason/packer.nvim)

```lua
use {
  'grChad/statusbar.nvim',
  config = function()
    require('grbar').setup()
  end,
}
```

## Zonas Clickebles

**filename:** Permite visualizar cuanto pesa el archivo.

**lsp:** Muestra los nombres de los Lsp en uso.

**codeium:** Al dar click habilita y deshabilita [codeium](https://github.com/Exafunction/codeium.vim).

**supermaven:** Al dar click habilita y deshabilita [supermaven](https://github.com/supermaven-inc/supermaven-nvim)
