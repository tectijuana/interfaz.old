```
qemu-system-arm -cpu arm1176 -m 256 \
-kernel kernel-qemu-4.19.50-buster \
-M versatilepb \
-dtb versatile-pb.dtb \
-no-reboot \
-append "dwc_otg.lpm_enable=0 root=/dev/sda2 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait" \
-drive "file=2020-02-13-raspbian-buster.img,index=0,media=disk,format=raw" \
-net user,hostfwd=tcp::5022-:22 -net nic
```
