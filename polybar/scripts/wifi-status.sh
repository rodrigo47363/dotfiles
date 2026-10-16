#!/bin/bash
# ~/.config/polybar/scripts/wifi-status.sh
iface=$(nmcli -t -f DEVICE,STATE dev | grep '^wlp0s20f3:' | cut -d: -f2)

if [[ $iface == "connected" ]]; then
    ssid=$(nmcli -t -f NAME connection show --active | grep -v "^lo" | cut -d: -f1)
    signal=$(nmcli -t -f IN-USE,SIGNAL dev wifi | grep '*' | cut -d: -f2)
    icon="直"  # icono conectado
else
    ssid="Disconectado"
    icon="睊"  # icono desconectado
fi

echo "$icon $ssid"

