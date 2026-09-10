#!/usr/bin/env bash

# Terminar instancias actuales de Polybar
killall -q polybar
pkill -u $UID -x polybar 2>/dev/null

# Esperar a que los procesos se cierren completamente
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.2; done

# Lanzar la barra 'parrot' especificando el archivo de configuración correcto
export DISPLAY="${DISPLAY:-:0}"
export XAUTHORITY="${XAUTHORITY:-$HOME/.Xauthority}"

nohup polybar parrot -c "$HOME/.config/polybar/config.ini" >> /tmp/polybar.log 2>&1 &

# Confirmación en consola
echo "Polybar [parrot] cargada."
