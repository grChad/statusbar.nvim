<h1 align="center">statusbar.nvim</h1>

> es un plugin de barra de estado que se caracteriza por ser _estática_. Esta opción fue elegida para proporcionar una barra de estado simple y rápida, sin necesidad de una configuración adicional.


![image01](https://github.com/GabrielRIP/my-assets/blob/main/plugs-lua/statusStatic/status01.png)
![image02](https://github.com/GabrielRIP/my-assets/blob/main/plugs-lua/statusStatic/status02.png)
![image03](https://github.com/GabrielRIP/my-assets/blob/main/plugs-lua/statusStatic/status03.png)
![image04](https://github.com/GabrielRIP/my-assets/blob/main/plugs-lua/statusStatic/status04.png)
![image05](https://github.com/GabrielRIP/my-assets/blob/main/plugs-lua/statusStatic/status05.png)

## ¿En qué se destaca?

Se destaca por las siguientes características:

- [x] Los colores utilizados para mostrar los diagnósticos lsp y git status se basan en los colores definidos por gitsigns y lsp del sistema, por lo que es compatible con temas que colorean estos dos.
- [x] El estilo de la barra de estado es simple y minimalista, proporcionando solo la información esencial que necesita el usuario. Esto hace que sea fácil de usar y visualmente atractiva.
- [x] **Clickeable!!**, solo algunas zonas lo son. lo puedes ver [aquí](#zonas-clickebles).
- [ ] Detecta automáticamente el nombre de usuario del sistema `whoami` y lo muestra junto al icono del sistema correspondiente.
- [ ] El icono del sistema se adapta a una lista de sistemas operativos populares, como Fedora, Debian, Arch, Ubuntu, Manjaro, Linux Mint, Pop Os y Zorin. El icono de Linux por defecto.
- [ ] Muestra el icono de _supermaven_, _codeium_ si eres usuario.

## Uso

con [Packer](https://github.com/wbthomason/packer.nvim)

```lua
use {
  'grChad/statusbar.nvim',
  config = function()
    require('grbar').setup()
  end,
}
```

con [Lazy](https://github.com/folke/lazy.nvim)

```lua
{
  'grChad/statusbar.nvim',
  lazy = false,
  config = function()
    require('grbar').setup()
  end,
},
```


## Zonas Clickebles

**filename:** permite visualizar cuanto pesa el archivo enfocado
