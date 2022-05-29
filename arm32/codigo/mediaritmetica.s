 @@
    @@ Instituto Tecnologico de Tijuana
    @@ Depto de Sistemas y Computación
    @@ Ing. En Sistemas Computacionales
    @@
    @@ Autor : Abraham Jhared Flores Azcona @nickname NotsoJharedtrollOx17
    @@ Repositorio: http://github.com/tectijuana/avance31al48-NotsoJharedtrollOx17
    @@ Fecha de revisión: 09/05/2022
    @@
    @
    @ Objetivo del programa:
    @    Obtiene la media aritmetica de 5 pares de valores (truncado a enteros)
    @
    @Entradas, procesos y salidas:
    @   ARM32
    @
    @ Errores a reportar / retroalimentar
    @
    @  TODO el codigo fue redactado totalmente en ensamblador
    @

@ DATA SECTION

.data
string:	.asciz	"%d\n"

@ CODE SECTION

.text
.extern printf
.global main
main:
	@ primera ...
	push	{r0, r1}	@ almacenamiento de valores iniciales
	mov 	r0, #3
	mov 	r1, #2
	add 	r2, r0, r1	@ (r0+r1)
	mov 	r2, r2, LSR #1	@ (r0+r1)/2
	mov 	r1, r2		@ impresion del resultado...
	ldr 	r0, =string
	bl	printf

	@ segunda ...
        mov     r0, #4
        mov     r1, #6
        add     r2, r0, r1
        mov     r2, r2, LSR #1
        mov     r1, r2
        ldr     r0, =string
        bl      printf

	@ tercera ...
        mov     r0, #7
        mov     r1, #2
        add     r2, r0, r1
        mov     r2, r2, LSR #1
        mov     r1, r2
        ldr     r0, =string
        bl      printf

	@ cuarta ...
        mov     r0, #0
        mov     r1, #3
        add     r2, r0, r1
        mov     r2, r2, LSR #1
        mov     r1, r2
        ldr     r0, =string
        bl      printf

	@ quinta ...
        mov     r0, #3
        mov     r1, #5
        add     r2, r0, r1
        mov     r2, r2, LSR #1
        mov     r1, r2
        ldr     r0, =string
        bl      printf
	pop	{r0, r1}	@ recuperacion de estados iniciales para salir
	bx	lr		@ BREAK
