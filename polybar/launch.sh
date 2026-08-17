#!/usr/bin/env bash

# Terminar instancias actuales de Polybar
killall -q polybar
pkill -u $UID -x polybar 2>/dev/null

# Esperar a que los procesos se cierren completamente
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.2; done

# Lanzar la barra 'parrot' especificando el archivo de configuración correcto
export DISPLAY="${DISPLAY:-:0}"
polybar parrot -c ~/.config/polybar/config.ini </dev/null >/dev/null 2>&1 &
disown

# Confirmación en consola
echo "Polybar [parrot] cargada."
