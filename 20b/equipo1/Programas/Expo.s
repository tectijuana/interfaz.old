/*

Equipo: The King of ARM
Armenta Peña José Francisco 18212146
Diaz Dzib Victor Ivan 18212170
Domínguez Ortiz Oscar Ivan 18212174
Martinez Estrada Ana Karen 16320885
Medina Isiordia Pedro Luis 18212218
Mendoza Perez Max William 17620246
Rodríguez Emmanuel Arturo 18212261

Programa en ARM32: Programa demostración de registros

Fecha: 3/Nov/2020

Materia: Lenguajez de Interfaz

*/


.data

var1: .word 	3  /*Crea una variable de tipo word para guardar el numero 3*/
var2: .word 	4/*Crea una variable de tipo word para guardar el numero 4*/
var3: .word 	0x1234 /*Crea una variable de tipo word para guardar el resultado de la suma*/
.text
.global main

main:   ldr r1, puntero_var1 	/* r1 <- & var1 */
		ldr r1, [ r1 ] 		/* r1 <- *r1 */
		ldr r2, puntero_var2 	/* r2 <- & var2 */
		ldr r2, [ r2 ] 		/* r2 <- *r2 */
		ldr r3, puntero_var3 	/* r3 <- & var3 */
		add r0, r1, r2 		/* r0 <- r1 + r2 */
		str r0, [ r3 ] 		/* *r3 <- r0 */
		bx 	lr

/*Creación de los punteros para almacenar las variables*/
puntero_var1: .word var1 
puntero_var2: .word var2
puntero_var3: .word var3
