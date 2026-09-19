#!/usr/bin/env bash
# ==============================================================================
# Windows 11 Widgets / Weather Helper for Polybar
# ==============================================================================

CACHE_FILE="/tmp/win11_weather.cache"
CACHE_AGE=900 # 15 minutes

if [ "$1" = "click" ]; then
    cached_weather=$(cat "$CACHE_FILE" 2>/dev/null)
    notify-send -i weather-clear "El Tiempo" "${cached_weather:-24°C Despejado}\nActualizado recientemente" -u normal
    exit 0
elif [ "$1" = "stealth" ]; then
    vpn_info=$(~/.config/polybar/scripts/vpn.sh 2>/dev/null | sed 's/%{[^}]*}//g')
    target_info=$(~/.config/polybar/scripts/target.sh 2>/dev/null | sed 's/%{[^}]*}//g')
    notify-send -i security-high "Estado de Red & Auditoría" "$vpn_info\n$target_info" -u low
    exit 0
fi

# Check if cache is recent
need_refresh=true
if [ -f "$CACHE_FILE" ]; then
    last_mod=$(stat -c %Y "$CACHE_FILE" 2>/dev/null || echo 0)
    now=$(date +%s)
    if [ $((now - last_mod)) -lt $CACHE_AGE ]; then
        need_refresh=false
    fi
fi

if [ "$need_refresh" = true ]; then
    weather=$(curl -s --connect-timeout 2 "wttr.in/?format=%t+%C&lang=es" 2>/dev/null)
    if [ -n "$weather" ] && [[ ! "$weather" =~ "Unknown" ]] && [[ ! "$weather" =~ "500" ]]; then
        echo "$weather" > "$CACHE_FILE"
    elif [ ! -f "$CACHE_FILE" ]; then
        echo "24°C Despejado" > "$CACHE_FILE"
    fi
fi

val=$(cat "$CACHE_FILE" 2>/dev/null)
echo " %{T2}%{T-} ${val:-24°C Despejado} "
