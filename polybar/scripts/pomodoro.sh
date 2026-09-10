#!/usr/bin/env bash

# Asegurar que los binarios en ~/.local/bin están disponibles
export PATH="$HOME/.local/bin:$PATH"

ensure_daemon() {
    if ! pgrep -x "pomod" >/dev/null 2>&1; then
        pomod &
        sleep 0.2
    fi
}

case "$1" in
    toggle)
        ensure_daemon
        pomoc toggle
        exit 0
        ;;
    end)
        ensure_daemon
        pomoc end
        exit 0
        ;;
    reset)
        ensure_daemon
        pomoc reset
        notify-send -u low -a "Pomoc" -i "alarm" "Pomodoro Reset" "Temporizador restablecido a IDLE" 2>/dev/null
        exit 0
        ;;
    restart)
        pkill -x pomod
        sleep 0.2
        pomod &
        notify-send -u normal -a "Pomoc" -i "alarm" "Pomodoro Daemon" "Demonio pomod reiniciado" 2>/dev/null
        exit 0
        ;;
    menu)
        /home/rodrigo47363/.local/bin/rofi-pomodoro &
        exit 0
        ;;
    stop)
        pkill -x pomod
        exit 0
        ;;
esac

read -r state phase time_left <<< "$(pomoc status 2>/dev/null)"

if [ -z "$state" ]; then
    echo "%{F#5c6370}󱎫 Pomo:%{F-} %{F#707880}Off%{F-}"
    exit 0
fi

case "$state" in
    running)
        echo "%{F#98c379}󰥔 Focus:%{F-} %{F#e5e9f0}$time_left%{F-}"
        ;;
    paused)
        echo "%{F#e5c07b}󰥕 Pausado:%{F-} %{F#e5e9f0}$time_left%{F-}"
        ;;
    break)
        echo "%{F#c678dd}󰔟 Break:%{F-} %{F#e5e9f0}$time_left%{F-}"
        ;;
    break_paused)
        echo "%{F#e5c07b}󰔟 Pausado:%{F-} %{F#e5e9f0}$time_left%{F-}"
        ;;
    idle)
        echo "%{F#61afef}󱎫 Pomo:%{F-} %{F#abb2bf}${time_left:-25:00}%{F-}"
        ;;
    *)
        echo "%{F#5c6370}󱎫 Pomo:%{F-} %{F#707880}Off%{F-}"
        ;;
esac
