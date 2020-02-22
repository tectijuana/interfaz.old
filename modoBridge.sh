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


echo %% MAC Address poner al final el numero de pc en hexadecimal, para no confundir el proxy del laboratorio %%

  
echo sudo qemu-system-arm -kernel kernel-qemu?dl=0 -cpu arm1176 -m 256 -M versatilepb -no-reboot -serial stdio -append "root=/dev/sda2 panic=1" -hda raspbian.img -net nic,macaddr=00:16:3e:00:00:01 -net tap,ifname=tap0,script=no,downscript=no -redir tcp:5022::22
