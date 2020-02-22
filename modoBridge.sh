#!/bin/bash
echo %%% Modo BRIDGE via: https://www.raspberrypi.org/forums/viewtopic.php?t=163036 %%

sudo brctl addbr br0
sudo ip addr flush dev enp0s31f6
sudo brctl addif br0 enp0s31f6
sudo tunctl -u $(whoami)
sudo brctl addif br0 tap0
sudo ip link set dev br0 up
sudo ip link set dev tap0 up
sudo dhclient br0
