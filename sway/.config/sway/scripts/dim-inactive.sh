#!/usr/bin/env bash
# Dim inactive sway windows by subscribing to focus events via IPC

INACTIVE=0.85
ACTIVE=1.0

# Initial pass: set all open windows to correct opacity
swaymsg -t get_tree | jq -r '.. | select(.type? == "con" and .pid? != null) | "\(.id) \(.focused)"' \
    | while read -r id focused; do
        if [[ "$focused" == "true" ]]; then
            swaymsg "[con_id=$id] opacity $ACTIVE"
        else
            swaymsg "[con_id=$id] opacity $INACTIVE"
        fi
    done

prev_id=$(swaymsg -t get_tree | jq '.. | select(.focused? == true) | .id' | head -1)

swaymsg -t subscribe '["window"]' | while IFS= read -r event; do
    change=$(printf '%s' "$event" | jq -r '.change // empty')
    if [[ "$change" == "focus" ]]; then
        new_id=$(printf '%s' "$event" | jq -r '.container.id // empty')
        [[ -n "$prev_id" ]] && swaymsg "[con_id=$prev_id] opacity $INACTIVE"
        [[ -n "$new_id" ]] && swaymsg "[con_id=$new_id] opacity $ACTIVE"
        prev_id="$new_id"
    fi
done
