#!/bin/bash

# Terminate already runntin bar instances
killall -q polybar

echo "---" | tee -a /tmp/primary-bar.log
polybar primary-bar >>/tmp/primary-bar.log 2>&1 &
