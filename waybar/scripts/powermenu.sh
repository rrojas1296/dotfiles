
#!/usr/bin/env bash
choice=$(printf "󰐥 Shutdown\n Reboot\n󰒲 Suspend\n Lock\n Logout" \
  | rofi -dmenu  -p "System:")

case "$choice" in
  "󰐥 Shutdown") systemctl poweroff ;;
  " Reboot") systemctl reboot ;;
  "󰒲 Suspend") systemctl suspend ;;
  " Lock") hyprctl dispatch exec "swaylock" ;; # or your lock command
  " Logout") hyprctl dispatch exit ;;
esac
