#! /bin/bash

brightFolder="/sys/class/backlight/intel_backlight/"
currentBright=`cat $brightFolder"brightness"`
maxBright=`cat $brightFolder"max_brightness"`
minBright=$((maxBright / 20))
stepSize=$((maxBright / 10))
