![](https://miro.medium.com/max/700/0*v5XDnFGcanCw_7vk.jpg)

# DOCKER en ARM32







# Actualizar el dockerFile

```bash
root@018c8a681f53:/home/pi# apt update
root@018c8a681f53:/home/pi# apt upgrade
```
-------


```bash
root@018c8a681f53:/home/pi# uname -a
Linux 018c8a681f53 5.4.39-linuxkit #1 SMP Fri May 8 23:03:06 UTC 2020 armv7l GNU/Linux
```
__Observamos que no cuenta con GIT utilerias, debemo instalarlas___
```bash
root@018c8a681f53:/home/pi# git
bash: git: command not found
```
----
```bash

root@018c8a681f53:/home/pi# apt install git

Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  git-man libcurl3-gnutls liberror-perl
Suggested packages:
  git-daemon-run | git-daemon-sysvinit git-doc git-el git-email git-gui gitk gitweb git-cvs git-mediawiki git-svn
The following NEW packages will be installed:
  git git-man libcurl3-gnutls liberror-perl
0 upgraded, 4 newly installed, 0 to remove and 0 not upgraded.
Need to get 6,137 kB of archives.
After this operation, 32.9 MB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://raspbian.mirrors.lucidnetworks.net/raspbian buster/main armhf libcurl3-gnutls armhf 7.64.0-4+deb10u1 [292 kB]
Get:2 http://raspbian.mirrors.lucidnetworks.net/raspbian buster/main armhf liberror-perl all 0.17027-2 [30.9 kB]
Get:3 http://raspbian.mirrors.lucidnetworks.net/raspbian buster/main armhf git-man all 1:2.20.1-2+deb10u3 [1,620 kB]
Get:4 http://raspbian.mirrors.lucidnetworks.net/raspbian buster/main armhf git armhf 1:2.20.1-2+deb10u3 [4,194 kB]
Fetched 6,137 kB in 8s (809 kB/s)                                                                                    
Selecting previously unselected package libcurl3-gnutls:armhf.
(Reading database ... 40032 files and directories currently installed.)
Preparing to unpack .../libcurl3-gnutls_7.64.0-4+deb10u1_armhf.deb ...
Unpacking libcurl3-gnutls:armhf (7.64.0-4+deb10u1) ...
Selecting previously unselected package liberror-perl.
Preparing to unpack .../liberror-perl_0.17027-2_all.deb ...
Unpacking liberror-perl (0.17027-2) ...
Selecting previously unselected package git-man.
Preparing to unpack .../git-man_1%3a2.20.1-2+deb10u3_all.deb ...
Unpacking git-man (1:2.20.1-2+deb10u3) ...
Selecting previously unselected package git.
Preparing to unpack .../git_1%3a2.20.1-2+deb10u3_armhf.deb ...
Unpacking git (1:2.20.1-2+deb10u3) ...
Setting up libcurl3-gnutls:armhf (7.64.0-4+deb10u1) ...
Setting up liberror-perl (0.17027-2) ...
Setting up git-man (1:2.20.1-2+deb10u3) ...
Setting up git (1:2.20.1-2+deb10u3) ...
Processing triggers for man-db (2.8.5-2) ...
Processing triggers for libc-bin (2.28-10+rpi1) ...
root@018c8a681f53:/home/pi# 

```

----
# Directorio de Trabajo es /home/pi
```bash
cd /home/pi
```

----
# Editor NANO (o vim)

