#!/usr/bin/env bash

# ==========================================================
# POWERMENU PRO - BSPWM & ROFI SUITE
# Menú de apagado horizontal con herencia dinámica del tema Rofi
# Respeta automáticamente el tema configurado en config.rasi
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
logout="󰗼  Salir"

options="$shutdown\n$reboot\n$suspend\n$lock\n$logout"

uptime_str=$(uptime -p 2>/dev/null | sed -e 's/up //g')

# Estilo horizontal dinámico (hereda colores, bordes y fondos del tema activo de Rofi)
ROFI_THEME_HORIZONTAL='
window { width: 680px; padding: 16px; }
mainbox { children: [ inputbar, listview ]; spacing: 12px; background-color: transparent; }
inputbar { children: [ prompt ]; enabled: true; padding: 6px 12px; }
prompt { horizontal-align: 0.5; }
listview { layout: horizontal; lines: 5; spacing: 10px; scrollbar: false; background-color: transparent; }
element { orientation: horizontal; padding: 16px 8px; width: 120px; cursor: pointer; }
element-text { horizontal-align: 0.5; vertical-align: 0.5; font: "JetBrainsMono Nerd Font Bold 11"; }
'

ROFI_THEME_CONFIRM='
window { width: 380px; padding: 16px; }
mainbox { children: [ inputbar, listview ]; spacing: 12px; background-color: transparent; }
inputbar { children: [ prompt ]; enabled: true; padding: 6px 12px; }
prompt { horizontal-align: 0.5; }
listview { layout: horizontal; lines: 2; spacing: 10px; scrollbar: false; background-color: transparent; }
element { orientation: horizontal; padding: 16px 8px; width: 160px; cursor: pointer; }
element-text { horizontal-align: 0.5; vertical-align: 0.5; font: "JetBrainsMono Nerd Font Bold 11"; }
'

# Diálogo de confirmación dinámico
confirm_action() {
    local action="$1"
    local prompt_text="$2"
    local cancel="󰅖  Cancelar"
    local confirm="󰄲  Confirmar"

    local choice=$(echo -e "$cancel\n$confirm" | rofi -dmenu -i \
        -theme-str "$ROFI_THEME_CONFIRM" \
        -p " $prompt_text " \
        -selected-row 0)

    [[ "$choice" == "$confirm" ]]
}

# Invocar Rofi: Fila 3 preseleccionada por defecto (Bloquear)
chosen=$(echo -e "$options" | rofi -dmenu -i \
    -theme-str "$ROFI_THEME_HORIZONTAL" \
    -p " 󰐥 Power Menu (Activo: ${uptime_str:-online}) " \
    -selected-row 3)

case "$chosen" in
    "$shutdown")
        if confirm_action "Apagar" "¿Apagar el sistema?"; then
            systemctl poweroff
        fi
        ;;
    "$reboot")
        if confirm_action "Reiniciar" "¿Reiniciar el sistema?"; then
            systemctl reboot
        fi
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
        if confirm_action "Salir" "¿Cerrar sesión de BSPWM?"; then
            bspc quit
        fi
        ;;
esac
