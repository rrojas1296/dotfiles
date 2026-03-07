#!/bin/bash

TERMINAL="kitty"  # Cambia aquí tu terminal favorita

show_updates() {
    official_updates=$(pacman -Qu 2>/dev/null | wc -l)
    aur_updates=$(paru -Qua 2>/dev/null | wc -l)
    total_updates=$((official_updates + aur_updates))

    if [ "$official_updates" -eq 0 ] && [ "$aur_updates" -eq 0 ]; then
        echo "{\"text\":\"󰮯 $official_updates   $aur_updates\",\"tooltip\":\"Official packages: $official_updates\nAUR packages: $aur_updates\"}"
    else
        echo "{\"text\":\"󰮯 $official_updates   $aur_updates\",\"tooltip\":\"Official packages: $official_updates\nAUR packages: $aur_updates\"}"
    fi
}

update_system() {
    $TERMINAL -e paru -Syu
}

case "$1" in
    --checkUpdates)
        show_updates
        ;;
    --update)
        update_system
        ;;
    *)
        echo "{\"text\":\"Error: uso inválido\",\"tooltip\":\"Uso: $0 --checkUpdates | --update\"}"
        exit 1
        ;;
esac
