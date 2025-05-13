#!/bin/bash

# Configuración de íconos (Nerd Fonts)
ICON_WIFI=" "  # WiFi
ICON_ETH=" "   # Ethernet
ICON_OFF=" "   # Sin conexión

# Obtener la IP activa (WiFi o Ethernet)
ACTIVE_IP=$(ip -4 addr show wlp0s20f3 2>/dev/null | grep -oP 'inet \K[\d.]+')
[ -z "$ACTIVE_IP" ] && ACTIVE_IP=$(ip -4 addr show enp6s0 2>/dev/null | grep -oP 'inet \K[\d.]+')

# Determinar el tipo de conexión y mostrar resultado
if ip link show wlp0s20f3 | grep -q "state UP" && [ -n "$ACTIVE_IP" ]; then
    echo "$ICON_WIFI$ACTIVE_IP"
elif ip link show enp6s0 | grep -q "state UP" && [ -n "$ACTIVE_IP" ]; then
    echo "$ICON_ETH$ACTIVE_IP"
else
    echo "$ICON_OFF"
fi
