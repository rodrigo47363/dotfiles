#!/usr/bin/env bash
# ==============================================================================
# Polybar Universal Smart Launcher (State-Aware & Crash-Proof)
# ==============================================================================

# 1. Terminar instancias previas de forma estricta
killall -q polybar 2>/dev/null
pkill -u "$UID" -x polybar 2>/dev/null

# Esperar a que todos los procesos mueran
while pgrep -u "$UID" -x polybar >/dev/null; do sleep 0.1; done

export DISPLAY="${DISPLAY:-:0}"
export XAUTHORITY="${XAUTHORITY:-$HOME/.Xauthority}"
export PATH="$HOME/.local/bin:$PATH"

MODE_FILE="$HOME/.config/polybar/current_mode"

# ==============================================================================
# 2. AUTODETECCIÓN DINÁMICA DE HARDWARE (PORTABILIDAD UNIVERSAL)
# ==============================================================================
# Tarjeta de red inalámbrica (Wi-Fi)
export WIRELESS_IFACE=$(ip -o link show 2>/dev/null | awk -F': ' '{print $2}' | grep -E '^wl' | head -n 1)
[ -z "$WIRELESS_IFACE" ] && export WIRELESS_IFACE=$(nmcli -t -f DEVICE,TYPE dev 2>/dev/null | grep ':wifi$' | cut -d: -f1 | head -n 1)
[ -z "$WIRELESS_IFACE" ] && export WIRELESS_IFACE="wlan0"

# Tarjeta de red cableada (Ethernet)
export WIRED_IFACE=$(ip -o link show 2>/dev/null | awk -F': ' '{print $2}' | grep -E '^en|^eth' | head -n 1)
[ -z "$WIRED_IFACE" ] && export WIRED_IFACE=$(nmcli -t -f DEVICE,TYPE dev 2>/dev/null | grep ':ethernet$' | cut -d: -f1 | head -n 1)
[ -z "$WIRED_IFACE" ] && export WIRED_IFACE="eth0"

# Batería y Adaptador de Corriente (Laptops vs Desktop/VMs)
export BATTERY_NAME=$(ls -1 /sys/class/power_supply/ 2>/dev/null | grep -E '^BAT' | head -n 1)
[ -z "$BATTERY_NAME" ] && export BATTERY_NAME="BAT1"

export ADAPTER_NAME=$(ls -1 /sys/class/power_supply/ 2>/dev/null | grep -E '^AC|^ADP' | head -n 1)
[ -z "$ADAPTER_NAME" ] && export ADAPTER_NAME="ACAD"

# Controladora de brillo (Intel, AMD, ACPI)
export BACKLIGHT_CARD=$(ls -1 /sys/class/backlight/ 2>/dev/null | head -n 1)
[ -z "$BACKLIGHT_CARD" ] && export BACKLIGHT_CARD="intel_backlight"

# 3. Detección Inteligente del Modo Activo
if [ -n "$1" ]; then
    CONFIG_FILE="$1"
    BAR_NAME="${2:-parrot}"
    if [[ "$CONFIG_FILE" == *"win11.ini"* ]]; then
        BAR_NAME="win11"
        echo "win11" > "$MODE_FILE"
    elif [[ "$CONFIG_FILE" == *"win10.ini"* ]]; then
        BAR_NAME="win10"
        echo "win10" > "$MODE_FILE"
    else
        BAR_NAME="parrot"
        echo "parrot" > "$MODE_FILE"
    fi
else
    # Si no se pasan argumentos (bspwm restart / sxhkd reload), recordar el modo actual
    current_mode=""
    [ -f "$MODE_FILE" ] && current_mode=$(cat "$MODE_FILE" 2>/dev/null)
    
    if [ -z "$current_mode" ]; then
        if grep -q "windows_11" "$HOME/.config/rofi/config.rasi" 2>/dev/null; then
            current_mode="win11"
        elif grep -q "windows_10" "$HOME/.config/rofi/config.rasi" 2>/dev/null; then
            current_mode="win10"
        else
            current_mode="parrot"
        fi
    fi

    if [ "$current_mode" = "win11" ]; then
        CONFIG_FILE="$HOME/.config/polybar/win11.ini"
        BAR_NAME="win11"
    elif [ "$current_mode" = "win10" ]; then
        CONFIG_FILE="$HOME/.config/polybar/win10.ini"
        BAR_NAME="win10"
    else
        CONFIG_FILE="$HOME/.config/polybar/config.ini"
        BAR_NAME="parrot"
    fi
fi

# 3.5. Limpieza asimétrica de márgenes en BSPWM (Evita saltos y rebotes de ventanas)
if command -v bspc >/dev/null 2>&1; then
    for m in $(bspc query -M 2>/dev/null); do
        if [ "$BAR_NAME" = "win11" ] || [ "$BAR_NAME" = "win10" ]; then
            # Barra inferior: solo limpiar margen superior (evita que las ventanas salten hacia abajo)
            bspc config -m "$m" top_padding 0 2>/dev/null
        else
            # Barra superior: solo limpiar margen inferior (evita que las ventanas salten hacia arriba)
            bspc config -m "$m" bottom_padding 0 2>/dev/null
        fi
    done
fi

# 4. Lanzar barra en sesión independiente y desasociada (Soporte Multimonitor)
if command -v xrandr >/dev/null 2>&1; then
    monitors=$(xrandr --query 2>/dev/null | grep " connected" | cut -d" " -f1)
    if [ -n "$monitors" ]; then
        for m in $monitors; do
            MONITOR=$m setsid -f polybar "$BAR_NAME" -c "$CONFIG_FILE" > /tmp/polybar.log 2>&1 < /dev/null
        done
    else
        setsid -f polybar "$BAR_NAME" -c "$CONFIG_FILE" > /tmp/polybar.log 2>&1 < /dev/null
    fi
else
    setsid -f polybar "$BAR_NAME" -c "$CONFIG_FILE" > /tmp/polybar.log 2>&1 < /dev/null
fi

echo "Polybar [$BAR_NAME] cargada desde $CONFIG_FILE (Hardware detectado: WLAN=$WIRELESS_IFACE, ETH=$WIRED_IFACE, BAT=$BATTERY_NAME, BRILLO=$BACKLIGHT_CARD)."
