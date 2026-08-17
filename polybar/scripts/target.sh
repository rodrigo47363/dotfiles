#!/bin/bash

target_file="$HOME/.config/bin/target"

# Manejador de acciones
if [ "$1" = "copy" ]; then
    if [ -f "$target_file" ]; then
        ip_target=$(awk '{print $1}' "$target_file" 2>/dev/null)
        if [ -n "$ip_target" ]; then
            echo -n "$ip_target" | xclip -sel clip 2>/dev/null
            notify-send -u low -i security-high "Target IP" "Copiado al portapapeles: $ip_target" 2>/dev/null
        fi
    fi
    exit 0
elif [ "$1" = "clear" ]; then
    > "$target_file"
    notify-send -u low "Target" "Objetivo limpiado" 2>/dev/null
    exit 0
fi

# Salida para Polybar
if [ -f "$target_file" ]; then
    ip_target=$(awk '{print $1}' "$target_file" 2>/dev/null)
    name_target=$(awk '{print $2}' "$target_file" 2>/dev/null)

    if [ -n "$ip_target" ]; then
        if ping -c 1 -W 1 "$ip_target" > /dev/null 2>&1; then
            icon="%{F#98c379}󰓾%{F-}"
            text_color="%{F#e5e9f0}"
        else
            icon="%{F#e06c75}󰓾%{F-}"
            text_color="%{F#707880}"
        fi

        if [ -n "$name_target" ]; then
            echo "$icon $text_color$ip_target - $name_target%{F-}"
        else
            echo "$icon $text_color$ip_target%{F-}"
        fi
    else
        echo "%{F#5c6370}󰓾 No target%{F-}"
    fi
else
    echo "%{F#5c6370}󰓾 No target%{F-}"
fi
