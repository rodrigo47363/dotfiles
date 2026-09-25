#!/bin/bash
# Autor: Rodrigo47363
# Descripción: Selector dinámico universal de temas Rofi con Transformación de Entorno (Undercover Engine)

THEME_DIR="$HOME/.config/rofi/themes"
CONFIG_FILE="$HOME/.config/rofi/config.rasi"
GTK_SETTINGS="$HOME/.config/gtk-3.0/settings.ini"

# Si se pasa un argumento directo (ej: windows_11.rofi), lo toma directamente sin abrir dmenu
if [[ -n "$1" ]]; then
    selected_file="$1"
else
    # 1. Menú de selección interactivo
    selected_file=$(ls -1 "$THEME_DIR" | grep -E '\.(rofi|rasi)$' | grep -viE "^_|rounded" | rofi -dmenu -i -p "󰄛 Theme:")
fi

# 2. Validación de Estado
if [[ -z "$selected_file" ]]; then
    echo -e "\e[31m[-] Selección cancelada. No se hicieron cambios.\e[0m"
    exit 0
fi

# Fallback si se escribe algo inválido
if [[ ! -f "$THEME_DIR/$selected_file" ]]; then
    echo -e "\e[33m[!] El tema ingresado no fue encontrado.\e[0m"
    RANDOM_THEME=$(ls -1 "$THEME_DIR" | grep -E '\.(rofi|rasi)$' | grep -viE "^_|rounded" | shuf -n 1)
    if [[ -z "$RANDOM_THEME" ]]; then
        echo -e "\e[31m[!] Error Crítico: No hay temas válidos.\e[0m"
        exit 1
    fi
    selected_file="$RANDOM_THEME"
fi

# 3. Inyección en Rofi
NEW_THEME_PATH="${THEME_DIR}/${selected_file}"
if grep -Eq "^[[:space:]]*@theme" "$CONFIG_FILE"; then
    sed -i "s|^[[:space:]]*@theme.*|@theme \"${NEW_THEME_PATH}\"|" "$CONFIG_FILE"
else
    echo "@theme \"${NEW_THEME_PATH}\"" >> "$CONFIG_FILE"
fi

# 4. Transformación de Interfaz Completa (Undercover / Full Windows 10 & 11 Mode)
if [[ "$selected_file" == "windows_11.rofi" ]]; then
    echo -e "\e[34m[*] Activando Modo Completo Windows 11 (Fluent Mica)...\e[0m"
    
    # A. Wallpaper oficial Bloom Dark
    WIN11_WALLPAPER="$HOME/Downloads/Windows11_Assets/Wallpapers/Wallpaper/Windows/img19.jpg"
    if [[ -f "$WIN11_WALLPAPER" ]]; then
        feh --no-fehbg --bg-fill "$WIN11_WALLPAPER" 2>/dev/null
        echo "feh --no-fehbg --bg-fill '$WIN11_WALLPAPER'" > "$HOME/.fehbg"
    fi

    # B. Iconos y Tipografía GTK
    if [[ -f "$GTK_SETTINGS" ]]; then
        sed -i 's/^gtk-icon-theme-name=.*/gtk-icon-theme-name=We10X-dark/' "$GTK_SETTINGS"
        sed -i 's/^gtk-font-name=.*/gtk-font-name=Segoe UI Variable 10/' "$GTK_SETTINGS"
    fi

    # C. Bordes bspwm
    bspc config focused_border_color "#60cdff" 2>/dev/null
    bspc config normal_border_color "#202020" 2>/dev/null

    # D. Barra de Tareas Polybar Windows 11 (Borde inferior, centro)
    if [[ -f "$HOME/.config/polybar/win11.ini" ]]; then
        "$HOME/.config/polybar/launch.sh" "$HOME/.config/polybar/win11.ini" "win11" >/dev/null 2>&1
    fi

    # E. Audio oficial de Windows 11
    paplay "$HOME/Downloads/Windows11_Assets/Sounds/Windows Notify Messaging.wav" 2>/dev/null &

    notify-send "Windows 11" "Modo Windows 11 activado al 100% (Fluent Mica)" -u normal

elif [[ "$selected_file" == "windows_10.rofi" ]]; then
    echo -e "\e[34m[*] Activando Modo Completo Windows 10 (Metro UI)...\e[0m"

    # A. Wallpaper oficial Hero 4K de Windows 10
    WIN10_WALLPAPER="$HOME/Downloads/Windows10_Assets/Wallpapers/4K/Wallpaper/Windows/img0_3840x2160.jpg"
    if [[ ! -f "$WIN10_WALLPAPER" ]]; then
        WIN10_WALLPAPER="$HOME/Downloads/Windows10_Assets/Wallpapers/Wallpaper/Windows/img0.jpg"
    fi
    if [[ -f "$WIN10_WALLPAPER" ]]; then
        feh --no-fehbg --bg-fill "$WIN10_WALLPAPER" 2>/dev/null
        echo "feh --no-fehbg --bg-fill '$WIN10_WALLPAPER'" > "$HOME/.fehbg"
    fi

    # B. Iconos y Tipografía GTK
    if [[ -f "$GTK_SETTINGS" ]]; then
        sed -i 's/^gtk-icon-theme-name=.*/gtk-icon-theme-name=We10X-dark/' "$GTK_SETTINGS"
        sed -i 's/^gtk-font-name=.*/gtk-font-name=Segoe UI 10/' "$GTK_SETTINGS"
    fi

    # C. Bordes bspwm
    bspc config focused_border_color "#0078d7" 2>/dev/null
    bspc config normal_border_color "#171717" 2>/dev/null

    # D. Polybar Windows 10 (Borde inferior, Metro)
    if [[ -f "$HOME/.config/polybar/win10.ini" ]]; then
        "$HOME/.config/polybar/launch.sh" "$HOME/.config/polybar/win10.ini" "win10" >/dev/null 2>&1
    fi

    # E. Audio oficial de Windows 10
    paplay "$HOME/Downloads/Windows10_Assets/Sounds/Windows Navigation Start.wav" 2>/dev/null &

    notify-send "Windows 10" "Modo Windows 10 activado al 100% (Metro UI)" -u normal

else
    # --- RESTAURACIÓN AUTOMÁTICA DE ENTORNO PENTESTING / HACKER ---
    DEFAULT_WALLPAPER="$HOME/Pictures/Wallpapers/rodrigo47363.png"
    if [[ -f "$DEFAULT_WALLPAPER" ]]; then
        feh --no-fehbg --bg-fill "$DEFAULT_WALLPAPER" 2>/dev/null
        echo "feh --no-fehbg --bg-fill '$DEFAULT_WALLPAPER'" > "$HOME/.fehbg"
    fi

    if [[ -f "$GTK_SETTINGS" ]]; then
        sed -i 's/^gtk-icon-theme-name=.*/gtk-icon-theme-name=Flat-Remix-Green-Dark/' "$GTK_SETTINGS"
        sed -i 's/^gtk-font-name=.*/gtk-font-name=Noto Sans,  10/' "$GTK_SETTINGS"
    fi

    bspc config focused_border_color "#81a1c1" 2>/dev/null
    bspc config normal_border_color "#4c566a" 2>/dev/null

    if [[ -f "$HOME/.config/polybar/config.ini" ]]; then
        "$HOME/.config/polybar/launch.sh" "$HOME/.config/polybar/config.ini" "parrot" >/dev/null 2>&1
    fi

    notify-send "Rofi Config" "Tema restaurado a: $selected_file" -u low
fi

# 5. Asegurar emulador de tecla Windows (Super solitaria abre el Menú de Inicio)
if which xcape >/dev/null 2>&1; then
    if ! pgrep -x xcape >/dev/null; then
        xcape -e 'Super_L=Alt_L|F12' -e 'Super_R=Alt_L|F12' -t 500 &
    fi
fi

echo -e "\e[32m[+] Entorno sincronizado exitosamente con: $selected_file\e[0m"
