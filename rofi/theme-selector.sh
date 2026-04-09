#!/bin/bash
# Autor: Rodrigo47363
# Descripción: Selector dinámico de temas Rofi para dotfiles

# Define la ruta absoluta de la carpeta donde están tus temas
THEME_DIR="$(pwd)" 
CONFIG_FILE="$HOME/.config/rofi/config.rasi"

# 1. Lista los archivos .rofi, quita la extensión para que el menú se vea limpio
# 2. Usa el propio rofi para mostrar el menú de selección
selected_theme=$(ls -1 "$THEME_DIR" | grep '\.rofi$' | sed 's/\.rofi$//' | rofi -dmenu -i -p "󰄛 Theme:" -theme "$CONFIG_FILE")

# Si el usuario seleccionó un tema y no presionó Escape
if [[ -n "$selected_theme" ]]; then
    # Crea un enlace simbólico forzado hacia el archivo de configuración principal
    ln -sf "$THEME_DIR/${selected_theme}.rofi" "$CONFIG_FILE"
    
    # Imprime un mensaje en la terminal (útil si lo corres sin atajo de teclado)
    echo -e "\e[32m[+] Rofi theme successfully updated to: $selected_theme\e[0m"
    
    # Opcional: Notificación del sistema
    notify-send "Rofi Config" "Tema actualizado a: $selected_theme" -u low
else
    echo -e "\e[31m[-] Selección cancelada.\e[0m"
fi
