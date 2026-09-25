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

    # B. Iconos, Tipografía, Cursor y Controles GTK
    if [[ -f "$GTK_SETTINGS" ]]; then
        sed -i 's/^gtk-theme-name=.*/gtk-theme-name=Windows 10 Dark/' "$GTK_SETTINGS"
        sed -i 's/^gtk-icon-theme-name=.*/gtk-icon-theme-name=We10X-dark/' "$GTK_SETTINGS"
        sed -i 's/^gtk-font-name=.*/gtk-font-name=Segoe UI Variable 10/' "$GTK_SETTINGS"
        sed -i 's/^gtk-cursor-theme-name=.*/gtk-cursor-theme-name=Windows-10/' "$GTK_SETTINGS"
        sed -i 's/^gtk-decoration-layout=.*/gtk-decoration-layout=:minimize,maximize,close/' "$GTK_SETTINGS"
    fi

    # C. Ventanas BSPWM (Edge-to-edge sin gap, bordes sutiles Windows 11)
    bspc config window_gap 0 2>/dev/null
    bspc config border_width 1 2>/dev/null
    bspc config focused_border_color "#4cc2ff" 2>/dev/null
    bspc config normal_border_color "#202020" 2>/dev/null

    # D. Compositor Picom (Esquinas redondeadas Fluent 8px)
    if [[ -f "$HOME/.config/picom/picom-win11.conf" ]]; then
        cp "$HOME/.config/picom/picom-win11.conf" "$HOME/.config/picom/picom.conf"
        pkill -x picom 2>/dev/null
        picom --config "$HOME/.config/picom/picom.conf" -b 2>/dev/null
    fi

    # E. Terminal Kitty (Windows Terminal Dark & Consolas)
    if [[ -f "$HOME/.config/kitty/color-win11.ini" ]]; then
        cp "$HOME/.config/kitty/color-win11.ini" "$HOME/.config/kitty/color.ini"
        kitty @ set-colors -a "$HOME/.config/kitty/color.ini" 2>/dev/null || true
    fi

    # F. Barra de Tareas Polybar Windows 11 (Borde inferior, centro)
    if [[ -f "$HOME/.config/polybar/win11.ini" ]]; then
        "$HOME/.config/polybar/launch.sh" "$HOME/.config/polybar/win11.ini" "win11" >/dev/null 2>&1
    fi

    # G. Audio oficial y Cursor X11
    xsetroot -cursor_name left_ptr 2>/dev/null &
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

    # B. Iconos, Tipografía, Cursor y Controles GTK
    if [[ -f "$GTK_SETTINGS" ]]; then
        sed -i 's/^gtk-theme-name=.*/gtk-theme-name=Windows 10 Dark/' "$GTK_SETTINGS"
        sed -i 's/^gtk-icon-theme-name=.*/gtk-icon-theme-name=We10X-dark/' "$GTK_SETTINGS"
        sed -i 's/^gtk-font-name=.*/gtk-font-name=Segoe UI 10/' "$GTK_SETTINGS"
        sed -i 's/^gtk-cursor-theme-name=.*/gtk-cursor-theme-name=Windows-10/' "$GTK_SETTINGS"
        sed -i 's/^gtk-decoration-layout=.*/gtk-decoration-layout=:minimize,maximize,close/' "$GTK_SETTINGS"
    fi

    # C. Ventanas BSPWM (Edge-to-edge sin gap, bordes azules Metro UI)
    bspc config window_gap 0 2>/dev/null
    bspc config border_width 1 2>/dev/null
    bspc config focused_border_color "#0078d7" 2>/dev/null
    bspc config normal_border_color "#171717" 2>/dev/null

    # D. Compositor Picom (Esquinas rectas Metro 0px)
    if [[ -f "$HOME/.config/picom/picom-win10.conf" ]]; then
        cp "$HOME/.config/picom/picom-win10.conf" "$HOME/.config/picom/picom.conf"
        pkill -x picom 2>/dev/null
        picom --config "$HOME/.config/picom/picom.conf" -b 2>/dev/null
    fi

    # E. Terminal Kitty (Windows PowerShell Blue & Consolas)
    if [[ -f "$HOME/.config/kitty/color-win10.ini" ]]; then
        cp "$HOME/.config/kitty/color-win10.ini" "$HOME/.config/kitty/color.ini"
        kitty @ set-colors -a "$HOME/.config/kitty/color.ini" 2>/dev/null || true
    fi

    # F. Polybar Windows 10 (Borde inferior, Metro)
    if [[ -f "$HOME/.config/polybar/win10.ini" ]]; then
        "$HOME/.config/polybar/launch.sh" "$HOME/.config/polybar/win10.ini" "win10" >/dev/null 2>&1
    fi

    # G. Audio oficial y Cursor X11
    xsetroot -cursor_name left_ptr 2>/dev/null &
    paplay "$HOME/Downloads/Windows10_Assets/Sounds/Windows Navigation Start.wav" 2>/dev/null &

    notify-send "Windows 10" "Modo Windows 10 activado al 100% (Metro UI)" -u normal

else
    # --- RESTAURACIÓN AUTOMÁTICA DE ENTORNO PENTESTING / HACKER ---
    DEFAULT_WALLPAPER="$HOME/Pictures/Wallpapers/rodrigo47363.png"
    if [[ -f "$DEFAULT_WALLPAPER" ]]; then
        feh --no-fehbg --bg-fill "$DEFAULT_WALLPAPER" 2>/dev/null
        echo "feh --no-fehbg --bg-fill '$DEFAULT_WALLPAPER'" > "$HOME/.fehbg"
    fi

    # A. Iconos, Tipografía, Cursor y Controles GTK
    if [[ -f "$GTK_SETTINGS" ]]; then
        sed -i 's/^gtk-theme-name=.*/gtk-theme-name=ARK-Dark/' "$GTK_SETTINGS"
        sed -i 's/^gtk-icon-theme-name=.*/gtk-icon-theme-name=Flat-Remix-Green-Dark/' "$GTK_SETTINGS"
        sed -i 's/^gtk-font-name=.*/gtk-font-name=Noto Sans,  10/' "$GTK_SETTINGS"
        sed -i 's/^gtk-cursor-theme-name=.*/gtk-cursor-theme-name=Adwaita/' "$GTK_SETTINGS"
        sed -i 's/^gtk-decoration-layout=.*/gtk-decoration-layout=close,maximize,minimize:/' "$GTK_SETTINGS"
    fi

    # B. Ventanas BSPWM (Gaps amplios 12px, bordes tácticos OneDark)
    bspc config window_gap 12 2>/dev/null
    bspc config border_width 2 2>/dev/null
    bspc config focused_border_color "#81a1c1" 2>/dev/null
    bspc config normal_border_color "#4c566a" 2>/dev/null

    # C. Compositor Picom (Esquinas redondeadas 15px)
    if [[ -f "$HOME/.config/picom/picom-normal.conf" ]]; then
        cp "$HOME/.config/picom/picom-normal.conf" "$HOME/.config/picom/picom.conf"
        pkill -x picom 2>/dev/null
        picom --config "$HOME/.config/picom/picom.conf" -b 2>/dev/null
    fi

    # D. Terminal Kitty (Tokyo Night / OneDark)
    if [[ -f "$HOME/.config/kitty/color-onedark.ini" ]]; then
        cp "$HOME/.config/kitty/color-onedark.ini" "$HOME/.config/kitty/color.ini"
        kitty @ set-colors -a "$HOME/.config/kitty/color.ini" 2>/dev/null || true
    fi

    # E. Polybar Pentesting Superior
    if [[ -f "$HOME/.config/polybar/config.ini" ]]; then
        "$HOME/.config/polybar/launch.sh" "$HOME/.config/polybar/config.ini" "parrot" >/dev/null 2>&1
    fi

    notify-send "Rofi Config" "Tema restaurado a: $selected_file" -u low
fi

# 5. Asegurar emulador de tecla Windows (Super solitaria abre el Menú de Inicio)
if which xcape >/dev/null 2>&1; then
    if ! pgrep -x xcape >/dev/null; then
        xcape -e '#133=Super_L|d;#172=Super_L|d;#134=Super_L|d' -t 500 &
    fi
fi

echo -e "\e[32m[+] Entorno sincronizado exitosamente con: $selected_file\e[0m"
