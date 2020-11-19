![](https://miro.medium.com/max/700/0*v5XDnFGcanCw_7vk.jpg)

# DOCKER Y ARM Holdings Inc.

_Docker a mediados del 2019 anunció una asociación con ARM Inc., para ayudar a acelerar la adopción de contenedores en el enorme ecosistema de ARM, en DockerCon San Francisco 2019, lanzó una vista previa técnica de compilaciones mejoradas de múltiples arquitecturas dentro de Docker Desktop._

_Docker Desktop es el estándar de facto cuando se trata de desarrollar aplicaciones en contenedores. Esta vista previa tecnológica abrirá el rico ecosistema de Arm a los millones de desarrolladores que ya utilizan y desarrollan en Docker Desktop. Esto no solo simplificará el desarrollo de imágenes de contenedores para su implementación en instancias de Amazon EC2 A1 basadas en Arm en la nube, sino que también ayudará a allanar el camino hacia el billón de dispositivos Edge e IoT basados ​​en Arm en todo el mundo. Analicemos por qué estamos haciendo esto, cómo funciona todo y cómo puede comenzar._

![](https://i1.wp.com/www.docker.com/blog/wp-content/uploads/engineering/2019/04/Screen-Shot-2019-04-26-at-7.25.34-PM.png)

# ¿Por qué Docker hace esto?
_En noviembre de 2018, Amazon anunció instancias EC2 A1 impulsadas por procesadores AWS Graviton que cuentan con núcleos ARM Neoverse de 64 bits y silicio personalizado diseñado por AWS. Las instancias A1 EC2 tienen un costo y un rendimiento optimizados para cargas de trabajo de escalamiento horizontal y ofrecen hasta un 45% de ahorro de costos en comparación con otras instancias EC2. Con esta versión preliminar de la tecnología de Docker Desktop, Docker hace que sea más fácil que nunca desarrollar contenedores en y para los servidores y dispositivos ARM. Con las herramientas y los procesos estándar de Docker con los que ya está familiarizado, puede comenzar a compilar, enviar, extraer y ejecutar imágenes sin problemas en diferentes arquitecturas de sistemas. No se necesitan cambios en Dockerfiles o en el código fuente para comenzar a compilar para ARM. Simplemente reconstruya su imagen utilizando las nuevas funciones que se lanzan hoy. Finalmente, Docker se está expandiendo rápidamente a Edge e IoT, y vemos esto como un paso importante en ese proceso. Docker siempre se ha dedicado a los desarrolladores y ha facilitado las cosas._

# ¿Como funciona?
_Docker Desktop está disponible para macOS y Windows. Agrupa y configura muchas cosas para los usuarios que facilitan enormemente el desarrollo de contenedores. Docker Desktop se envía con hipervisores para el sistema operativo host. El hipervisor es responsable de ejecutar un kernel de Linux ligero (LinuxKit), que se incluye como parte de Docker Desktop. Este sistema operativo contenedor rápido y liviano viene empaquetado con el emulador QEMU y viene preconfigurado con binfmt_misc para ejecutar binarios de cualquier arquitectura compatible. ARM se compromete a respaldar la bifurcación QEMU de Docker y ayudará a mantener este proyecto. Todos los parches se transmitirán, pero Docker Desktop contendrá el soporte de emulación más reciente. En el diagrama de arriba puede ver la emulación QEMU para las imágenes de Docker arm / v6, arm / v7 y arm64._





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

