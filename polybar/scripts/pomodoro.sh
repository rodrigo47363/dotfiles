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
    stop)
        pkill -x pomod
        exit 0
        ;;
esac

if ! pgrep -x "pomod" >/dev/null 2>&1; then
    echo "%{F#5c6370}󱎫 Pomo:%{F-} %{F#707880}Off%{F-}"
    exit 0
fi

state=$(pomoc status state 2>/dev/null)
time_left=$(pomoc status time 2>/dev/null)

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
    idle)
        echo "%{F#61afef}󱎫 Pomo:%{F-} %{F#abb2bf}25:00%{F-}"
        ;;
    *)
        echo "%{F#5c6370}󱎫 Pomo:%{F-} %{F#707880}Off%{F-}"
        ;;
esac
