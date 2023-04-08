#!/bin/sh
bluetoothctl | while read -r; do
    if [ "$(systemctl is-active "bluetooth.service")" = "active" ]; then
        if bluetoothctl show|grep -q "Powered: yes"; then
            if [ "$(bluetoothctl devices Connected|wc -l)" = "0" ]; then
                echo ON
            else 
                echo CONNECTED
            fi
        else 
            echo OFF
        fi
    else
        echo 'SERVICE DISABLED'
    fi
done
