#!/bin/bash
# ~/.config/polybar/scripts/wifi-menu.sh
# Menú de Wi-Fi para rofi / polybar — muestra SSID, frecuencia y señal.
# Incluye re-scan automático y evita duplicados.

# Forzar un re-scan completo de redes
nmcli dev wifi rescan > /dev/null 2>&1
sleep 1  # Espera breve para actualizar resultados

# Obtener lista de redes: SSID | Frecuencia | Señal
MENU=$(nmcli -t -f SSID,FREQ,SIGNAL dev wifi list | awk -F: '
    NR>1 && $1 != "" {
        ssid=$1; freq=$2; sig=$3;
        if (!seen[ssid]++) {
            band = (freq >= 4900 ? "5GHz" : "2.4GHz")
            printf "%-30s | %-5s | %s%%\n", ssid, band, sig
        }
    }')

# Si no hay redes, salir
if [ -z "$MENU" ]; then
    notify-send "Wi-Fi" "No se encontraron redes."
    exit 0
fi

# Mostrar menú con rofi
CHOICE_LINE=$(printf "%s\n" "$MENU" | rofi -dmenu -p "Select Wi-Fi")
[ -z "$CHOICE_LINE" ] && exit 0

# Extraer SSID (todo antes de '|')
SSID=$(printf "%s" "$CHOICE_LINE" | cut -d'|' -f1 | sed 's/[[:space:]]*$//')

# Buscar conexión guardada con nombre exacto
SAVED=$(nmcli -t -f NAME connection show | grep -Fx -- "$SSID" | head -n1)

if [ -n "$SAVED" ]; then
    nmcli connection up "$SAVED"
else
    PASSWORD=$(rofi -dmenu -password -p "Password for $SSID")
    if [ -n "$PASSWORD" ]; then
        nmcli dev wifi connect "$SSID" password "$PASSWORD"
    else
        nmcli dev wifi connect "$SSID"
    fi
fi
