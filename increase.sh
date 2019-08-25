#! /bin/bash

cd "/usr/local/lib/brightnessctl"
source configuration.sh
sudo /usr/local/bin/brightness `expr $currentBright + $stepSize`
