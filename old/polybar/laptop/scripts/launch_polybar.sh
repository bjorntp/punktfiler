#/bin/bash
if type "xrandr"; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		bp="none"
    if [ $(xrandr --query | grep "$m"| cut -d" " -f3) = "primary" ]; then
      bp="right"
    fi
		MONITOR=$m BARPOS=$bp polybar --reload mybar &
	done
else
	polybar --reload mybar &
fi
