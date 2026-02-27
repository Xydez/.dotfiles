#!/usr/bin/env bash

THRESHOLD_MB=1024   # 1 GiB
INTERVAL=10         # seconds

while true; do
    AVAILABLE_MB=$(awk '/MemAvailable/ {print int($2/1024)}' /proc/meminfo)

    if [ "$AVAILABLE_MB" -lt "$THRESHOLD_MB" ]; then
        notify-send -u critical "Low RAM" \
            "Less than 1 GiB RAM available (${AVAILABLE_MB} MB left)"
        sleep 60
    else
        sleep "$INTERVAL"
    fi
done

