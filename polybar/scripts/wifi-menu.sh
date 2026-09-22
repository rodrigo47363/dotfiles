#!/bin/bash
# ~/.config/polybar/scripts/wifi-menu.sh
# Menú de Wi-Fi interactivo. Optimizado para evitar pérdida de datos y mejorar feedback.

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

# 0. Toggle & Gestión de procesos Rofi
if pgrep -f "rofi.*Select Wi-Fi" > /dev/null 2>&1; then
    pkill -f "rofi.*Select Wi-Fi"
    exit 0
fi
pkill -x rofi 2>/dev/null

# 1. Comprobar si el radio Wi-Fi está apagado
if [ "$(nmcli radio wifi)" = "disabled" ]; then
    ACCION=$(printf "󰤨  Activar Wi-Fi\n󰅖  Cancelar" | rofi -dmenu -i -p " Wi-Fi Desactivado")
    if [ "$ACCION" = "󰤨  Activar Wi-Fi" ]; then
        nmcli radio wifi on
        notify-send "Wi-Fi " "Wi-Fi activado. Buscando redes..."
    fi
    exit 0
fi

# 2. Rescan asíncrono
nmcli dev wifi rescan > /dev/null 2>&1

# 3. Detectar red conectada actualmente
CONNECTED_SSID=$(nmcli -t -f ACTIVE,SSID dev wifi | awk -F: '$1=="yes"{print $2; exit}')

# 4. Parseo estricto de redes disponibles
NETWORKS=$(nmcli -t -f SSID,FREQ,SIGNAL,SECURITY dev wifi list | awk -F: -v connected="$CONNECTED_SSID" '
    $1 != "" {
        ssid=$1; freq=$2; sig=$3; sec=$4;
        # Evitamos duplicados guardando el SSID en un array
        if (!seen[ssid]++) {
            band = (freq >= 4900 ? "5GHz" : "2.4GHz")
            lock = (sec ~ /WPA|WEP|802\.1X/ ? "🔒" : "🔓")
            status = (ssid == connected ? " ✔" : "")
            # Usamos un delimitador claro para facilitar el corte posterior
            printf "%-25s | %-6s | %s%% | %s%s\n", ssid, band, sig, lock, status
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
    MENU=$(printf "%b%s" "$EXTRA_OPTIONS" "$NETWORKS")
else
    MENU=$(printf "%b󰑐  Escanear de nuevo" "$EXTRA_OPTIONS")
fi

# 5. Interfaz gráfica: rofi maneja la selección
CHOICE_LINE=$(printf "%s\n" "$MENU" | rofi -dmenu -i -p " Select Wi-Fi")

# Control de interrupción (si el usuario presiona ESC)
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

if [[ "$CHOICE_LINE" == *"Escanear de nuevo"* ]]; then
    nmcli dev wifi rescan > /dev/null 2>&1
    exec "$0"
fi

# 7. Extracción limpia del SSID
SSID=$(echo "$CHOICE_LINE" | awk -F' \\| ' '{gsub(/ +$/, "", $1); print $1}')
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
    PASSWORD=$(rofi -dmenu -password -p "🔑 Password for $SSID")
    
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
