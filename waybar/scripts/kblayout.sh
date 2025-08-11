#!/bin/bash

KEYBOARD_NAME="keychron-keychron-k2"
ICON=""

# Si el argumento es --toggle, cambiamos layout
if [[ "$1" == "--toggle" ]]; then
    current=$(hyprctl devices -j | jq -r ".keyboards[] | select(.name==\"$KEYBOARD_NAME\") | .active_keymap")
    if [[ "$current" == *US* ]]; then
        hyprctl switchxkblayout "$KEYBOARD_NAME" 1
    else
        hyprctl switchxkblayout "$KEYBOARD_NAME" 0
    fi
    exit 0
fi

# Modo por defecto: mostrar layout
layout=$(hyprctl devices -j | jq -r ".keyboards[] | select(.name==\"$KEYBOARD_NAME\") | .active_keymap" | awk '{print tolower($0)}')

case "$layout" in
    *us*) layout="us" ;;
    *spanish*) layout="es" ;;
esac

echo "{\"text\": \"$ICON   $layout\", \"tooltip\": \"Keyboard layout: $layout\"}"
