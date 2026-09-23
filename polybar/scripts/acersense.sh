#!/usr/bin/env bash
# Polybar module for AcerSense Pro telemetry (Rust Native Backend)

# Prioritize local user binaries over stale system-wide installations
export PATH="$HOME/.local/bin:$PATH"

GUI_BIN="$HOME/.local/bin/acersense-gui"
if [ ! -x "$GUI_BIN" ]; then
    GUI_BIN="$(command -v acersense-gui 2>/dev/null || echo "acersense-gui")"
fi

CLI_BIN="$HOME/.local/bin/acersense"
if [ ! -x "$CLI_BIN" ]; then
    CLI_BIN="$(command -v acersense 2>/dev/null || echo "acersense")"
fi

if [ "$1" = "toggle" ]; then
    toggled=$("$CLI_BIN" fan --toggle 2>/dev/null | grep -o "auto\|max" || echo "auto")
    if [ "$toggled" = "max" ]; then
        notify-send -u critical -i "preferences-system-power" "NitroSense Turbo" "🌀 Ventiladores: MODO MAX TURBO" 2>/dev/null || true
    else
        notify-send -u normal -i "preferences-system-power" "NitroSense Auto" "🍃 Ventiladores: MODO AUTOMÁTICO" 2>/dev/null || true
    fi
    exit 0
elif [ "$1" = "gui" ]; then
    pkill -x acersense-gui || "$GUI_BIN" &
    exit 0
elif [ "$1" = "battery" ]; then
    info=$(acpi -b 2>/dev/null || echo "Batería disponible")
    notify-send -i "battery-good" -u normal "Diagnóstico de Batería" "$info"
    exit 0
fi

# Ultra-fast native execution in 2ms
"$CLI_BIN" --polybar

