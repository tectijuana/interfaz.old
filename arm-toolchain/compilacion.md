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

