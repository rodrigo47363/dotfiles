#!/bin/bash
# Autor: Rodrigo47363
# Descripción: Selector dinámico universal de temas Rofi con Fallback Aleatorio (Randomizer)

THEME_DIR="$HOME/.config/rofi/themes"
CONFIG_FILE="$HOME/.config/rofi/config.rasi"

# 1. Menú de selección (Ignora plantillas '_' y temas 'rounded')
selected_file=$(ls -1 "$THEME_DIR" | grep -E '\.(rofi|rasi)$' | grep -viE "^_|rounded" | rofi -dmenu -i -p "󰄛 Theme:")

# 2. Validación de Estado (Manejo de errores y cancelaciones)

# Caso A: El usuario presionó Escape (La variable está vacía)
if [[ -z "$selected_file" ]]; then
    echo -e "\e[31m[-] Selección cancelada. No se hicieron cambios.\e[0m"
    exit 0
fi

# Caso B: El usuario escribió algo que no existe (Fallback Aleatorio)
if [[ ! -f "$THEME_DIR/$selected_file" ]]; then
    echo -e "\e[33m[!] El tema ingresado no fue encontrado.\e[0m"
    
    # Generar selección aleatoria usando 'shuf' (Mismo filtro de exclusión aplicado aquí)
    RANDOM_THEME=$(ls -1 "$THEME_DIR" | grep -E '\.(rofi|rasi)$' | grep -viE "^_|rounded" | shuf -n 1)
    
    # Doble check de seguridad: ¿Qué pasa si la carpeta de temas está vacía o todo está filtrado?
    if [[ -z "$RANDOM_THEME" ]]; then
        echo -e "\e[31m[!] Error Crítico: No hay temas válidos en el directorio tras aplicar los filtros.\e[0m"
        notify-send "Rofi Error" "Directorio vacío o temas excluidos por los filtros" -u critical
        exit 1
    fi
    
    echo -e "\e[35m[*] Aplicando tema ALEATORIO de rescate: $RANDOM_THEME\e[0m"
    selected_file="$RANDOM_THEME"
fi

# 3. Lógica de inyección segura
NEW_THEME_PATH="${THEME_DIR}/${selected_file}"

if grep -Eq "^[[:space:]]*@theme" "$CONFIG_FILE"; then
    sed -i "s|^[[:space:]]*@theme.*|@theme \"${NEW_THEME_PATH}\"|" "$CONFIG_FILE"
else
    echo "@theme \"${NEW_THEME_PATH}\"" >> "$CONFIG_FILE"
fi

# Feedback en terminal y sistema
echo -e "\e[32m[+] Rofi theme successfully updated to: $selected_file\e[0m"
notify-send "Rofi Config" "Tema actualizado a: $selected_file" -u low
