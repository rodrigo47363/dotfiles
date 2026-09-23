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

# 2. Detección Inteligente del Modo Activo
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

# 3. Lanzar barra en sesión independiente y desasociada
setsid -f polybar "$BAR_NAME" -c "$CONFIG_FILE" > /tmp/polybar.log 2>&1 < /dev/null

echo "Polybar [$BAR_NAME] cargada desde $CONFIG_FILE."
