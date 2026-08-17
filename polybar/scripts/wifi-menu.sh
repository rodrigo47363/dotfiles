#!/bin/bash
# ~/.config/polybar/scripts/wifi-menu.sh
# Menú de Wi-Fi interactivo. Optimizado para evitar pérdida de datos y mejorar feedback.

# 1. Rescan asíncrono
nmcli dev wifi rescan > /dev/null 2>&1

# 2. Parseo estricto
MENU=$(nmcli -t -f SSID,FREQ,SIGNAL,SECURITY dev wifi list | awk -F: '
    $1 != "" {
        ssid=$1; freq=$2; sig=$3; sec=$4;
        # Evitamos duplicados guardando el SSID en un array
        if (!seen[ssid]++) {
            band = (freq >= 4900 ? "5GHz" : "2.4GHz")
            lock = (sec ~ /WPA|WEP|802\.1X/ ? "🔒" : "🔓")
            # Usamos un delimitador claro para facilitar el corte posterior
            printf "%-25s | %-6s | %s%% | %s\n", ssid, band, sig, lock
        }
    }')

if [ -z "$MENU" ]; then
    notify-send "Wi-Fi " "No se encontraron redes en el área."
    exit 0
fi

# 3. Interfaz gráfica: rofi maneja la selección
CHOICE_LINE=$(printf "%s\n" "$MENU" | rofi -dmenu -i -p " Select Wi-Fi")

# Control de interrupción (si el usuario presiona ESC)
[ -z "$CHOICE_LINE" ] && exit 0

# 4. Extracción limpia del SSID
SSID=$(echo "$CHOICE_LINE" | awk -F' \\| ' '{gsub(/ +$/, "", $1); print $1}')

# 5. Lógica de Conexión
SAVED=$(nmcli -t -f NAME connection show | grep -Fx -- "$SSID" | head -n1)

if [ -n "$SAVED" ]; then
    notify-send "Wi-Fi " "Conectando al perfil guardado: $SSID..."
    if nmcli connection up "$SAVED" > /dev/null 2>&1; then
        notify-send "Wi-Fi ✅" "Conexión exitosa a $SSID"
    else
        notify-send -u critical "Wi-Fi ❌" "Fallo al conectar con $SSID"
    fi
else
    if echo "$CHOICE_LINE" | grep -q "🔒"; then
        PASSWORD=$(rofi -dmenu -password -p "🔑 Password for $SSID")
        
        [ -z "$PASSWORD" ] && exit 0
        
        notify-send "Wi-Fi " "Autenticando contra $SSID..."
        if nmcli dev wifi connect "$SSID" password "$PASSWORD" > /dev/null 2>&1; then
            notify-send "Wi-Fi ✅" "Conectado. Credenciales guardadas."
        else
            notify-send -u critical "Wi-Fi ❌" "Error de autenticación. Revisa la contraseña."
        fi
    else
        notify-send "Wi-Fi " "Intentando asociación con red abierta: $SSID..."
        if nmcli dev wifi connect "$SSID" > /dev/null 2>&1; then
            notify-send "Wi-Fi ✅" "Asociado a la red abierta $SSID"
        else
            notify-send -u critical "Wi-Fi ❌" "El AP rechazó la asociación."
        fi
    fi
fi
