#!/bin/bash

echo "Switching media keys with F keys"
echo
echo 2 | sudo tee /sys/module/hid_apple/parameters/fnmode
echo options hid_apple fnmode=2 | sudo tee -a /etc/modprobe.d/hid_apple.conf

echo "Switching key § with ~"
echo
echo 0 | sudo tee /sys/module/hid_apple/parameters/iso_layout
echo options hid_apple iso_layout=0 | sudo tee -a /etc/modprobe.d/hid_apple.conf

echo "Switching Alt and Win keys"
echo
echo 1 | sudo tee /sys/module/hid_apple/parameters/swap_out_cmd
echo options hid_apple swap_out_cmd=1 | sudo tee -a /etc/modprobe.d/hid_apple.conf
sed -i '/^exit 0/i \
echo 1 > /sys/module/hid_apple/parameters/swap_opt_cmd\
' /etc/rc.local
