#!/usr/bin/env bash

# Íconos Nerd Font
ICON_WIFI=" "   # WiFi
ICON_ETH=" "    # Ethernet
ICON_OFF=" "    # Sin conexión

# Detectar la interfaz activa que no sea loopback (127.0.0.1)
IFACE=$(ip -o -4 addr show up | awk '$4 !~ /^127\./ {print $2; exit}')

# Obtener la IP asociada a esa interfaz
if [[ -n "$IFACE" ]]; then
    ACTIVE_IP=$(ip -o -4 addr show dev "$IFACE" | awk '{print $4}' | cut -d/ -f1)

    # Mostrar icono según tipo de interfaz
    if [[ "$IFACE" == wl* ]]; then
        echo "$ICON_WIFI $ACTIVE_IP"
    elif [[ "$IFACE" == en* || "$IFACE" == eth* ]]; then
        echo "$ICON_ETH $ACTIVE_IP"
    else
        echo "$ACTIVE_IP"
    fi
else
    echo "$ICON_OFF Disconnected"
fi
