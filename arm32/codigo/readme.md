# Introducción

La mayoría de los programas universitarios de informática ahora imparten la mayor parte de su instrucción en lenguajes de nivel bastante alto, como CSharp, que no requieren que se tenga que saber mucho sobre la arquitectura informática subyacente. Creo que esto tiende a crear brechas bastante grandes en la comprensión, lo que puede conducir a errores bastante graves en el diseño del programa. Aprender a programar C lo acerca más al Bare-Metal, ya que necesita saber más sobre la memoria y el almacenamiento de bajo nivel, pero nada realmente le enseña cómo funciona la computadora que hacer algo de programación en lenguaje ensamblador. El sistema operativo Raspbian viene con el ensamblador GNU pre-instalado, por lo que tiene todo lo que necesita para probar la programación de Assembler desde el primer momento. Aprender un poco de ensamblador le enseñará cómo funciona el procesador ARM de Raspberry Pi, cómo una arquitectura RISC moderna procesa las instrucciones y cómo el trabajo se divide entre la CPU ARM y los diversos coprocesadores que se incluyen en el mismo chip.

# Un poco de historia
El procesador ARM se desarrolló originalmente para ser un procesador de bajo costo para la computadora educativa británica Acorn. Los desarrolladores de ARM sintieron que tenían algo y negociaron una división en una compañía separada que vendía diseños de CPU a los fabricantes de hardware. Su primera gran venta fue a Apple para proporcionar una CPU para el primer PDA de Apple, el Newton. Su primer gran éxito fue la inclusión del diseño de su chip en los iPod de Apple. En el camino, muchos fabricantes de chips como TI, que habían renunciado a competir en CPU, construyeron computadoras de un solo chip alrededor del ARM. Estos terminaron siendo incluidos en casi todos los teléfonos celulares, incluidos los de Nokia y Apple. Hoy en día, todos los teléfonos Android también se basan en diseños ARM

# Instrucciones para ensamblador ARM
Ha habido muchos diseños ARM desde los primeros procesadores simples de 16 bits hasta diseños actuales de 64 bits. En este artículo solo se va a considerar el procesador ARM en la Raspberry Pi, que es un procesador de 64 bits, pero Raspbian sigue siendo un sistema operativo de 32 bits, así que solo sobre el procesamiento de 32 bits para el ejemplo y practicas.


ARM es un procesador RISC, lo que significa que la idea es que ejecute instrucciones muy simples muy rápidamente. La idea es mantener el procesador principal simple para reducir la complejidad y el uso de energía. Cada instrucción tiene una longitud de 32 bits, por lo que el procesador no necesita pensar en cuánto incrementar el contador del programa para cada instrucción. Curiosamente, casi todas las instrucciones están en el mismo formato, donde puede controlar si establece los bits de estado, puede probar los bits de estado sobre si debe hacer algo y puede tener cuatro parámetros de registro (o 2 registros y una constante inmediata). También se puede aplicar una operación de cambio a uno de los registros. Entonces, ¿cómo se incluye todo esto en una instrucción de 32 bits? Hay 16 registros en la CPU ARM (estos incluyen el contador de programa, el registro de retorno de enlace y el puntero de pila). También existe el registro de estado que no se puede usar como un registro de propósito general, por lo que especificar 4 registros quita 16 bits de la instrucción.

![](posterARM.png)

La extensión de archivo '.s' se usa comúnmente para todas las formas de código ensamblador, depende de nosotros recordar que esto es ARMv6.

Se presenta un breve ejemplo:

Programa **prueba.s**
```asm
.global _start              @ Proporcionar la dirección de inicio del programa al enlazador (linker)
_start: mov     R0, #17     @ Utilice 17 (decimal) como ejemplo de prueba
        lsl     R0, #2      @ Desplazar R0 a la izquierda en 2 bits (es decir, multiplicar por 4)
        mov     R7, #1      @ El código de comando de servicio 1 finaliza este programa,
        svc     0           @ para regresar al Sistemas Operativo
```


# MAKE file

Archivo MAKE agilizar la compilación (https://www.gnu.org/software/make/), los estudiantes lo adoptarán para automatizar la invocación a la compilador, enlazador y borrar la basura que deja este último.

```make
prueba: prueba.o
     ld -o prueba prueba.o

prueba.o: model.s
     as -g -o prueba.o prueba.s

clean:
     rm prueba prueba.o
```

# DESENSAMBLAR DESDE C++ a ASM
El código a desensamblar será el siguiente:
```c
#include <iostream>

using namespace std;

int main() {
  for (int x = 9; x <= 43; x++) {
    cout << x << endl;
  }
}
```

# TÉCNICA PARA DESENSAMBLAR
_Una vez que tenemos el código vamos a compilarlo y desensamblarlo con el siguiente comando:_
```bash
$ objdump -d comparar > comparar.s
```
Forma parte de las herramientas de ARM-ToolChain

----

# OTRA TÉCNICA PARA DESENSAMBLAR
Corremos object dump con la opcion **-d** que significa dissasemblee en el ejecutable deseado, y usamos una redireccion de salida de linux '>' para escribir el código ensamblador resultante en el archivo comparar.s
_NOTA: Previamente compilado con AS,GCC_


```bash
g++ -S -o Problema1.s Problema.cpp -fno-asynchronous-unwind-tables
```

__El parámetro **-S**** nos convierte el código **cpp** a ensamblador y los parámetros **-fno-asynchronous-unwind-tables** nos quita directivas que se crean para los lenguajes que utilizan excepciones__

Para comprobar que fue desensamblado correctamente vamos a abrir el archivo Problema1.s con nano, aquí el comando:
```bash
nano Problema1.s
```

__Se muestra que ahora existe el archivo comparar.s luego de ejecutar el comando.__

Bibliografía: 
https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/ok01.html
