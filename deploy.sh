#!/usr/bin/env bash
# ==============================================================================
# 🚀 DOTFILES UNIVERSAL DEPLOYMENT & SYNC ENGINE
# Autor: Rodrigo Villegas (@rodrigo47363)
# Despliegue automatizado, idempotente y sin fricción de la estación ofensiva
# ==============================================================================

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
LOCAL_BIN="$HOME/.local/bin"
LOCAL_SHARE="$HOME/.local/share"

echo -e "\e[36m========================================================\e[0m"
echo -e "\e[36m  ⚙️  Iniciando Despliegue de Dotfiles & Undercover Engine\e[0m"
echo -e "\e[36m========================================================\e[0m"

# 1. Crear estructura de directorios
echo -e "\e[34m[*] Creando estructura de directorios en ~/.config y ~/.local...\e[0m"
mkdir -p "$CONFIG_DIR"/{bspwm/scripts,sxhkd,polybar/scripts,rofi/{themes,themes/catppuccin},kitty,dunst,picom,gtk-3.0} \
         "$LOCAL_BIN" \
         "$LOCAL_SHARE"/icons \
         "$LOCAL_SHARE"/fonts

# 2. Desplegar configuraciones maestras
echo -e "\e[34m[*] Desplegando configuraciones y temas...\e[0m"
cp -r "$DOTFILES_DIR"/polybar/* "$CONFIG_DIR"/polybar/
cp -r "$DOTFILES_DIR"/rofi/* "$CONFIG_DIR"/rofi/
cp "$DOTFILES_DIR"/sxhkdrc "$CONFIG_DIR"/sxhkd/sxhkdrc
cp "$DOTFILES_DIR"/bspwmrc "$CONFIG_DIR"/bspwm/bspwmrc
cp "$DOTFILES_DIR"/bspwm_resize "$CONFIG_DIR"/bspwm/scripts/bspwm_resize
cp -r "$DOTFILES_DIR"/kitty/* "$CONFIG_DIR"/kitty/
cp "$DOTFILES_DIR"/dunst/dunstrc "$CONFIG_DIR"/dunst/dunstrc
cp -r "$DOTFILES_DIR"/picom/* "$CONFIG_DIR"/picom/
cp "$DOTFILES_DIR"/gtk-3.0/settings.ini "$CONFIG_DIR"/gtk-3.0/settings.ini
cp "$DOTFILES_DIR"/.zshrc "$HOME"/.zshrc

# 3. Desplegar binarios y utilidades CLI
echo -e "\e[34m[*] Desplegando binarios tácticos en ~/.local/bin...\e[0m"
cp -r "$DOTFILES_DIR"/bin/* "$LOCAL_BIN"/

# 4. Desplegar cursores auténticos Windows-10
if [[ -d "$DOTFILES_DIR/assets/icons/Windows-10" ]]; then
    echo -e "\e[34m[*] Instalando esquema de cursores Windows-10 en ~/.local/share/icons...\e[0m"
    cp -r "$DOTFILES_DIR/assets/icons/Windows-10" "$LOCAL_SHARE/icons/"
fi

# 5. Permisos de ejecución
echo -e "\e[34m[*] Asignando permisos de ejecución a scripts y demonios...\e[0m"
chmod +x "$CONFIG_DIR"/bspwm/bspwmrc "$CONFIG_DIR"/bspwm/scripts/* 2>/dev/null || true
chmod +x "$CONFIG_DIR"/polybar/launch.sh "$CONFIG_DIR"/polybar/scripts/* 2>/dev/null || true
chmod +x "$CONFIG_DIR"/rofi/theme-selector.sh 2>/dev/null || true
chmod +x "$LOCAL_BIN"/* 2>/dev/null || true

# 6. Actualizar cachés de fuentes e iconos
echo -e "\e[34m[*] Regenerando cachés del sistema (Fontconfig & GTK)...\e[0m"
fc-cache -f >/dev/null 2>&1 || true

echo -e "\e[32m========================================================\e[0m"
echo -e "\e[32m  ✅  Despliegue completado con éxito al 1000%.\e[0m"
echo -e "\e[32m  💡  Recarga BSPWM (Super+Alt+R) o cambia de modo con:\e[0m"
echo -e "\e[33m      mode-win10   |   mode-win11   |   mode-normal\e[0m"
echo -e "\e[32m========================================================\e[0m"
