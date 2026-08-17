#!/usr/bin/env bash

# ==========================================================
# GPU MONITOR SCRIPT - NVIDIA RTX / CUDA
# ==========================================================

# Manejo de clic para abrir monitor interactivo
if [ "$1" = "open" ]; then
    if command -v kitty >/dev/null 2>&1; then
        kitty -e btop &
    elif command -v alacritty >/dev/null 2>&1; then
        alacritty -e btop &
    fi
    exit 0
fi

# Consultar temperatura y utilización a través de nvidia-smi
gpu_info=$(nvidia-smi --query-gpu=temperature.gpu,utilization.gpu --format=csv,noheader,nounits 2>/dev/null)

if [ -z "$gpu_info" ]; then
    echo "%{F#5c6370}󰢮 GPU Off%{F-}"
    exit 0
fi

temp=$(echo "$gpu_info" | awk -F', ' '{print $1}')
util=$(echo "$gpu_info" | awk -F', ' '{print $2}')

# Determinar color según temperatura
if [ "$temp" -ge 80 ]; then
    icon_color="#e06c75" # Rojo crítico
    temp_color="#e06c75"
elif [ "$temp" -ge 65 ]; then
    icon_color="#e5c07b" # Amarillo advertencia
    temp_color="#e5c07b"
else
    icon_color="#61afef" # Azul / Cyan One Dark
    temp_color="#abb2bf"
fi

if [ -n "$util" ] && [ "$util" -gt 0 ]; then
    echo "%{F$icon_color}󰢮%{F-} %{F$temp_color}${temp}°C%{F-} %{F#56b6c2}${util}%%{F-}"
else
    echo "%{F$icon_color}󰢮%{F-} %{F$temp_color}${temp}°C%{F-}"
fi
