    @@
    @@ Instituto Tecnologico de Tijuana
    @@ Depto de Sistemas y Computación
    @@ Ing. En Sistemas Computacionales
    @@   
    @@ Autor : ___________ @nickname ____
    @@ Repositorio: http://github.com/tectijuana/_______
    @@ Fecha de revisión: ____
    @@ 
    @
    @ Objetivo del programa:
    @    Aqui redactar .... utilize este simple bloque para documentar sus proyectos
    @
    @ Entradas, procesos y salidas:
    @   Thumb-2, ARM64, ...
    @
    @ Errores a reportar / retroalimentar
    @   Para .....
    @
    @ 

.section .text
.global _start
.arm

// Programa en ambiente (32-bit) mode ARM.
_start:
    mov r0, #1               @ STDOUT
    adr r1, label            @ R1 = dirección de la cadena (string)
    mov r2, #13              @ R2 = tamaño de la cadena
    mov r7, #4               @ R7 = syscall number for 'write'
    svc #0                   @ invocar syscall
_exit:
    mov r7, #1               @ R7 = syscall para salir del sistema 'exit'
    svc #0                   @ invocar syscall
label:
.string "Hola Mundo \n"
