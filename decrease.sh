#! /bin/bash

cd "/usr/local/lib/brightnessctl"
source configuration.sh

sudo brightness `expr $currentbrigth - 1`
