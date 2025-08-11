#!/bin/bash

INTERFACE="enp5s0"  # Cambia por tu interfaz real, ej: eth0, enp3s0, etc.

get_bytes() {
    cat /sys/class/net/$INTERFACE/statistics/$1_bytes 2>/dev/null || echo 0
}

human_readable() {
    local bps=$1
    if (( bps < 1024 )); then
        echo "${bps} B/s"
    elif (( bps < 1048576 )); then
        printf "%.1f KB/s" "$(bc <<< "scale=2; $bps/1024")"
    else
        printf "%.1f MB/s" "$(bc <<< "scale=2; $bps/1048576")"
    fi
}

RX1=$(get_bytes rx)
TX1=$(get_bytes tx)

sleep 1

RX2=$(get_bytes rx)
TX2=$(get_bytes tx)

RXBPS=$((RX2 - RX1))
TXBPS=$((TX2 - TX1))

downspeed=$(human_readable $RXBPS)
upspeed=$(human_readable $TXBPS)

echo "{\"text\":\"󰇚 $downspeed 󰕒 $upspeed\", \"tooltip\":\"Interface: $INTERFACE\"}"
