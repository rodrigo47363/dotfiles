#!/usr/bin/env bash
# ==============================================================================
# BLUETOOTH INTERACTIVE MENU - ROFI FLUENT FLYOUT
# Compatible con BlueZ (bluetoothctl), Blueman y control por hardware RFKILL
# ==============================================================================

# 0. Single instance toggle: si ya está abierto, cerrarlo
if pgrep -f "rofi.*(Bluetooth|bluetooth)" > /dev/null 2>&1; then
    pkill -f "rofi.*(Bluetooth|bluetooth)"
    exit 0
fi
pkill -x rofi 2>/dev/null

# 1. Detección de Posicionamiento según Modo Activo de Polybar
MODE_FILE="$HOME/.config/polybar/current_mode"
current_mode="parrot"
[ -f "$MODE_FILE" ] && current_mode=$(cat "$MODE_FILE" 2>/dev/null)

if [ "$current_mode" = "win11" ] || [ "$current_mode" = "win10" ]; then
    LOCATION="southeast"
    ANCHOR="southeast"
    Y_OFFSET="-52px"
else
    LOCATION="northeast"
    ANCHOR="northeast"
    Y_OFFSET="38px"
fi

# 2. Tema Rofi Fluent Flyout
ROFI_BT_THEME="
window {
    width: 440px;
    location: $LOCATION;
    anchor: $ANCHOR;
    x-offset: -12px;
    y-offset: $Y_OFFSET;
    border: 1px;
    border-color: #ffffff20;
    border-radius: 12px;
    background-color: #1f1f1ff6;
    padding: 14px;
}
mainbox {
    children: [ inputbar, listview ];
    spacing: 8px;
    background-color: transparent;
}
inputbar {
    background-color: #2b2b2b;
    border: 1px;
    border-color: #383838;
    border-radius: 18px;
    padding: 6px 14px;
    margin: 0px 0px 4px 0px;
    children: [ prompt, entry ];
}
prompt {
    font: \"Hack Nerd Font 10\";
    text-color: #60cdff;
    margin: 0px 6px 0px 0px;
    vertical-align: 0.5;
}
entry {
    font: \"Segoe UI Variable 10\";
    text-color: #ffffff;
    placeholder: \"Dispositivos Bluetooth...\";
    placeholder-color: #8c8c8c;
    vertical-align: 0.5;
}
listview {
    columns: 1;
    lines: 7;
    layout: vertical;
    fixed-columns: true;
    spacing: 4px;
    scrollbar: false;
    background-color: transparent;
}
element {
    orientation: horizontal;
    padding: 9px 12px;
    border-radius: 8px;
    cursor: pointer;
    background-color: transparent;
}
element normal.normal {
    background-color: transparent;
    text-color: #ffffff;
}
element selected.normal {
    background-color: #ffffff18;
    text-color: #60cdff;
    border: 1px;
    border-color: #60cdff44;
}
element-icon {
    size: 0px;
    enabled: false;
}
element-text {
    horizontal-align: 0.0;
    vertical-align: 0.5;
    font: \"Segoe UI Variable 10\";
    background-color: transparent;
    text-color: inherit;
    cursor: pointer;
}
"

# 3. Comprobar si Bluetooth está desactivado (apagado / bloqueado)
is_off=false
if rfkill list -n -o SOFT bluetooth 2>/dev/null | grep -qw "blocked"; then
    is_off=true
elif command -v bluetoothctl >/dev/null 2>&1; then
    if [ "$(bluetoothctl show 2>/dev/null | grep -i "Powered:" | awk '{print $2}')" != "yes" ]; then
        is_off=true
    fi
fi

if [ "$is_off" = true ]; then
    ACCION=$(printf "󰂯  Activar Bluetooth\n󰅖  Cancelar" | rofi -dmenu -i \
        -theme-str "$ROFI_BT_THEME" \
        -hover-select -me-select-entry '' -me-accept-entry MousePrimary \
        -p "󰂲")
    
    if [ "$ACCION" = "󰂯  Activar Bluetooth" ]; then
        ~/.config/polybar/scripts/bluetooth.sh toggle
    fi
    exit 0
fi

# 4. Caso A: Si BlueZ (bluetoothctl) está disponible en el sistema
if command -v bluetoothctl >/dev/null 2>&1; then
    # Opciones de control rápido
    OPTIONS="󰂲  Desactivar Bluetooth\n󰑐  Escanear dispositivos (8s)\n"

    if command -v blueman-manager >/dev/null 2>&1; then
        OPTIONS+="󰂳  Administrador Gráfico (Blueman)\n"
    fi

    # Dispositivos conectados actualmente
    CONNECTED=$(bluetoothctl devices Connected 2>/dev/null)
    # Todos los dispositivos emparejados
    PAIRED=$(bluetoothctl devices Paired 2>/dev/null)

    DEVICE_ENTRIES=""

    if [ -n "$CONNECTED" ]; then
        while IFS= read -r line; do
            [ -z "$line" ] && continue
            mac=$(echo "$line" | awk '{print $2}')
            name=$(echo "$line" | cut -d' ' -f3-)
            DEVICE_ENTRIES+="󰂱  $name  |  [Conectado] - Desconectar ($mac)\n"
        done <<< "$CONNECTED"
    fi

    if [ -n "$PAIRED" ]; then
        while IFS= read -r line; do
            [ -z "$line" ] && continue
            mac=$(echo "$line" | awk '{print $2}')
            name=$(echo "$line" | cut -d' ' -f3-)
            # Si no está en conectados
            if ! echo "$CONNECTED" | grep -q "$mac"; then
                DEVICE_ENTRIES+="󰂯  $name  |  [Emparejado] - Conectar ($mac)\n"
            fi
        done <<< "$PAIRED"
    fi

    MENU=$(printf "%b%b" "$OPTIONS" "$DEVICE_ENTRIES")

    CHOICE_LINE=$(printf "%b" "$MENU" | rofi -dmenu -i \
        -theme-str "$ROFI_BT_THEME" \
        -hover-select -me-select-entry '' -me-accept-entry MousePrimary \
        -p "󰂯")

    [ -z "$CHOICE_LINE" ] && exit 0

    if [[ "$CHOICE_LINE" == *"Desactivar Bluetooth"* ]]; then
        ~/.config/polybar/scripts/bluetooth.sh toggle
        exit 0
    fi

    if [[ "$CHOICE_LINE" == *"Escanear"* ]]; then
        notify-send -i bluetooth-active-symbolic "Bluetooth 󰑐" "Buscando dispositivos cercanos (8s)..."
        bluetoothctl --timeout 8 scan on >/dev/null 2>&1
        notify-send -i bluetooth "Bluetooth 󰄲" "Escaneo finalizado."
        exec "$0"
    fi

    if [[ "$CHOICE_LINE" == *"Administrador Gráfico"* ]]; then
        blueman-manager &
        exit 0
    fi

    # Manejo de conexión / desconexión por MAC
    TARGET_MAC=$(echo "$CHOICE_LINE" | grep -oE "([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}")
    if [ -n "$TARGET_MAC" ]; then
        if [[ "$CHOICE_LINE" == *"[Conectado]"* ]]; then
            notify-send -i bluetooth "Bluetooth" "Desconectando $TARGET_MAC..."
            bluetoothctl disconnect "$TARGET_MAC" >/dev/null 2>&1
            notify-send -i bluetooth "Bluetooth" "Desconectado exitosamente"
        else
            notify-send -i bluetooth "Bluetooth" "Conectando con $TARGET_MAC..."
            if bluetoothctl connect "$TARGET_MAC" >/dev/null 2>&1; then
                notify-send -i bluetooth "Bluetooth ✅" "Conexión establecida"
            else
                notify-send -u critical -i bluetooth "Bluetooth ❌" "Fallo al conectar dispositivo"
            fi
        fi
    fi
    exit 0
fi

# 5. Caso B: Fallback cuando BlueZ no está instalado
MENU=$(printf "󰂲  Desactivar Bluetooth (RFKILL)\n󰏔  Instalar BlueZ & Blueman (Para emparejar dispositivos)\n󰅖  Cancelar")

CHOICE_LINE=$(printf "%b" "$MENU" | rofi -dmenu -i \
    -theme-str "$ROFI_BT_THEME" \
    -hover-select -me-select-entry '' -me-accept-entry MousePrimary \
    -p "󰂯")

[ -z "$CHOICE_LINE" ] && exit 0

if [[ "$CHOICE_LINE" == *"Desactivar Bluetooth"* ]]; then
    ~/.config/polybar/scripts/bluetooth.sh toggle
elif [[ "$CHOICE_LINE" == *"Instalar BlueZ"* ]]; then
    kitty --title "Instalación de BlueZ y Blueman" -e bash -c 'echo -e "\033[1;34m[+] Instalación del stack Bluetooth (BlueZ + Blueman)...\033[0m\n"; sudo apt update && sudo apt install -y bluez blueman bluez-tools; echo -e "\n\033[1;32m[✓] Paquetes instalados. Habilitando servicio...\033[0m"; sudo systemctl enable --now bluetooth; echo -e "\nListo. Ya puedes emparejar dispositivos. Presiona Enter para salir."; read -r' &
fi
