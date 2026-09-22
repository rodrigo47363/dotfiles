#!/usr/bin/env bash
# ==============================================================================
# Windows Calendar & Clock helper using Python & Dunst
# ==============================================================================

if [ "$1" = "info" ]; then
    FECHA=$(date '+%A, %d de %B de %Y')
    ZONA=$(date '+%Z (%z)')
    NTP=$(timedatectl 2>/dev/null | grep 'synchronized:' | awk '{print $NF}' || echo 'activa')
    notify-send -i preferences-system-time -u normal "Fecha y Hora del Sistema" "$FECHA\nZona: $ZONA\nNTP Sincronizado: $NTP"
    exit 0
fi

MONTH=$(python3 -c "
import calendar, datetime
now = datetime.datetime.now()
cal = calendar.month(now.year, now.month)
print(cal)
")
notify-send -i office-calendar -u normal "Calendario de Windows" "$MONTH"
