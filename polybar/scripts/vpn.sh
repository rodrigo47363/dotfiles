#!/bin/bash

# Detectar interfaz virtual activa (tun0, tun1, tap0, etc.)
vpn_iface=$(ip -o -4 addr show 2>/dev/null | awk '{print $2}' | grep -E '^tun|^tap' | head -n 1)

# Determinar plataforma, icono y color
vpn_tag="VPN"
vpn_icon=""
vpn_color="#56b6c2"

if [ -n "$vpn_iface" ]; then
    ip_vpn=$(ip -4 -o addr show "$vpn_iface" 2>/dev/null | awk '{print $4}' | cut -d/ -f1)
    openvpn_proc=$(pgrep -a openvpn 2>/dev/null)

    # Detección por nombre de archivo o proceso
    if echo "$openvpn_proc" | grep -qiE "tryhackme|thm"; then
        vpn_tag="THM"
        vpn_icon="󰅣"
        vpn_color="#c31013"
    elif echo "$openvpn_proc" | grep -qiE "hackthebox|htb|machines|academy"; then
        vpn_tag="HTB"
        vpn_icon="󰆧"
        vpn_color="#98c379"
    # Detección por rangos de IP si el nombre del archivo no tiene pistas
    elif [[ "$ip_vpn" =~ ^10\.10\.(14|15|16|17)\. ]]; then
        vpn_tag="HTB"
        vpn_icon="󰆧"
        vpn_color="#98c379"
    elif [[ "$ip_vpn" =~ ^10\.(2|4|6|8|9|11|14|17|18|50|200)\. ]]; then
        vpn_tag="THM"
        vpn_icon="󰅣"
        vpn_color="#c31013"
    fi
fi

# Copiar IP al portapapeles si se pasa el argumento "copy"
if [ "$1" = "copy" ]; then
    if [ -n "$ip_vpn" ]; then
        echo -n "$ip_vpn" | xclip -sel clip 2>/dev/null
        notify-send -u low -i network-vpn "$vpn_tag IP" "Copiado al portapapeles: $ip_vpn" 2>/dev/null
    fi
    exit 0
fi

# Salida formateada para Polybar
if [ -n "$vpn_iface" ] && [ -n "$ip_vpn" ]; then
    echo "%{F$vpn_color}$vpn_icon $vpn_tag:%{F-} %{F#e5e9f0}$ip_vpn%{F-}"
elif [ -n "$vpn_iface" ]; then
    echo "%{F#e5c07b}󰆧 VPN:%{F-} %{F#707880}Conectando...%{F-}"
else
    echo "%{F#5c6370}󰆧 No VPN%{F-}"
fi
