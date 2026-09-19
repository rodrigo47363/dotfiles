#!/usr/bin/env bash
# ==============================================================================
# Windows Calendar popup using Python & Dunst
# ==============================================================================
MONTH=$(python3 -c "
import calendar, datetime
now = datetime.datetime.now()
cal = calendar.month(now.year, now.month)
print(cal)
")
notify-send -i office-calendar -u normal "Calendario de Windows" "$MONTH"
