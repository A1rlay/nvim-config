# 🌌 Neovim Config by a1rlay

Mi configuración personal de **Neovim** (0.11+), nacida de [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) y reorganizada en módulos con **lazy.nvim**.
Pensada para desarrollo **Fullstack (TypeScript)**, Python y C/C++.

---

## ✨ Características

- ⚡ **lazy.nvim** con carga diferida (la mayoría de plugins cargan al abrir un archivo o usar su atajo)
- 🎨 Tema **Monokai Pro** con fondo transparente, a juego con WezTerm, `ls` (vivid) y el prompt
- ⌨️ **Lualine** como statusline global
- 📁 **Neo-tree** como explorador de archivos
- 📌 **Harpoon 2** para saltar entre archivos de trabajo
- 🔍 **Telescope** (+ fzf-native) para buscar archivos, texto, símbolos y ayuda
- ✍️ **blink.cmp** + LuaSnip para autocompletado
- 🧹 **conform.nvim** para formatear al guardar
  - C/C++ → clang-format
  - TS/JS → prettierd / prettier (usa el prettier y `.prettierrc` del proyecto)
  - Lua → stylua
- ⚙️ **Mason** instala LSPs y formatters automáticamente
- 🛠️ LSPs: TypeScript (typescript-tools), Lua, Python (pyright), C/C++ (clangd)
- 🤖 **opencode.nvim** para usar opencode desde el editor
- 🔔 **Fidget** para el progreso de los LSP
- 🖋️ Fuente: **Iosevka Nerd Font**

---

## 📦 Instalación

```bash
git clone https://github.com/A1rlay/nvim-config ~/.config/nvim
~/.config/nvim/install.sh
nvim
```

`install.sh` instala las dependencias (ripgrep, fd, make, gcc, node, la fuente) y detecta que la config ya está clonada.
En una máquina nueva también puedes correrlo directamente y él clona el repo (respaldando cualquier config previa).

En el primer arranque, Lazy instala los plugins y Mason los LSPs y formatters.

---

## 📂 Estructura

```
init.lua                  líder, módulos base y lazy.nvim
lua/custom/
  options.lua keymaps.lua autocmds.lua
  ui.lua ui_transparent.lua   transparencia y colores Monokai Pro
  lsp.lua                     atajos LSP, diagnósticos y servidores
  themes.lua                  temas (solo Monokai Pro activo)
  plugins/                    un archivo por plugin o grupo de plugins
```

---

## ⚡ Atajos útiles

| Atajo | Acción |
|---|---|
| `<leader>sf` / `<leader>sg` | Buscar archivo / texto (live grep) |
| `<leader><leader>` | Buffers abiertos |
| `<leader>f` | Formatear buffer |
| `<leader>a` / `<C-e>` | Añadir a Harpoon / menú de Harpoon |
| `<leader>1`–`<leader>4` | Ir al archivo 1–4 de Harpoon |
| `<leader>sl` | Lista de Harpoon en Telescope |
| `gd` | Ir a la definición (en split vertical) |
| `grr` / `grn` / `gra` | Referencias / renombrar / code action |
| `gl` / `gL` | Diagnóstico de la línea / todos en quickfix |
| `<leader>oa` / `<leader>ox` | Preguntar a opencode / acciones de opencode |
| `` <leader>` `` / `` <M-`> `` | Mostrar/ocultar opencode (`<M-`>` también en la terminal) |
| `\` | Neo-tree (`?` dentro para ver sus atajos) |
| `<leader>sk` | Buscar cualquier otro atajo |
