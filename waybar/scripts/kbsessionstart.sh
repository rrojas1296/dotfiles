#!/bin/bash

# Iniciar gnome-keyring daemon (claves, ssh, secrets)
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export GNOME_KEYRING_CONTROL
export DBUS_SESSION_BUS_ADDRESS
