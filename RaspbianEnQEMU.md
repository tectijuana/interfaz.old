![](https://elinux.org/images/4/45/Rasp_turn_around.gif) 
![](https://images.cooltext.com/5382596.png) <a href="http://cooltext.com" target="_top"><img src="https://cooltext.com/images/ct_pixel.gif" width="80" height="15" alt="Cool Text: Logo and Graphics Generator" border="0" /></a>

Es actualización del Libro de "Practicas de Ensamblador con RaspberryPI" del https://riuma.uma.es/xmlui/bitstream/handle/10630/10214/LibroDePracticas.pdf?sequence=1&isAllowed=y

## 1.1.4. Configuración del entorno para realizar las prácticas en casa
### Las instrucciones sobre el recurso de la SBC "RaspberryPi" esta en: http://elinux.org/

![](https://images.cooltext.com/5382598.png)
<a href="http://cooltext.com" target="_top"><img src="https://cooltext.com/images/ct_pixel.gif" width="80" height="15" alt="Cool Text: Logo and Graphics Generator" border="0" /></a>


![](https://images.cooltext.com/5382600.png) <a href="http://cooltext.com" target="_top"><img src="https://cooltext.com/images/ct_pixel.gif" width="80" height="15" alt="Cool Text: Logo and Graphics Generator" border="0" /></a>

# Emular Raspbian (Buster) en QEMU on macOS

Instalar **qemu** (primero debe tener instalado el complemento "brew"):
> brew install qemu

Descargar kernel **qemu-rpi-kernel**:
> wget https://raw.githubusercontent.com/dhruvvyas90/qemu-rpi-kernel/master/kernel-qemu-4.19.50-buster

Soporte adicional de quemu,  **versatile-pb.dtb**:
> wget https://raw.githubusercontent.com/dhruvvyas90/qemu-rpi-kernel/master/versatile-pb.dtb

Download Raspbian (buster) __versión básica de 450 mb__ checar el nombre para **corregirlo**:
> wget https://downloads.raspberrypi.org/raspbian_lite_latest
> unzip raspbian_lite_latest
> ls
> rm raspbian_lite_latest
 
## Correr el emulator con soporte al puerto 5022 para el SSH otra terminal (termius, etc):
```qemu-system-arm -cpu arm1176 -m 256 \
  -kernel kernel-qemu-4.19.50-buster \
  -M versatilepb \
  -dtb versatile-pb.dtb \
  -no-reboot \
  -nographic \
  -append "dwc_otg.lpm_enable=0 root=/dev/sda2 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait" \
  -drive "file=2020-02-13-raspbian-buster-lite.img,index=0,media=disk,format=raw" \
  -net user,hostfwd=tcp::5022-:22 -net nic
```
_Esperar la pantalla del login, donde el usuario y contraseña es:  **pi** / **raspberry**

Habilitar el servicio  de SSH en Raspbian **(usuario root no tiene password)**:
> sudo su
> systemctl enable --now ssh

SSH into emulated Raspbian from macOS host:
> ssh -p 5022 pi@localhost

_Referencias:_
```
https://docs.j7k6.org/emulate-raspbian-qemu-macos/
https://gist.github.com/tinjaw/5bc5527ff379e8dd299a0b67e2bc9b62
https://github.com/dhruvvyas90/qemu-rpi-kernel
https://gist.github.com/hfreire/5846b7aa4ac9209699ba
```

####



Vamos a hacer un resumen de cómo se haría en Windows. Para otros sistemas operativos (Linux, Mac OS) seguir las instrucciones antes mencionadas.

1. Descargamos la última versión de RASPBIAN en la siguiente url:
http://www.raspberrypi.org/downloads/
2. Extraemos del .zip el archivo de imagen, en nuestro caso se llama 2014-01-07- wheezy-raspbian.img, aunque seguramente tu versión será más moderna.
3. Insertamos una tarjeta SD en tu PC (slot SD o adaptador USB) y nos asegu- ramos de que funcione correctamente. Si no, la formateamos en FAT32.
4. Nos bajamos e instalamos la utilidad Win32DiskImager.
http://sourceforge.net/projects/win32diskimager
5. Ejecutamos como Administrador la utilidad anterior.
6. Dentro de la utilidad, seleccionamos el archivo de imagen anterior, 2014-01- 07-wheezy-raspbian.img
7. Seleccionamos en Device la letra de unidad que nos apareció en el paso 3. Debemos asegurarnos de que la letra sea la correcta, de lo contrario podríamos destruir los datos de nuestro disco duro.
8. Pulsamos el botón Write y esperamos a que se complete la escritura.
9. Salimos de la utilidad y extraemos la tarjeta SD.
10. Ya estamos listos para introducir la tarjeta SD en nuestra Raspberry Pi.
cbed A. Villena, R. Asenjo, F. Corbera. DAC-UMA.
 
8 1.1. Lectura previa
 De forma alternativa podemos ejecutar la imagen anterior en un emulador de Raspberry Pi, y seguir gran parte de las prácticas con la comodidad de tu PC. Para ello partimos del archivo de imagen obtenido en el apartado 2 de la lista anterior, y seguimos los pasos según [5]. Los pasos son válidos para Windows y Linux, aunque nosotros mostraremos sólo los de Windows.
1. Descargamos el emulador QEMU desde aquí:
http://lassauge.free.fr/qemu/
2. Descargamos el siguiente núcleo o kernel desde aquí:
http://xecdesign.com/downloads/linux-qemu/kernel-qemu
3. Lanzamos la línea de comandos o ventana de MS-DOS. Esto se hace desde Programas->Accesorios->Símbolo del sistemaobienpulsandoWindows+R y escribiendo “cmd”. Una vez lanzada escribimos lo siguiente:
qemu-system-armw -kernel kernel-qemu -cpu arm1176
-m 256 -M versatilepb -no-reboot -serial stdio -append "root=/dev/sda2 panic=1 rootfstype=ext4 rw init=/bin/bash" -hda 2014-01-07-wheezy-raspbian.img
4. Aparece el emulador en una nueva ventana tipo terminal. Ya estaríamos den- tro de la Raspberry emulada. Una vez se muestren los mensajes de arranque aparece el siguiente texto:
raspberrypi login:
Nos está pidiendo el nombre de usuario. Nosotros escribimos pi.
5. Luego nos piden el password, que es raspberry. En este caso y por motivos de seguridad no se recibe respuesta visual mientras escribimos la contraseña, ni siquiera aparecen asteriscos.
6. Unavezidentificados,loprimeroquehacemoseseditarelarchivo/etc/ld.so.preload con el siguiente comando:
nano /etc/ld.so.preload
7. Dentro del editor ponemos un # al comienzo de la siguiente línea: #/usr/lib/arm-linux-gnueabihf/libcofi_rpi.so
8. Presionamos Ctrl-X y luego y, Enter para guardar y salir.
cbed A. Villena, R. Asenjo, F. Corbera. DAC-UMA.
         
Capítulo 1. Introducción al ensamblador 9
9. Escribimos sudo halt para salir limpiamente del sistema emulado.
10. Cerramos la ventana de QEMU y creamos el siguiente archivo lanzador.bat.
qemu-system-armw -kernel kernel-qemu -cpu arm1176
-m 256 -M versatilepb -no-reboot -serial stdio -append "root=/dev/sda2 panic=1 rootfstype=ext4 rw"
-hda 2014-01-07-wheezy-raspbian.img
11. Ejecutamos el archivo lanzador.bat que acabamos de crear. Ya hemos ter- minado. Todos los archivos que vayamos creando se almacenan en la imagen como si se tratase de una SD real corriendo sobre una Raspberry Pi real.
