#!/usr/bin/env bash
# Instala las dependencias y la configuración de Neovim.
# Funciona tanto desde un clon ya existente en ~/.config/nvim como en una máquina nueva.
set -euo pipefail

REPO_URL="https://github.com/A1rlay/nvim-config"
NVIM_DIR="$HOME/.config/nvim"
FONT_DIR="$HOME/.local/share/fonts"

echo "🚀 Instalando dependencias..."
sudo apt update
# make/gcc: telescope-fzf-native, LuaSnip y parsers de treesitter
# nodejs/npm: Mason los necesita para pyright, typescript-language-server y prettierd
sudo apt install -y neovim git curl unzip ripgrep fd-find make gcc nodejs npm

NVIM_VERSION="$(nvim --version | head -1 | grep -oE '[0-9]+\.[0-9]+' | head -1)"
if [ "$(printf '%s\n' 0.11 "$NVIM_VERSION" | sort -V | head -1)" != "0.11" ]; then
  echo "⚠️  Neovim $NVIM_VERSION es muy viejo: esta config necesita 0.11 o superior (vim.lsp.config)."
fi

echo "🎨 Instalando Iosevka Nerd Font..."
if ! fc-list | grep -qi "Iosevka Nerd Font"; then
  mkdir -p "$FONT_DIR/Iosevka"
  tmp="$(mktemp -d)"
  curl -fLo "$tmp/Iosevka.zip" https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Iosevka.zip
  unzip -o -q "$tmp/Iosevka.zip" -d "$FONT_DIR/Iosevka"
  rm -rf "$tmp"
  fc-cache -f
fi

echo "⚙️ Configurando Neovim..."
if git -C "$NVIM_DIR" remote get-url origin 2>/dev/null | grep -qi "A1rlay/nvim-config"; then
  echo "La configuración ya está clonada en $NVIM_DIR, no se toca."
else
  if [ -e "$NVIM_DIR" ]; then
    backup="$NVIM_DIR.bak.$(date +%s)"
    echo "Respaldando la configuración actual en $backup"
    mv "$NVIM_DIR" "$backup"
  fi
  git clone "$REPO_URL" "$NVIM_DIR"
fi

echo "✅ Listo. Abre Neovim con: nvim (Lazy y Mason instalarán todo en el primer arranque)"
