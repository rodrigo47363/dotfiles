#!/usr/bin/env bash
# Polybar module for AcerSense Pro telemetry (Rust Native Backend)

if [ "$1" = "toggle" ]; then
    toggled=$(acersense fan --toggle 2>/dev/null | grep -o "auto\|max" || echo "auto")
    if [ "$toggled" = "max" ]; then
        notify-send -u critical -i "preferences-system-power" "NitroSense Turbo" "🌀 Ventiladores: MODO MAX TURBO" 2>/dev/null || true
    else
        notify-send -u normal -i "preferences-system-power" "NitroSense Auto" "🍃 Ventiladores: MODO AUTOMÁTICO" 2>/dev/null || true
    fi
    exit 0
elif [ "$1" = "gui" ]; then
    pkill -x acersense-gui || acersense-gui &
    exit 0
fi

# Ultra-fast native execution in 2ms
acersense --polybar

