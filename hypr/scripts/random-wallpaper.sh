#!/bin/bash

WALLPAPER_DIR=~/images/wallpapers

if [ -d "$WALLPAPER_DIR" ]; then
    swww img $(find "$WALLPAPER_DIR" | sort -R | tail -1)
else
    echo "Error: $WALLPAPER_DIR not found!"
    exit 1
fi

