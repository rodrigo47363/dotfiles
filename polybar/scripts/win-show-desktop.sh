#!/usr/bin/env bash
# ==============================================================================
# Windows "Show Desktop" Toggle (Win + D / Corner click in Polybar)
# ==============================================================================
HIDDEN_FILE="/tmp/bspwm_hidden_windows"

if [ -f "$HIDDEN_FILE" ]; then
    # Unhide previously hidden windows
    while read -r wid; do
        bspc node "$wid" -g hidden=off 2>/dev/null
    done < "$HIDDEN_FILE"
    rm -f "$HIDDEN_FILE"
else
    # Hide all visible windows on current desktop
    touch "$HIDDEN_FILE"
    for wid in $(bspc query -N -d -n .window.!hidden); do
        echo "$wid" >> "$HIDDEN_FILE"
        bspc node "$wid" -g hidden=on 2>/dev/null
    done
fi
