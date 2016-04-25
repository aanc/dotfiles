LAPTOP_SCREEN=LVDS1
MONITOR1=VGA1
MONITOR2=DP3

if xrandr | grep "^$MONITOR1 connected"
then
	xrandr --output $LAPTOP_SCREEN --off --output $MONITOR1 --auto
	if xrandr | grep "^$MONITOR2 connected"
	then
		xrandr --output $MONITOR2 --auto --right-of $MONITOR1
	fi
else
	xrandr --output $MONITOR1 --off --output $MONITOR2 --off --output $LAPTOP_SCREEN --auto
fi

