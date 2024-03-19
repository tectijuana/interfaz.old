# Introducción

La mayoría de los programas universitarios de informática ahora imparten la mayor parte de su instrucción en lenguajes de nivel bastante alto, como CSharp, que no requieren que se tenga que saber mucho sobre la arquitectura informática subyacente. Creo que esto tiende a crear brechas bastante grandes en la comprensión, lo que puede conducir a errores bastante graves en el diseño del programa. Aprender a programar C lo acerca más al Bare-Metal, ya que necesita saber más sobre la memoria y el almacenamiento de bajo nivel, pero nada realmente le enseña cómo funciona la computadora que hacer algo de programación en lenguaje ensamblador. El sistema operativo Raspbian viene con el ensamblador GNU pre-instalado, por lo que tiene todo lo que necesita para probar la programación de Assembler desde el primer momento. Aprender un poco de ensamblador le enseñará cómo funciona el procesador ARM de Raspberry Pi, cómo una arquitectura RISC moderna procesa las instrucciones y cómo el trabajo se divide entre la CPU ARM y los diversos coprocesadores que se incluyen en el mismo chip.

# Un poco de historia
El procesador ARM se desarrolló originalmente para ser un procesador de bajo costo para la computadora educativa británica Acorn. Los desarrolladores de ARM sintieron que tenían algo y negociaron una división en una compañía separada que vendía diseños de CPU a los fabricantes de hardware. Su primera gran venta fue a Apple para proporcionar una CPU para el primer PDA de Apple, el Newton. Su primer gran éxito fue la inclusión del diseño de su chip en los iPod de Apple. En el camino, muchos fabricantes de chips como TI, que habían renunciado a competir en CPU, construyeron computadoras de un solo chip alrededor del ARM. Estos terminaron siendo incluidos en casi todos los teléfonos celulares, incluidos los de Nokia y Apple. Hoy en día, todos los teléfonos Android también se basan en diseños ARM

# Instrucciones para ensamblador ARM
Ha habido muchos diseños ARM desde los primeros procesadores simples de 16 bits hasta diseños actuales de 64 bits. En este artículo solo se va a considerar el procesador ARM en la Raspberry Pi, que es un procesador de 64 bits, pero Raspbian sigue siendo un sistema operativo de 32 bits, así que solo sobre el procesamiento de 32 bits para el ejemplo y practicas.


ARM es un procesador RISC, lo que significa que la idea es que ejecute instrucciones muy simples muy rápidamente. La idea es mantener el procesador principal simple para reducir la complejidad y el uso de energía. Cada instrucción tiene una longitud de 32 bits, por lo que el procesador no necesita pensar en cuánto incrementar el contador del programa para cada instrucción. Curiosamente, casi todas las instrucciones están en el mismo formato, donde puede controlar si establece los bits de estado, puede probar los bits de estado sobre si debe hacer algo y puede tener cuatro parámetros de registro (o 2 registros y una constante inmediata). También se puede aplicar una operación de cambio a uno de los registros. Entonces, ¿cómo se incluye todo esto en una instrucción de 32 bits? Hay 16 registros en la CPU ARM (estos incluyen el contador de programa, el registro de retorno de enlace y el puntero de pila). También existe el registro de estado que no se puede usar como un registro de propósito general, por lo que especificar 4 registros quita 16 bits de la instrucción.

![](posterARM.png)

La extensión de archivo '.s' se usa comúnmente para todas las formas de código ensamblador, depende de nosotros recordar que esto es ARMv7.

Analizamos la función de cada línea del código ensamblador y luego traducimos esa lógica a C. El programa original en ensamblador realiza las siguientes operaciones:

1. Inicializa el registro R0 con el valor 17 (decimal).
2. Realiza un desplazamiento lógico a la izquierda (LSL) del valor en R0 por 2 bits, lo cual equivale a multiplicar el valor en R0 por 4. Dado que el valor inicial es 17, después de este paso, R0 contendrá 68.
3. Establece R7 con el valor 1, que prepara la llamada al sistema para terminar el programa.
4. Realiza una llamada al sistema (syscall) con svc 0 para terminar el programa y regresar al sistema operativo.
6. La equivalencia en C sería un programa que inicializa una variable con el valor 17, la multiplica por 4 y luego termina. La llamada al sistema para terminar el programa se maneja automáticamente en C cuando la ejecución llega al final de la función main, por lo tanto, no es necesario traducir explícitamente las instrucciones relacionadas con R7 y svc 0.

Se presenta la demostración, recordando que el curso debe de documentar con calidad:

Programa **prueba.s**
```asm
@ Aqui van las generales del programador
@ Código C complemenario 
@
.global _start              @ Proporcionar la dirección de inicio del programa al enlazador (linker)
_start: mov     R0, #17     @ Utilice 17 (decimal) como ejemplo de prueba
        lsl     R0, #2      @ Desplazar R0 a la izquierda en 2 bits (es decir, multiplicar por 4)
        mov     R7, #1      @ El código de comando de servicio 1 finaliza este programa,
        svc     0           @ para regresar al Sistemas Operativo
```


![](readme-makefile.png)

# makefile Para automatizar la compilación

__Un Makefile es un archivo utilizado por la herramienta de automatización de la construcción make para definir un conjunto de tareas a realizar. Estas tareas pueden incluir la compilación de código fuente, la ejecución de scripts, y otras actividades relacionadas con la construcción y mantenimiento de proyectos de software. Un Makefile contiene reglas que especifican cómo generar los archivos objetivo (targets) a partir de los archivos fuente. Cada regla puede tener dependencias, que son archivos que necesitan existir o estar actualizados antes de que la regla pueda ejecutarse.__

> Versión básica
```makefile
prueba: prueba.o
     ld -o prueba prueba.o

prueba.o: model.s
     as -g -o prueba.o prueba.s

clean:
     rm prueba prueba.o
```

__En el contexto de compilar código en ensamblador para sistemas operativos basados en Raspbian (un sistema operativo para Raspberry Pi basado en Debian), un Makefile puede facilitar el proceso al automatizar las siguientes tareas:__

**Especificación de archivos fuente:** Se pueden definir variables o reglas para especificar los archivos de ensamblador que deben compilarse.

**Compilación condicional:** Basado en las dependencias, sólo se recompilan los archivos que han cambiado, ahorrando tiempo en el proceso de desarrollo.

**Enlazado:** Después de compilar los archivos de ensamblador a código objeto, make puede invocar al enlazador para generar el ejecutable final.

**Limpieza:** Se pueden definir reglas para eliminar los archivos objeto y ejecutables generados, permitiendo una reconstrucción limpia del proyecto.

**Automatización de pruebas:**  Ejecución de pruebas automatizadas después de la construcción para asegurar que los cambios no rompan la funcionalidad existente.

---
> Versión extensa (se ven mas detalles)

```makefile
# MAKEFILE para automatizar la compilación

# Define el archivo fuente en ensamblador
SRC = prueba.s

# Define el nombre del archivo de salida
OUT = prueba

# Define el ensamblador y las banderas
AS = as
ASFLAGS = -g

# Define el enlazador y las banderas
LD = ld
LDFLAGS =

# Define el GCC o G++ segun corresponda
GCC = gcc
GCCFLAGS =  -g

# Corrida de make
all: $(OUT)

$(OUT): $(SRC)
	$(AS) $(ASFLAGS) $(SRC) -o $(OUT).o
	$(GCC) $(LDFLAGS) $(OUT).o -o $(OUT)
# Borra temporales y ejecutable
clean:
	rm -f $(OUT) $(OUT).o
# Corrida
run: $(OUT)
	./$(OUT)
# Entrar al Debugger
gef: $(OUT)
	gdb  $(OUT)
```
----


# DESENSAMBLAR DESDE C++ a ASM

1. FUENTE 
    El código funte desde C a desensamblar será el siguiente:
```c
# Encabezado dle programador
# Archivo listado.cpp
#include <iostream>

using namespace std;

int main() {
  for (int x = 9; x <= 43; x++) {
    cout << x << endl;
  }
}
```

```bash
$ make listado
```

__Donde el Makefile es:__
```bash
# Definir el compilador
CXX=g++

# Definir las flags de compilación
CXXFLAGS=-Wall

# Nombre del programa (output)
PROGRAM=listado

# Regla all es la regla por defecto
all: $(PROGRAM)

# Compilar el programa
$(PROGRAM): listado.o
    $(CXX) $(CXXFLAGS) -o $(PROGRAM) listado.o

# Compilar el archivo fuente
listado.o: listado.cpp
    $(CXX) $(CXXFLAGS) -c listado.cpp

# Regla para limpiar archivos compilados
clean:
    rm -f *.o $(PROGRAM)
```

---


1. TECNICA B: Desensamblar el ejecutable
Corremos object dump con la opcion **-d** que significa dissasemblee en el ejecutable deseado, y usamos una redireccion de salida simbolo '>' para escribir el código ensamblador resultante en el archivo comparar.s

```bash
$ g++ -S -o listado.s listado.cpp -fno-asynchronous-unwind-tables
```

__El parámetro **-S*** nos convierte el código **cpp** a ensamblador y los parámetros **-fno-asynchronous-unwind-tables** nos quita directivas que se crean para los lenguajes que utilizan excepciones__

Para comprobar que fue desensamblado correctamente vamos a abrir el archivo Problema1.s con nano, aquí el comando:
```bash
nano Problema1.s
```

__Se muestra que ahora existe el archivo comparar.s luego de ejecutar el comando.__



2. TECNICA A: Desensamblar el ejecutable

_Una vez que tenemos el código vamos a compilarlo y desensamblarlo con el siguiente comando: OBJDUMP, forma parte de las herramientas de ARM-ToolChain_ 
```bash
$ objdump -d listado > listado.s
```


Bibliografía: 
https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/ok01.html
