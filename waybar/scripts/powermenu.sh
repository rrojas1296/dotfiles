#!/usr/bin/env bash

rofi_cmd="rofi -dmenu -theme ~/.config/rofi/powermenu.rasi"

option1="󰗽 Logout"
option2="󰜉 Shutdown"
option3="󰤄 Suspend"
option4="󰑓 Reboot"

options="$option1\n$option2\n$option3\n$option4"

chosen=$(printf "%b\n" "$options" | $rofi_cmd)

case "$chosen" in
  "󰗽 Logout")
    hyprctl dispatch exit
    ;;
  "󰜉 Shutdown")
    systemctl poweroff
    ;;
  "󰤄 Suspend")
    systemctl suspend
    ;;
  "󰑓 Reboot")
    systemctl reboot
    ;;
esac
