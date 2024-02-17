#!/bin/sh

case "$1" in
    --toggle)
        if [ "$(pgrep -x picom)" ]; then
            pkill picom
        else
            picom -b --config ~/.config/picom/picom.conf
        fi
        ;;
esac