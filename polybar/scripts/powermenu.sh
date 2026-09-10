#!/usr/bin/env bash

# ==========================================================
# POWERMENU PRO - BSPWM & ROFI SUITE
# Menú de apagado rápido, interactivo y estético
# ==========================================================

# Single-instance toggle: Si Rofi ya está abierto, cerrarlo
if pkill -x rofi; then
    exit 0
fi

# Opciones con glifos Nerd Fonts
shutdown="󰐥  Apagar"
reboot="󰑓  Reiniciar"
suspend="󰤄  Suspender"
lock="󰌾  Bloquear"
logout="󰗼  Cerrar Sesión"

options="$shutdown\n$reboot\n$suspend\n$lock\n$logout"

uptime_str=$(uptime -p 2>/dev/null | sed -e 's/up //g')

# Invocar Rofi con estilo compacto centrado
chosen=$(echo -e "$options" | rofi -dmenu -i \
    -p " 󰐥 Apagado (${uptime_str:-activo}) " \
    -theme-str 'window { width: 340px; } listview { lines: 5; }' \
    -selected-row 0)

case "$chosen" in
    "$shutdown")
        systemctl poweroff
        ;;
    "$reboot")
        systemctl reboot
        ;;
    "$suspend")
        systemctl suspend
        ;;
    "$lock")
        if command -v slock >/dev/null 2>&1; then
            slock &
        elif command -v betterlockscreen >/dev/null 2>&1; then
            betterlockscreen -l &
        elif command -v i3lock >/dev/null 2>&1; then
            i3lock &
        else
            loginctl lock-session
        fi
        ;;
    "$logout")
        bspc quit
        ;;
esac
