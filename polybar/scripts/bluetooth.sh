#!/usr/bin/env bash
# ==============================================================================
# BLUETOOTH STATUS & CONTROLLER - POLYBAR PRO SUITE
# Compatible con BlueZ (bluetoothctl) y fallback a nivel de kernel (rfkill/sysfs)
# ==============================================================================

# 1. Obtener estado del adaptador Bluetooth
get_status() {
    local icon_mode="$1"

    # Verificar si existe adaptador Bluetooth físico o módulo de kernel
    if [ ! -d "/sys/class/bluetooth" ] || [ -z "$(ls -A /sys/class/bluetooth 2>/dev/null)" ]; then
        if [ "$icon_mode" = "--icon" ]; then
            echo "%{F#5c6370}󰂲%{F-}"
        else
            echo "%{F#5c6370}󰂲 none%{F-}"
        fi
        return
    fi

    # Comprobar bloqueo suave/duro mediante rfkill
    local is_blocked=false
    if rfkill list -n -o SOFT bluetooth 2>/dev/null | grep -qw "blocked"; then
        is_blocked=true
    fi

    if [ "$is_blocked" = true ]; then
        if [ "$icon_mode" = "--icon" ]; then
            echo "%{F#5c6370}󰂲%{F-}"
        else
            echo "%{F#5c6370}󰂲 off%{F-}"
        fi
        return
    fi

    # Si bluetoothctl (BlueZ) está disponible, inspeccionar estado de conexión y dispositivos
    if command -v bluetoothctl >/dev/null 2>&1; then
        local powered
        powered=$(bluetoothctl show 2>/dev/null | grep -i "Powered:" | awk '{print $2}')
        if [ "$powered" != "yes" ]; then
            if [ "$icon_mode" = "--icon" ]; then
                echo "%{F#5c6370}󰂲%{F-}"
            else
                echo "%{F#5c6370}󰂲 off%{F-}"
            fi
            return
        fi

        # Comprobar si hay dispositivos conectados
        local connected_devices
        connected_devices=$(bluetoothctl devices Connected 2>/dev/null)

        if [ -n "$connected_devices" ]; then
            local count
            count=$(echo "$connected_devices" | wc -l)

            if [ "$icon_mode" = "--icon" ]; then
                echo "%{F#61afef}󰂱%{F-}"
            else
                if [ "$count" -eq 1 ]; then
                    local dev_mac dev_name battery
                    dev_mac=$(echo "$connected_devices" | awk '{print $2}')
                    dev_name=$(echo "$connected_devices" | cut -d' ' -f3-)
                    [ ${#dev_name} -gt 12 ] && dev_name="${dev_name:0:10}.."

                    battery=$(bluetoothctl info "$dev_mac" 2>/dev/null | grep -i "Battery Percentage" | awk -F'[()]' '{print $2}')
                    if [ -n "$battery" ]; then
                        echo "%{F#61afef}󰂱%{F-} $dev_name ($battery%)"
                    else
                        echo "%{F#61afef}󰂱%{F-} $dev_name"
                    fi
                else
                    echo "%{F#61afef}󰂱%{F-} $count dev"
                fi
            fi
            return
        fi
    fi

    # Radio encendido pero sin dispositivos conectados (o BlueZ no instalado aún)
    if [ "$icon_mode" = "--icon" ]; then
        echo "%{F#61afef}󰂯%{F-}"
    else
        echo "%{F#61afef}󰂯 on%{F-}"
    fi
}

# 2. Toggle rápido de encendido / apagado (Clic derecho)
toggle_power() {
    if command -v bluetoothctl >/dev/null 2>&1; then
        local powered
        powered=$(bluetoothctl show 2>/dev/null | grep -i "Powered:" | awk '{print $2}')
        if [ "$powered" = "yes" ]; then
            bluetoothctl power off >/dev/null 2>&1
            notify-send -i bluetooth-disabled-symbolic -u low "Bluetooth 󰂲" "Radio Bluetooth desactivado"
        else
            rfkill unblock bluetooth 2>/dev/null
            bluetoothctl power on >/dev/null 2>&1
            notify-send -i bluetooth-active-symbolic -u low "Bluetooth 󰂯" "Radio Bluetooth activado"
        fi
    else
        if rfkill list -n -o SOFT bluetooth 2>/dev/null | grep -qw "blocked"; then
            rfkill unblock bluetooth
            notify-send -i bluetooth-active-symbolic -u low "Bluetooth 󰂯" "Radio Bluetooth activado"
        else
            rfkill block bluetooth
            notify-send -i bluetooth-disabled-symbolic -u low "Bluetooth 󰂲" "Radio Bluetooth desactivado"
        fi
    fi
}

# 3. Lanzar gestor gráfico o CLI (Clic central)
open_manager() {
    if command -v blueman-manager >/dev/null 2>&1; then
        blueman-manager &
    elif command -v bluetoothctl >/dev/null 2>&1; then
        kitty --title "Bluetooth Control" -e bluetoothctl &
    else
        "$HOME/.config/polybar/scripts/bluetooth-menu.sh" &
    fi
}

# 4. Enrutamiento de parámetros
case "$1" in
    toggle)
        toggle_power
        ;;
    manager)
        open_manager
        ;;
    --icon)
        get_status "--icon"
        ;;
    *)
        get_status "$1"
        ;;
esac
