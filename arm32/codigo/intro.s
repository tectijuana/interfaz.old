/*Programa realizado por: Luis eduardo*/
/*Trabajo realizado en el 27/09/22*/

.data		/*Aqui se definen todas las variables del programa con el objeto de reservar memoria*/

var1: .word 3		/* variable alineada a el tamanio palabra */
var2: .word 4		/* variable alineada a el tamanio palabra */
var3: .word 0x1234	/* tipo word de 32 bits maximos*/

.text		/*Aqui se empieza a escribir el codigo a utilizar*/

.global main		/*Aqui indicamos que esto es accesible desde cualquie programa*/

main:   ldr r1, puntero_var1 	/* r1 <- & var1 */	/*aqui se hace referencia al valor del tamanio de la palabra (32 bits)*/
	ldr r1, [ r1 ] 		/* r1 <- *r1 */		/*Aqui se obtiene el valor de la variable del puntero que contiene la direccion*/
	ldr r2, puntero_var2 	/* r2 <- & var2 */	/*Aqui se hace referencia al valor del tamanio de la palabra (32 bits)*/
	ldr r2, [ r2 ] 		/* r2 <- *r2 */		/*Aqui se obtiene el valor de la variable del puntero que contiene la direccion*/
	ldr r3, puntero_var3 	/* r3 <- & var3 */	/*aqui se hace referencia al valor del tamanio de la palabra (32 bits)*/
	add r0, r1, r2 		/* r0 <- r1 + r2 */
	str r0, [ r3 ] 		/* *r3 <- r0 */
	bx lr

puntero_var1: .word var1
puntero_var2: .word var2
puntero_var3: .word var3
