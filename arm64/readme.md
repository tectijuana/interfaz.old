# De lenguaje c a ensamblador dentro de AWS en plataforma ARM 64 bits


Aplicar soporte a su Sistema Operativo en GCC.

```
sudo apt install build-essential
```

La estructura de un mínimo "¡Hola mundo!" en Lenguaje C

Nuestro objetivo es traducir la siguiente aplicación en CLang "¡Hola, mundo!" 

```
#include <stdio.h>
int main (void)
{
	printf("Hola Mundo \n");
	return 0;
}
```

Para compilarlo usar:

```
gcc -o holamundo holamundo.c
```

Y lo ejecutamos asi:
```
➜ ./holamundo
Hola Mundo
```
----

# Ensamblador en arquitectura ARM 64 bits

## Usamos archivos con extensión ".s" de SOURCE (fuente) para este ejemplo usaremos holamundo.s

```
.data

/* Segmento de Datos: define el mensaje y calula el tramaño de la cadena. */
msg:
    .ascii        "Hello, ARM64!\n"
len = . - msg

.text

/* Cuerpo del programa para desplegar la variable anterior. */
.globl _start
_start:
    /* syscall write(int fd, const void *buf, size_t count) */
    mov     x0, #1      /* fd := STDOUT_FILENO */
    ldr     x1, =msg    /* buf := msg */
    ldr     x2, =len    /* count := len */
    mov     w8, #64     /* write is syscall #64 */
    svc     #0          /* invoke syscall */

    /* syscall exit(int status) */
    mov     x0, #0      /* status := 0 */
    mov     w8, #93     /* exit is syscall #1 */
    svc     #0          /* invoke syscall */
```

Para compilarlo usar:

```
as -o holamundo.o holamundo.s
ld -o holamundo holamundo.o
```

Y lo ejecutamos asi:
```
➜ ./hello
Hello, ARM64!
```

## Practica 0: modifica el programa agregando:
- Encabezados del titulo de programa, fecha, programador, etc
- Edita el mensaje de salida personalizado
- Subir el programa a su GitHub persona
- Clonar repositorio en AWS y compilar-ejecutar


