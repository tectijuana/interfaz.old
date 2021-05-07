En esta sección, aprenderá a ensamblar un programa ARM simple y a probarlo en una placa de conexión completa emulada por Qemu.

El archivo fuente del programa ensamblador consta de una secuencia de declaraciones, una por línea. Cada declaración tiene el siguiente formato.

```
label:    instruction         @ comment
```
Cada uno de los componentes es opcional.

- Etiqueta: La etiqueta es una forma conveniente de hacer referencia a la ubicación de la instrucción en la memoria. La etiqueta se puede utilizar siempre que pueda aparecer una dirección, por ejemplo, como operando de la instrucción de bifurcación. El nombre de la etiqueta debe constar de alfabetos, dígitos, _ y $.
- Comentario: Un comentario comienza con una @ y los caracteres que aparecen después de una @ se ignoran.
- Instrucción: La instrucción podría ser una instrucción ARM o una directiva de ensamblador. Las directivas de ensamblador son comandos para el ensamblador. Las directivas de ensamblador siempre comienzan con . (punto decimal).

```asm
@ Programa que suma dos numeros decimales enteros

        .text
start:                       @ Label, not really required
        mov   r0, #5         @ Load register r0 with the value 5
        mov   r1, #4         @ Load register r1 with the value 4
        add   r2, r1, r0     @ Add r0 and r1 and store in r2

stop:   b stop               @ Infinite loop to stop execution
```

The .text is an assembler directive, which says that the following instructions have to be assembled into the code section, rather than the .data section. Sections will be covered in detail, later in the tutorial.

Guarde el programa en un archivo diga __add.s__ Para ensamblar el archivo, invoque el ensamblador de GNU Toolchain como, como se muestra en el siguiente comando.

```
$ arm-none-eabi-as -o add.o add.s
```
__La opción -o especifica el nombre del archivo de salida.__

>Nota
>El toolchain siempre tienen el prefijo de la arquitectura de destino para la que están construidas, para evitar conflictos de nombres con la cadena de herramientas del host. En aras de la legibilidad, se hará referencia a las herramientas sin el prefijo, en el texto.


Para generar el archivo ejecutable, invoque el enlazador GNU Toolchain ld, como se muestra en el siguiente comando.

```bash
# arm-none-eabi-ld -Ttext=0x0 -o add.elf add.o
arm-none-eabi-ld: warning: cannot find entry symbol _start; defaulting to 0000000000000000

# ls -ali add.*
8110921 -rwxr-xr-x  1 root  wheel  66292 May  7 13:31 add.elf
8109540 -rw-r--r--  1 root  wheel    612 May  7 13:12 add.o
8109533 -rw-r--r--  1 root  wheel    964 May  7 13:31 add.s

```

Aquí nuevamente, la opción -o especifica el nombre del archivo de salida. **-Ttext = 0x0**, especifica que las direcciones deben asignarse a las etiquetas, de modo que las instrucciones comiencen desde la dirección 0x0. Para ver la asignación de direcciones para varias etiquetas, el comando nm se puede utilizar como se muestra a continuación.
``` bash
# arm-none-eabi-nm add.elf
... varios mensajes ....
....

00000000 t start
0000000c t stop
```

Tenga en cuenta que la asignación de direcciones para las etiquetas comienza y termina. La dirección asignada para el inicio es 0x0. Dado que es la etiqueta de la primera instrucción. La etiqueta se detiene después de 3 instrucciones. Cada instrucción tiene 4 bytes. Por tanto, a la parada se le asigna una dirección 12 (0xC).

La vinculación con una dirección base diferente para las instrucciones dará como resultado la asignación de un conjunto diferente de direcciones a las etiquetas.

```
# arm-none-eabi-ld -Ttext=0x20000000 -o add.elf add.o
 rm-none-eabi-nm add.el
arm-none-eabi-nm: 'add.el': No such file
sh-3.2# arm-none-eabi-nm add.elf
.....
20000000 t start
2000000c t stop
```

El archivo de salida creado por ld está en un formato llamado ELF. Hay varios formatos de archivo disponibles para almacenar código ejecutable. El formato ELF funciona bien cuando tienes un sistema operativo, pero como vamos a ejecutar el programa en **bare metal**, tendremos que convertirlo a un formato de archivo más simple llamado formato __binary__.

Un archivo en formato __binary__ contiene bytes consecutivos de una dirección de memoria específica. No se almacena ninguna otra información adicional en el archivo. Esto es conveniente para las herramientas de "programación Flash", ya que todo lo que se debe hacer al programar es copiar cada byte en el archivo, a una dirección consecutiva comenzando desde una dirección base especificada en la memoria.

```
objcopy -O <output-format> <in-file> <out-file>
```

Para convertir add.elf a formato binario, se puede utilizar el siguiente comando.

```
# arm-none-eabi-objcopy -O binary add.elf add.bin
```
Verifique el tamaño del archivo. El archivo tendrá exactamente 16 bytes. Dado que hay 4 instrucciones y cada instrucción ocupa 4 bytes.

```
# ls -al add.bin
-rwxr-xr-x  1 root  wheel  16 May  7 13:53 add.bin
```







