#!/bin/sh
if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  echo "OFF"
else
  if [ $(bluetoothctl devices Connected | wc -c) -ne 0 ]
  then 
    echo $(bluetoothctl devices Connected | sed -E 's/Device ([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})//')
  else
    echo "ON"
  fi
fi
