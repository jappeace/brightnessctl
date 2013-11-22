#! /bin/bash

brightFolder="/sys/class/backlight/intel_backlight/"
stepSize=25
currentbrigth=`cat $brightFolder"brightness"`
