#!/bin/bash

IP_FILE="/tmp/last_ip.txt"
CURRENT_IP=$(curl -s ifconfig.me)

if [ -f "$IP_FILE" ]; then
    LAST_IP=$(cat "$IP_FILE")
    if [ "$CURRENT_IP" != "$LAST_IP" ]; then
        echo "$CURRENT_IP" > "$IP_FILE"
        ./discord_send.sh "Public IP changed to $CURRENT_IP"
    fi
else
    echo "$CURRENT_IP" > "$IP_FILE"
    ./discord_send.sh "IP monitoring started. Current IP: $CURRENT_IP"
fi
