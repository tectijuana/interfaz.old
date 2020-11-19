![](imagen/portadatcnm.png)

#    Tecnológico Nacional de México
#   Instituto Tecnológico de Tijuana
#        Subdirección Académica

# Departamento de Sistemas y Computación
# Ingeniería en Sistemas Computacionales
# Lenguajes de interfaz 

# Practica Bloque: 
## Exposición de bloques ARM32
# Objetivo: 
## Exponer el tema "Registros del poster de ARM32"


# 📝 Apellidos, Nombres y Num Control
## Armenta Peña José Francisco 18212146
## Diaz Dzib Victor Ivan 18212170
## Domínguez Ortiz Oscar Ivan 18212174
## Martinez Estrada Ana Karen 16320885
## Medina Isiordia Pedro Luis 18212218
## Mendoza Perez Max William 17620246
## Rodríguez Emmanuel Arturo 18212261
   

# Profesor:
# MC. René Solis Reyes
# Semestre sep - ene 2020








![](https://images.cooltext.com/5478067.png)

<a href="http://cooltext.com" target="_top"><img src="https://cooltext.com/images/ct_pixel.gif" width="80" height="15" alt="Cool Text: Logo and Graphics Generator" border="0" /></a>


## ¿Qué son los registros?

Los registros son la memoria más cercana a un procesador que existe y por tanto la más rápida; se trata de memorias muy pequeñas que pueden ser manipuladas de manera directa por la unidad de control del procesador. Los registros permiten guardar transitoriamente y acceder a valores muy usados, generalmente en operaciones matemáticas.

La arquitectura ARMv6 presenta un conjunto de 17 registros (16 principales más uno de estado) de 32 bits cada uno. 



*   Registros Generales. Su función es el almacenamiento temporal de datos. Son los 13 registros que van R0 hasta R12. 
*   Registros Especiales. Son los últimos 3 registros principales: R13, R14 y R15. Como son de propósito especial, tienen nombres alternativos.
*   Registro de estado: Almacena las banderas condicionales y los bits de control.



![alt_text](https://github.com/tectijuana/armposter-the_kings_of_arm/blob/main/imagen/image1.PNG)


## Registros generales (R0 a R12) 

 


![alt_text](https://github.com/tectijuana/armposter-the_kings_of_arm/blob/main/imagen/image2.PNG)

** 	**

Los registros del R0 al R12 son registros de propósito general, enfocados principalmente para realizar operaciones.

Estos están divididos en registros altos y bajos debido a que algunas instrucciones Thumb solo acceden del R0 a R7.

Registros de propósito general R0-R7: **(32 bits) también llamados registros bajos se puede acceder mediante instrucciones de Thumb de 16-bit y Thumb-2 de 23 bits. Su valor luego del reset es impredecible.

Registros de propósito general R8-R12: **(32 bits) también llamados registros bajos se puede acceder mediante instrucciones de Thumb-2 mas no por todas las instrucciones Thumb Thumb de 16 bits, su valor luego del reset es impredecible.

## Registros especiales (R13,R14,R15)

Son los últimos 3 registros principales: R13, R14 y R15. Como son de propósito especial, tienen nombres alternativos.

**SP/R13.** Stack Pointer o Puntero de Pila. Sirve como puntero para almacenar variables locales y registros en llamadas a funciones.

**LR/R14.** Link Register o Registro de Enlace. Almacena la dirección de retorno cuando una instrucción BL ó BLX ejecuta una llamada a una rutina.

**PC/R15.** Program Counter o Contador de Programa. Es un registro que indica la posición donde está el procesador en su secuencia de instrucciones. Se incrementa de 4 en 4 cada vez que se ejecuta una instrucción, salvo que ésta provoque un salto.

## ¿Qué es Registro de estado (CPSR)?

El CPSR(The Current Program Status Register) es un registro de 32 bits de ancho que se utiliza en la arquitectura ARM para registrar varias piezas de información sobre el estado del programa que está ejecutando el procesador y el estado del procesador. Esta información se registra estableciendo o borrando bits específicos en el registro.



![alt_text](https://github.com/tectijuana/armposter-the_kings_of_arm/blob/main/imagen/image3.PNG)

Los cuatro bits superiores (bits 31, 30, 29 y 28) son los bits del código de condición (cc) y son los que más nos interesan. Los bits de código de condición a veces se denominan "flags". Los 8 bits más bajos (del bit 7 al bit 0) almacenan información sobre el propio estado del procesador. Los bits restantes (es decir, el bit 27 al bit 8) actualmente no se utilizan en la mayoría de los procesadores ARM.

## Bits de control  y Flags (N,Z,C,V)


![alt_text](https://github.com/tectijuana/armposter-the_kings_of_arm/blob/main/imagen/image4.PNG)


Los bits de control muestran la ubicación en el área de entrada/salida de la memoria de datos.

Las banderas (flags) son las que reflejan el resultado de la ejecución de algunas instrucciones (principalmente aritméticas, lógicas, etc.)

**Bit 7 - I: Habilitación de Interrupción Global (Global Interrupt Enable)**

El bit de habilitación de interrupción global se debe establecer para las interrupciones que se activen. Si el registro de activación global de interrupciones se borra, ninguna de las interrupciones estará habilitada independientemente de la configuración individual. El I-bit se borra por hardware después de haberse producido una interrupción, y se establece por la instrucción RETI con el fin de habilitar las interrupciones posteriores. El bit I también se puede establecer y borrar por software con las instrucciones de SEI y CLI, como se describe en la referencia del conjunto de instrucciones(instruction set).i

**Bit 6 - T: Bit Copy Storage**

Las instrucciones de copia de bits BLD (Bit LoaD) y BST (Bit STore) utilizan el T-bit como origen o destino para el bit operado. Un bit de un registro en el archivo de Registro se puede copiar en T por la instrucción BST, y un bit en T se puede copiar en un bit en un registro en el archivo de registro con la instrucción BLD.

**Bit 5 - H: Bandera de medio acarreo (Half Carry Flag)**

La bandera de half-carry H indica un Carry intermedio en algunas operaciones aritméticas. El medio acarreo es útil en aritmética BCD. Ver la sección "Instruction set Description" para obtener información detallada.(ver datasheet)

**Bit 4 - S: Bit de Signo, S = N XOR V**

El bit-S es siempre una OR exclusiva entre la bandera negativa N y la bandera V - desbordamiento en complemento a 2. Ver la sección "Instruction set Description" para obtener información detallada.(ver datasheet)

**Bit 3 - V: Bandera de desborde en complemento a 2.**

Utilizada en aritmética en complemento a 2.

**Bit 2 - N: Bandera Negativo.**

Indica si el resultado de una operación aritmética o lógica es negativo.

**Bit 1 - Z: Bandera Cero**

Indica si el resultado de una operación aritmética o lógica es cero.

**Bit 0 - C: Bandera de Carry**

La bandera de carry C indica una llevada en una operación aritmética o lógica.

## ¿Qué es Endianness?

El término inglés endianness ("extremidad") designa el formato en el que se almacenan los datos de más de un byte en un ordenador. El problema es similar a los idiomas en los que se escriben de derecha a izquierda, como el árabe, o el hebreo, frente a los que se escriben de izquierda a derecha, pero trasladado de la escritura al almacenamiento en memoria de los bytes.

No se debe confundir trivialmente el orden de escritura textual en este artículo con el orden de escritura en memoria, por ello establecemos que lo que escribimos primero lleva índices de memoria más bajos, y lo que escribimos a continuación lleva índices más elevados, que lo que lleva índices bajos es previo en memoria, y así sucesivamente, siguiendo la ordenación natural de menor a mayor, por ejemplo la secuencia {0,1,2} indicaría, -algo más allá de la intuición- que 0 es previo y contiguo en el espacio de memoria a 1, etc.

Usando este criterio el sistema big-endian adoptado por Motorola entre otros, consiste en representar los bytes en el orden "natural": así el valor hexadecimal 0x4A3B2C1D se codificaría en memoria en la secuencia {4A, 3B, 2C, 1D}. En el sistema little-endian adoptado por Intel, entre otros, el mismo valor se codificaría como {1D, 2C, 3B, 4A}, de manera que de este modo se hace más intuitivo el acceso a datos, porque se efectúa fácilmente de manera incremental de menos relevante a más relevante (siempre se opera con incrementos de contador en la memoria), en un paralelismo a "lo importante no es como empiezan las cosas, sino como acaban."

Algunas arquitecturas de microprocesador pueden trabajar con ambos formatos (ARM, PowerPC, DEC Alpha, PA-RISC, Arquitectura MIPS), y a veces son denominadas sistemas middle-endian.

## Big Endian, Little Endian

Cuando se trata de trabajar con datos de más de un byte , a la hora de expresar estos datos tenemos que definir el concepto de byte más representativo (MSB) y byte menos representativo (LSB), que se le denomina así al byte que al modificarlo altera el dato en  mayor medida y al que lo hace en menor medida.

Para esto existen dos formatos Big Endian que es aquel que ordena los bytes del más significativo al menos significativo y el Little Endian es aquel que lo hace del menos significativo al más significativo.

![alt_text](https://github.com/tectijuana/armposter-the_kings_of_arm/blob/main/imagen/image5.PNG)

**Big Endian**

Este formato que puede parecer una forma más "natural" de escritura es utilizado por procesadores usados en máquinas Apple entre otras.

Los datos 13 y "trece" expresados en hexadecimal son **0x3133** y **0x74726563650d0a**, pues bien escritos como datos de 2 bytes en formato Big Endian quedan:** 0x31 0x33 **y** 0x74 0x72 0x65 0x63 0x65 0x0d 0x0a**

**Little Endian**

Este formato es adoptado por la mayoría de procesadores Intel. Los datos 13 y "trece" expresados en hexadecimal son **0x3133** y **0x74726563650d0a** como datos de 2 bytes en formato Little Endian quedan: **0x33 0x31** y **0x0a 0x0d 0x65 0x63 0x65** **0x72 0x74**

## Fuentes consultadas:

[https://riuma.uma.es/xmlui/bitstream/handle/10630/10214/LibroDePracticas.pdf?sequence=1&isAllowed=y](https://riuma.uma.es/xmlui/bitstream/handle/10630/10214/LibroDePracticas.pdf?sequence=1&isAllowed=y) 
**Consultado el 28/10/2020**

[https://www.cs.buap.mx/~andrex/ensamblador/EnsambladorInstrucciones.pdf](https://www.cs.buap.mx/~andrex/ensamblador/EnsambladorInstrucciones.pdf) **Consultado el 20/10/2020**

[http://www.tugurium.com/docs/endianness.php](http://www.tugurium.com/docs/endianness.php) **Consultado el 28/10/2020**

[https://agilescientific.com/blog/2017/3/31/little-endian-is-legal](https://agilescientific.com/blog/2017/3/31/little-endian-is-legal) **Consultado el 28/10/2020**

[http://catarina.udlap.mx/u_dl_a/tales/documentos/lem/jimenez_a_fy/capitulo2.pdf](http://catarina.udlap.mx/u_dl_a/tales/documentos/lem/jimenez_a_fy/capitulo2.pdf) **Consultado el 29/10/2020**

[http://laboratorios.fi.uba.ar/lse/seminario/material-1erC2010/Tecnicas_Digitales_II-R4052-2010-Cortex_M3-Fundamentos.pdf](http://laboratorios.fi.uba.ar/lse/seminario/material-1erC2010/Tecnicas_Digitales_II-R4052-2010-Cortex_M3-Fundamentos.pdf)  **Consultado el 29/10/2020**

[http://www.sc.ehu.es/sbweb/webcentro/automatica/web_avr/archivos/Manual_AT90S8515/Arquitectura/registro_estado&stack_pointer.htm](http://www.sc.ehu.es/sbweb/webcentro/automatica/web_avr/archivos/Manual_AT90S8515/Arquitectura/registro_estado&stack_pointer.htm) **Consultado el 29/10/2020**

[https://gulliver.readthedocs.io/en/stable/What-is-Endianness.html](https://gulliver.readthedocs.io/en/stable/What-is-Endianness.html) **Consultado el 29/10/2020**



**liga de meet**
https://meet.google.com/tzt-pxso-iru
