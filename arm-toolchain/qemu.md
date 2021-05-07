

Primeramente debemos de instalar los complementos de BREW que es una colección compatible de soporte que le falta a la mac para mantener utilerias que viene de Linux por ejemplo.

# Instalación de BREW utilerias

Puede informarse mas en la sitio oficial en: http://brew.com
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Nota: Depende que como este presente su equipo mac, instalará xcode-command complemento puede llevar esto primedio de 10 minutos o mas.

# Instalación de QEMU arquitecturas virtuales, para macOS Big Sur

```
# brew doctor
# brew install qemu
(o si es actualizacion # brew upgrade qemu)
...
...
🍺  /usr/local/Cellar/meson/0.58.0: 181 files, 3.0MB
Removing: /usr/local/Cellar/meson/0.57.1... (334 files, 4.8MB)
==> Upgrading twine-pypi 3.3.0 -> 3.4.1
==> Downloading https://ghcr.io/v2/homebrew/core/twine-pypi/manifests/3.4.1
######################################################################## 100.0%


```


# Ejecutando en Qemu

Cuando se reinicia el procesador ARM, comienza a ejecutarse desde la dirección 0x0. En la placa de conexión hay una memoria flash de 16 MB en la dirección 0x0. Se ejecutarán las instrucciones presentes al comienzo de Flash.

Cuando qemu emula la placa de conexión, se debe especificar un archivo que se tratará como archivo de memoria Flash. El formato de archivo Flash es muy simple. Para obtener el byte de la dirección X en Flash, qemu lee el byte del desplazamiento X en el archivo. De hecho, es el mismo que el formato de archivo binario.

Para probar el programa, en la placa de conexión Gumstix emulada, primero creamos un archivo de 16 MB que representa el Flash. Usamos el comando **dd** para copiar 16 MB de ceros de **/dev/zero** al archivo **flash.bin**. Los datos se copian en bloques de 4K. Recomendable trabajar en un directorio.

```
mkdir ARM
cd ARM

ARM % sudo dd if=/dev/zero of=flash.bin bs=4096 count=4096
Password:
4096+0 records in
4096+0 records out
16777216 bytes transferred in 0.063863 secs (262706195 bytes/sec)

```
El archivo add.bin luego se copia al comienzo de Flash, usando el siguiente comando.

```
ARM % sudo dd if=add.bin of=flash.bin bs=4096 conv=notrunc
0+1 records in
0+1 records out
16 bytes transferred in 0.000360 secs (44443 bytes/sec)
```
Este es el equivalente a programar el archivo bin en la memoria Flash.

Después del reinicio, el procesador comenzará a ejecutarse desde la dirección 0x0 y se ejecutarán las instrucciones del programa. El comando para invocar qemu se da a continuación.
```
sudo qemu-system-arm -M connex -pflash flash.bin -nographic -serial /dev/null


WARNING: Image format was not specified for 'flash.bin' and probing guessed raw.
         Automatically detecting the format is dangerous for raw images, write operations on block 0 will be restricted.
         Specify the 'raw' format explicitly to remove the restrictions.
QEMU 5.2.0 monitor - type 'help' for more information
(qemu)


```

La opción **-M connex** especifica que se va a emular la conexión de la máquina. Las opciones **-pflash** especifican que el archivo **flash.bin** representa la memoria Flash. El **-nográfico**  que no se requiere la simulación de una pantalla gráfica. **-serial /dev/null** especifica que el puerto serie de la placa de conexión debe conectarse a **/dev/null**, de modo que los datos del puerto serie se descartan.

El sistema ejecuta las instrucciones y, una vez finalizadas, sigue realizando un bucle infinito en la instrucción stop: b stop. Para ver el contenido de los registros, se puede utilizar la interfaz de monitor de qemu. La interfaz del monitor es una interfaz de línea de comandos, a través de la cual se puede controlar el sistema emulado y se puede ver el estado del sistema. Cuando qemu se inicia con el comando mencionado anteriormente, la interfaz del monitor se proporciona en la E / S estándar de qemu.

Para ver el contenido de los registros, se puede utilizar el comando de monitor de registros de información.

```
(qemu) info registers
R00=00000005 R01=00000004 R02=00000009 R03=00000000
R04=00000000 R05=00000000 R06=00000000 R07=00000000
R08=00000000 R09=00000000 R10=00000000 R11=00000000
R12=00000000 R13=00000000 R14=00000000 R15=0000000c
PSR=400001d3 -Z-- A svc32
FPSCR: 00000000
(qemu)
```
Anote el valor en el registro R02. El registro contiene el resultado de la suma y debe coincidir con el valor esperado de 9.

Este comando xp con el formato i, se puede utilizar para desmontar las instrucciones presentes en la memoria. Para desensamblar las instrucciones ubicadas en 0x0, se puede usar el comando xp con el fmt especificado como 4iw. El 4 especifica que se mostrarán 4 elementos, i especifica que los elementos deben imprimirse como instrucciones (sí, ¡un desensamblador integrado!), W especifica que los elementos tienen un tamaño de 32 bits. La salida del comando se muestra a continuación.

```
(qemu) xp /4iw 0x0
0x00000000:  e3a00005  mov      r0, #5
0x00000004:  e3a01004  mov      r1, #4
0x00000008:  e0812000  add      r2, r1, r0
0x0000000c:  eafffffe  b        #0xc
(qemu)
```
En la siguiente tabla se enumeran algunos comandos útiles del monitor qemu.

| Command      | Purpose              |
|--------------|----------------------|
| help         | Comandos disponibles |
| quit         | Salir de emulador    |
| xp /fmt addr | memoria vaciado del segmento "addr" (direccion)             |
| system_reset | Reseteo              |

El comando xp merece más explicación. El argumento fmt especifica cómo se mostrará el contenido de la memoria. La sintaxis de fmt es <count><format> <size>.

-contar:  especifica no. de elementos de datos que se van a verter.
especifica el tamaño de cada elemento de datos. b para 8 bits, h para 16 bits, w para 32 bits y g para 64 bits.
-formato: especifica el formato de visualización. x para hexadecimal, d para decimal con signo, u para decimal sin signo, o para octal, c para char ei para instrucciones ASM.
Este comando xp con el formato i, se puede utilizar para desmontar las instrucciones presentes en la memoria. Para desensamblar las instrucciones ubicadas en 0x0, se puede usar el comando xp con el fmt especificado como 4iw. El 4 especifica que se mostrarán 4 elementos, i especifica que los elementos deben imprimirse como instrucciones (sí, ¡un desensamblador integrado!), W especifica que los elementos tienen un tamaño de 32 bits.



