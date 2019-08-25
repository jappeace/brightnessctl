#! /bin/bash

brightFolder="/sys/class/backlight/intel_backlight/"
currentBright=`cat $brightFolder"brightness"`
maxBright=`cat $brightFolder"max_brightness"`
stepSize=$((maxBright / 10))
