#! /bin/bash
if ["$1" == ""];
then
	value=3000
else
	value=$1
fi
echo $value | sudo tee /sys/class/backlight/intel_backlight/brightness
