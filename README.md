# 🌌 Neovim Config by a1rlay

Mi configuración personal de **Neovim** basada en [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) y extendida con **Lazy.nvim**.  
Diseñada para desarrollo **Fullstack (T3 stack)** y C++ con soporte de LSP, formateo automático, temas modernos y transparencia.

---

## ✨ Características

- ⚡ **Lazy.nvim** como gestor de plugins  
- 🎨 Tema **Catppuccin Mocha** con transparencia  
- ⌨️ **Lualine** como statusline (powerline-like, transparente)  
- 📁 **Neo-tree** como file explorer  
- 📌 **Harpoon 2** para navegación rápida entre archivos  
- 🔍 **Telescope** con tema *ivy* + integración con Harpoon  
- 🧹 **conform.nvim** para formateo automático  
  - C/C++ → clang-format  
  - TS/JS → prettier  
  - Lua → stylua  
- ⚙️ **Mason** para gestionar LSPs, DAPs y formatters  
- 🛠️ LSPs configurados:  
  - TypeScript, Lua, Python, C/C++  
- 🔔 **Fidget.nvim** → progreso LSP (personalizado y transparente)  
- 🖼️ **Transparencia total** en buffers, flotantes, Telescope, WhichKey, etc.  
- 🖋️ Fuente recomendada: **FiraCode Nerd Font**

---

## 📦 Instalación
### 1. Clonar el repo
```bash
git clone https://github.com/a1rlay/nvim ~/.config/nvim  
cd ~/.config/nvim  

./install.sh  

nvim  

Lazy.nvim instalará automáticamente todos los plugins en el primer arranque.
```

---

## ⚡ Atajos útiles

- <leader>a → añadir archivo a Harpoon  
- <C-e> → abrir menú rápido de Harpoon  
- <leader>fl → abrir lista de Harpoon en Telescope  
- <leader>ff → buscar archivo con Telescope  
- <leader>fg → live grep en el proyecto  
- <leader>f → formatear buffer  
- ? en Neo-tree → ver atajos de archivo (crear, renombrar, borrar, mover)

