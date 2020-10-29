/*    
@@
@@ Instituto Tecnologico de Tijuana
@@ Depto de Sistemas y Computación
@@ Ing. En Sistemas Computacionales
@@   
@@ Autor : Ezequiel Galván Rodríguez @nickname: Ezequiel1721
@@ Repositorio: https://github.com/Ezequiel1721/ResumenARM32.git
@@ Fecha de revisión: 23/10/2020
@@ 
@
@ Objetivo del programa:
@    Supón que tienes dos valores 11110000b y 10101010b. Calcula el resultado de
@    hacer una operación AND y una operación OR entre los dos valores.
@-------------------------------------------------------------------------
@                               Sección de Código
@-------------------------------------------------------------------------
*/

.text
.global main

main :	mov r2, # 0b11110000 		/* r2 <- 11110000 */
	mov r3, # 0b10101010 		/* r3 <- 10101010 */
	and r0, r2, r3 			/* r0 <- r2 AND r3 */
	orr r1, r2, r3 			/* r1 <- r2 OR r3 */
	mvn r4, r0 			/* r4 <- NOT r0 */
	mov r0, # 0x80000000
	tst r0, # 0x80000000
	tst r0, # 0x40000000
	bx lr
