#!/usr/bin/env bash
# ==============================================================================
# Nitro Toggle Script - High-Performance Rust Native Switcher
# Sincronizado para Acer Nitro 5 AN515-55 / Parrot OS
# ==============================================================================

toggled=$(acersense fan --toggle 2>/dev/null | grep -o "auto\|max" || echo "auto")

if [ "$toggled" = "max" ]; then
    notify-send -u critical -i "preferences-system-power" "NitroSense Turbo" "🌀 Ventiladores: TURBO MAX (5400 / 6120 RPM)" 2>/dev/null || true
else
    notify-send -u normal -i "preferences-system-power" "NitroSense Auto" "🍃 Ventiladores: MODO AUTOMÁTICO (Silencioso)" 2>/dev/null || true
fi

