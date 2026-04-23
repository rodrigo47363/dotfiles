#!/bin/bash
# Autor: Rodrigo47363
# Descripción: Selector dinámico universal de temas Rofi (.rofi y .rasi)

THEME_DIR="$HOME/.config/rofi/themes"
CONFIG_FILE="$HOME/.config/rofi/config.rasi"

# 1. Menú de selección: Captura tanto .rofi como .rasi, manteniendo la extensión
selected_file=$(ls -1 "$THEME_DIR" | grep -E '\.(rofi|rasi)$' | rofi -dmenu -i -p "󰄛 Theme:")

# 2. Lógica de inyección segura
if [[ -n "$selected_file" ]]; then
    
    # Construimos la ruta absoluta completa hacia el archivo seleccionado
    NEW_THEME_PATH="${THEME_DIR}/${selected_file}"
    
    # Reemplazo dinámico o inyección de nueva línea
    if grep -Eq "^[[:space:]]*@theme" "$CONFIG_FILE"; then
        sed -i "s|^[[:space:]]*@theme.*|@theme \"${NEW_THEME_PATH}\"|" "$CONFIG_FILE"
    else
        echo "@theme \"${NEW_THEME_PATH}\"" >> "$CONFIG_FILE"
    fi
    
    # Feedback en terminal y sistema
    echo -e "\e[32m[+] Rofi theme successfully updated to: $selected_file\e[0m"
    notify-send "Rofi Config" "Tema actualizado a: $selected_file" -u low

else
    echo -e "\e[31m[-] Selección cancelada.\e[0m"
fi
