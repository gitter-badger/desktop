#!/bin/bash

echo "Switching media keys with F keys"
echo
echo 2 | sudo tee /sys/module/hid_apple/parameters/fnmode
echo options hid_apple fnmode=2 | sudo tee -a /etc/modprobe.d/hid_apple.conf

echo "Switching key § with ~"
echo
echo 0 | sudo tee /sys/module/hid_apple/parameters/iso_layout
echo options hid_apple iso_layout=0 | sudo tee -a /etc/modprobe.d/hid_apple.conf

echo "On elementaryOS you can go to Settings > Keyboard > Options > Alt/Win key behavior and select: Alt is swapped with Win"
echo
