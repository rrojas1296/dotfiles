#!/usr/bin/env bash

case "$1" in
  lock)
    # Use your locker of choice
    swaylock
    ;;
  suspend)
    swaylock & sleep 0.3
    systemctl suspend
    ;;
  reboot)
    systemctl reboot
    ;;
  shutdown)
    systemctl poweroff
    ;;
  logout)
    hyprctl dispatch exit
    ;;
  *)
    echo "Usage: $0 {lock|suspend|reboot|shutdown|logout}"
    exit 1
    ;;
esac
