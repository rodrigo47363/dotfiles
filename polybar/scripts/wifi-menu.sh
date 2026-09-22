#!/bin/bash
# ~/.config/polybar/scripts/wifi-menu.sh
# Menú de Wi-Fi interactivo Windows 11 Fluent Flyout
# Diseñado para interacción 100% con ratón (un solo clic para conectar) y teclado

# Acción rápida: Toggle Wi-Fi (On / Off instantáneo para clic derecho)
if [ "$1" = "toggle" ]; then
    if [ "$(nmcli radio wifi)" = "enabled" ]; then
        nmcli radio wifi off
        notify-send -i network-wireless-disconnected -u low "Wi-Fi 󰤭" "Radio Wi-Fi desactivado"
    else
        nmcli radio wifi on
        notify-send -i network-wireless -u normal "Wi-Fi " "Radio Wi-Fi activado. Conectando..."
    fi
    exit 0
fi

# Acción rápida: Editor de red en terminal flotante (nmtui)
if [ "$1" = "nmtui" ]; then
    /opt/kitty/bin/kitty -e nmtui &
    exit 0
fi

# 0. Single instance toggle: si ya está abierto, cerrarlo
if pgrep -f "rofi.*(Wi-Fi|wifi)" > /dev/null 2>&1; then
    pkill -f "rofi.*(Wi-Fi|wifi)"
    exit 0
fi
pkill -x rofi 2>/dev/null

# Tema Rofi Flyout vertical Windows 11 Fluent (esquina inferior derecha)
ROFI_WIFI_THEME='
window {
    width: 440px;
    location: southeast;
    anchor: southeast;
    x-offset: -12px;
    y-offset: -52px;
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
    font: "Hack Nerd Font 10";
    text-color: #60cdff;
    margin: 0px 6px 0px 0px;
    vertical-align: 0.5;
}
entry {
    font: "Segoe UI Variable 10";
    text-color: #ffffff;
    placeholder: "Buscar red Wi-Fi...";
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
    font: "Segoe UI Variable 10";
    background-color: transparent;
    text-color: inherit;
    cursor: pointer;
}
'

ROFI_PASS_THEME='
window {
    width: 380px;
    location: southeast;
    anchor: southeast;
    x-offset: -12px;
    y-offset: -52px;
    border: 1px;
    border-color: #ffffff20;
    border-radius: 12px;
    background-color: #1f1f1ff6;
    padding: 16px;
}
mainbox {
    children: [ inputbar ];
    spacing: 0px;
    background-color: transparent;
}
inputbar {
    background-color: #2b2b2b;
    border: 1px;
    border-color: #383838;
    border-radius: 18px;
    padding: 8px 14px;
    children: [ prompt, entry ];
}
prompt {
    font: "Hack Nerd Font 10";
    text-color: #60cdff;
    margin: 0px 6px 0px 0px;
    vertical-align: 0.5;
}
entry {
    font: "Segoe UI Variable 10";
    text-color: #ffffff;
    placeholder: "Introduce la contraseña...";
    placeholder-color: #8c8c8c;
    vertical-align: 0.5;
}
'

# 1. Comprobar si el radio Wi-Fi está apagado
if [ "$(nmcli radio wifi)" = "disabled" ]; then
    ACCION=$(printf "󰤨  Activar Wi-Fi\n󰅖  Cancelar" | rofi -dmenu -i \
        -theme-str "$ROFI_WIFI_THEME" \
        -hover-select -me-select-entry '' -me-accept-entry MousePrimary \
        -p "󰤭")
    if [ "$ACCION" = "󰤨  Activar Wi-Fi" ]; then
        nmcli radio wifi on
        notify-send "Wi-Fi " "Wi-Fi activado. Buscando redes..."
    fi
    exit 0
fi

# 2. Rescan asíncrono en segundo plano
nmcli dev wifi rescan > /dev/null 2>&1 &

# 3. Detectar red conectada actualmente
CONNECTED_SSID=$(nmcli -t -f ACTIVE,SSID dev wifi | awk -F: '$1=="yes"{print $2; exit}')

# 4. Parseo de redes disponibles
NETWORKS=$(nmcli -t -f SSID,FREQ,SIGNAL,SECURITY dev wifi list | awk -F: -v connected="$CONNECTED_SSID" '
    $1 != "" {
        ssid=$1; freq=$2; sig=$3; sec=$4;
        if (!seen[ssid]++) {
            band = (freq >= 4900 ? "5G" : "2.4G")
            lock = (sec ~ /WPA|WEP|802\.1X/ ? "🔒" : "🔓")
            status = (ssid == connected ? " ✔" : "")
            if (sig >= 75) icon = "󰤨";
            else if (sig >= 50) icon = "󰤥";
            else if (sig >= 25) icon = "󰤢";
            else icon = "󰤟";
            printf "%s  %-20s  |  %s  %s%%  %s%s\n", icon, ssid, band, sig, lock, status
        }
    }')

# Opciones de control rápido
EXTRA_OPTIONS=""
if [ -n "$CONNECTED_SSID" ]; then
    EXTRA_OPTIONS="󰌙  Desconectar ($CONNECTED_SSID)\n󰤮  Desactivar Wi-Fi\n"
else
    EXTRA_OPTIONS="󰤮  Desactivar Wi-Fi\n"
fi

if [ -n "$NETWORKS" ]; then
    MENU=$(printf "%b%s\n󰑐  Escanear redes" "$EXTRA_OPTIONS" "$NETWORKS")
else
    MENU=$(printf "%b󰑐  Escanear redes" "$EXTRA_OPTIONS")
fi

# 5. Interfaz gráfica: rofi maneja la selección con soporte 100% ratón
CHOICE_LINE=$(printf "%s\n" "$MENU" | rofi -dmenu -i \
    -theme-str "$ROFI_WIFI_THEME" \
    -hover-select \
    -me-select-entry '' \
    -me-accept-entry MousePrimary \
    -p "󰤨")

# Control de interrupción (ESC o clic fuera)
[ -z "$CHOICE_LINE" ] && exit 0

# 6. Manejo de acciones de control rápido
if [[ "$CHOICE_LINE" == *"Desconectar"* ]]; then
    DEV=$(nmcli -t -f DEVICE,TYPE dev | awk -F: '$2=="wifi"{print $1; exit}')
    [ -z "$DEV" ] && DEV="wlp0s20f3"
    nmcli dev disconnect "$DEV" > /dev/null 2>&1
    notify-send "Wi-Fi " "Desconectado de $CONNECTED_SSID"
    exit 0
fi

if [[ "$CHOICE_LINE" == *"Desactivar Wi-Fi"* ]]; then
    nmcli radio wifi off
    notify-send "Wi-Fi 󰤭" "Wi-Fi desactivado"
    exit 0
fi

if [[ "$CHOICE_LINE" == *"Escanear"* ]]; then
    nmcli dev wifi rescan > /dev/null 2>&1
    sleep 0.8
    exec "$0"
fi

# 7. Extracción limpia del SSID
SSID=$(echo "$CHOICE_LINE" | awk -F'  \\|  ' '{print $1}' | sed -E 's/^[ 󰤨󰤥󰤢󰤟]+//; s/[ ]+$//')
[ -z "$SSID" ] && exit 0

# 8. Lógica de Conexión
SAVED=$(nmcli -t -f NAME connection show | grep -Fx -- "$SSID" | head -n1)

if [ -n "$SAVED" ]; then
    notify-send "Wi-Fi " "Conectando al perfil guardado: $SSID..."
    if nmcli connection up "$SAVED" > /dev/null 2>&1; then
        notify-send "Wi-Fi ✅" "Conexión exitosa a $SSID"
        exit 0
    fi
fi

# Intentar asociación directa con perfil existente o red abierta
notify-send "Wi-Fi " "Conectando a $SSID..."
if nmcli dev wifi connect "$SSID" > /dev/null 2>&1; then
    notify-send "Wi-Fi ✅" "Conexión exitosa a $SSID"
    exit 0
fi

# Si requiere autenticación y no conectó automáticamente, solicitar contraseña
if echo "$CHOICE_LINE" | grep -q "🔒"; then
    PASSWORD=$(rofi -dmenu -password -i \
        -theme-str "$ROFI_PASS_THEME" \
        -p "🔑")
    
    [ -z "$PASSWORD" ] && exit 0
    
    notify-send "Wi-Fi " "Autenticando contra $SSID..."
    if nmcli dev wifi connect "$SSID" password "$PASSWORD" > /dev/null 2>&1; then
        notify-send "Wi-Fi ✅" "Conectado. Credenciales guardadas."
    else
        notify-send -u critical "Wi-Fi ❌" "Error de autenticación. Revisa la contraseña."
    fi
else
    notify-send -u critical "Wi-Fi ❌" "El AP rechazó la asociación."
fi
