#!/usr/bin/env bash

# ==========================================================
# VPN MONITOR SCRIPT - OFFENSIVE SECURITY & PENTESTING PRO
# Soporta: OpenVPN (HTB, THM, OffSec/PG), WireGuard, Tailscale, 
#          ZeroTier, Cisco AnyConnect, Fortinet / PPP, etc.
# ==========================================================

# 1. Detectar interfaz virtual activa con dirección IPv4
vpn_iface=$(ip -o -4 addr show 2>/dev/null | awk '{print $2}' | grep -E '^tun|^tap|^wg|^tailscale|^ppp|^cscotun|^zt|^proton|^nord|^mullvad' | head -n 1)

# Si no tiene IPv4 asignada aún, buscar si el link existe (estado conectando)
if [ -z "$vpn_iface" ]; then
    vpn_iface=$(ip -o link show 2>/dev/null | awk -F': ' '{print $2}' | grep -E '^tun|^tap|^wg|^tailscale|^ppp|^cscotun|^zt' | head -n 1)
fi

# Configuración por defecto
vpn_tag="VPN"
vpn_icon=""
vpn_color="#56b6c2" # Cyan OneDark
ip_vpn=""

# 2. Análisis e identificación de plataforma si hay interfaz activa
if [ -n "$vpn_iface" ]; then
    ip_vpn=$(ip -4 -o addr show "$vpn_iface" 2>/dev/null | awk '{print $4}' | cut -d/ -f1 | head -n 1)
    openvpn_proc=$(pgrep -a openvpn 2>/dev/null)

    # Detección para HackTheBox (HTB)
    if echo "$openvpn_proc" | grep -qiE "hackthebox|htb|academy|machines|release_arena|prolabs|fortress|endgame" \
       || [[ "$ip_vpn" =~ ^10\.10\.(14|15|16|17)\. ]] \
       || [[ "$ip_vpn" =~ ^10\.129\. ]]; then
        vpn_tag="HTB"
        vpn_icon="󰆧"
        vpn_color="#98c379" # Verde HTB

    # Detección para TryHackMe (THM)
    elif echo "$openvpn_proc" | grep -qiE "tryhackme|thm" \
       || [[ "$ip_vpn" =~ ^10\.(2|4|6|8|9|11|14|17|18|50|200)\. ]]; then
        vpn_tag="THM"
        vpn_icon="󰅣"
        vpn_color="#e06c75" # Rojo THM

    # Detección para OffSec / Proving Grounds (PG) / OSCP Labs
    elif echo "$openvpn_proc" | grep -qiE "provinggrounds|pg|offsec|play|practice|universal|lab-os-" \
       || [[ "$ip_vpn" =~ ^192\.168\.(49|50|100|200)\. ]] \
       || [[ "$ip_vpn" =~ ^10\.11\. ]] \
       || [[ "$ip_vpn" =~ ^10\.12\. ]]; then
        vpn_tag="OFFSEC"
        vpn_icon=""
        vpn_color="#d19a66" # Naranja OffSec

    # Detección para WireGuard
    elif [[ "$vpn_iface" =~ ^wg || "$vpn_iface" =~ ^wireguard ]]; then
        vpn_tag="WG"
        vpn_icon="󰒄"
        vpn_color="#61afef" # Azul WireGuard

    # Detección para Tailscale
    elif [[ "$vpn_iface" =~ ^tailscale ]] || [[ "$ip_vpn" =~ ^100\.(6[4-9]|[7-9][0-9]|1[0-1][0-9]|12[0-7])\. ]]; then
        vpn_tag="TS"
        vpn_icon="󰛳"
        vpn_color="#56b6c2" # Cyan Tailscale

    # Detección para ZeroTier
    elif [[ "$vpn_iface" =~ ^zt ]]; then
        vpn_tag="ZT"
        vpn_icon="󰒄"
        vpn_color="#e5c07b" # Amarillo ZeroTier

    # Túneles corporativos PPP / Cisco / Fortinet
    elif [[ "$vpn_iface" =~ ^ppp || "$vpn_iface" =~ ^cscotun ]]; then
        vpn_tag="CORP"
        vpn_icon=""
        vpn_color="#c678dd" # Púrpura Corp
    fi
fi

# 3. Función auxiliar para copiar al portapapeles
copy_to_clipboard() {
    local text="$1"
    if command -v xclip >/dev/null 2>&1; then
        echo -n "$text" | xclip -sel clip 2>/dev/null
    elif command -v xsel >/dev/null 2>&1; then
        echo -n "$text" | xsel -b 2>/dev/null
    elif command -v wl-copy >/dev/null 2>&1; then
        echo -n "$text" | wl-copy 2>/dev/null
    fi
}

# 4. Manejador de argumentos (clics de Polybar)
if [ "$1" = "copy" ]; then
    if [ -n "$ip_vpn" ]; then
        copy_to_clipboard "$ip_vpn"
        notify-send -u low -i network-vpn "$vpn_tag IP Copiada" "LHOST: $ip_vpn" 2>/dev/null
    else
        notify-send -u low -i network-error "VPN" "No hay túnel activo con IPv4 asignada" 2>/dev/null
    fi
    exit 0
fi

# 5. Salida formateada para Polybar
if [ -n "$vpn_iface" ] && [ -n "$ip_vpn" ]; then
    echo "%{F$vpn_color}$vpn_icon $vpn_tag:%{F-} %{F#e5e9f0}$ip_vpn%{F-}"
elif [ -n "$vpn_iface" ]; then
    echo "%{F#e5c07b}$vpn_icon $vpn_tag:%{F-} %{F#707880}Conectando...%{F-}"
else
    echo "%{F#5c6370} No VPN%{F-}"
fi
