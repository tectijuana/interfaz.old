

/*
Title: Practica 0 Templete para programa ARM Assembly   
Filename: hello.s
Autor: ____Aqui su nombre___
Date: ______
Description : Hola Mundo en ARM Assembly
Imput: -
Ouput: HOLA MUNDO to console
*/

@ hello.s programa usa los recursos básicos
.section	.data
.section	.text
.globl		_start
_start:		
nop		@ no operation
mov r7, $1	@ exit syscall
svc $0		@ wake kernel
.end
