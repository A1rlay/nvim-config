#!/usr/bin/env bash
set -e

echo "🚀 Instalando dependencias básicas..."
sudo apt update
sudo apt install -y neovim git curl unzip ripgrep fd-find

echo "📦 Instalando GitHub CLI (gh)..."
type gh >/dev/null 2>&1 || sudo apt install -y gh

echo "🎨 Instalando Nerd Font (FiraCode)..."
if [ ! -d "$HOME/.local/share/fonts" ]; then
  mkdir -p "$HOME/.local/share/fonts"
fi
cd "$HOME/.local/share/fonts"
if [ ! -f "FiraCodeNerdFont-Regular.ttf" ]; then
  curl -fLo "FiraCode.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip
  unzip -o FiraCode.zip -d FiraCode
  fc-cache -fv
fi

echo "⚙️ Configurando Neovim..."
if [ -d "$HOME/.config/nvim" ]; then
  mv "$HOME/.config/nvim" "$HOME/.config/nvim.bak.$(date +%s)"
fi
git clone https://github.com/a1rlay/nvim ~/.config/nvim

echo "✅ Listo. Abre Neovim con: nvim"

