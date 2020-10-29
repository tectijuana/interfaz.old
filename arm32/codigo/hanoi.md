# Torres recursivas de Hanoi


![](hanoi.gif)

__Este es el típico programa recursivo de Towers of Hanoi. Puede leer más sobre este típico problema informático en Wikipedia.__

La versión Python de este programa se da a continuación


```python
# towers of Hanoi
# D. Thiebaut

def moveDisks(n, Source, Dest, Extra ):
    if n==1:
        print( "Move disk from", Source, "to", Dest )
    else:
        moveDisks( n-1, Source, Extra, Dest )
        moveDisks( 1, Source, Dest, Extra )
        moveDisks( n-1, Extra, Dest, Source )

def main():
    n = int( input( "How many disks? " ) )
    moveDisks( n, 'A', 'B', 'C' )

main()
```
---

Versión 1: Número fijo de discos


Pasamos las clavijas por r5, r6 y r7, y n por r4. Necesitamos intercambiar las clavijas (pegs) al llamar de forma recursiva, por lo que r5, r6 y r7 se modifican dentro de una llamada y no podemos permitir que la recursividad los modifique. De manera similar, decrementamos n (r4) en 1 dentro de la llamada, y no queremos que la recursividad altere n. Debido a esto, guardamos r4, r5, r6 y r7 en la pila al llamar a moveDisks (). Agregamos r8 porque también estamos ahorrando pc, y necesitamos un número par de registros para una buena alineación en la pila.




# Versión 1: Número fijo de discos

```asm
@   hanoi.s
@   D. Thiebaut
@   Recursive towers of Hanoi
@   See https://en.wikipedia.org/wiki/Tower_of_Hanoi Wikipedia for details.

@ ---------------------------------------
@	Data Section
@ ---------------------------------------
	
	.data
	.balign 4	
string: .asciz  "move disk from %c to %c\n\0"
peg1:	.int	'A'		@ name of Peg 1, must be a char
peg2:	.int	'B'
peg3:	.int	'C'
n:	.int	4		@ number of disks to move

	
@ ---------------------------------------
@	Code Section
@ ---------------------------------------
	
	.text
	.global main
	.extern printf

	
@ ---------------------------------------
@ moveDisks( n, Source, Dest, Extra )
@	    r4   r5     r6    r7
@    if n==1:
@	printf( "move disk from %c to %c\n", Source, Dest )
@    else:
@	moveDisks( n-1, Source, Extra, Desk )
@	printf( "move disk from %c to %c\n", Source, Dest )
@	moveDisks( n-1, Extra, Dest, Source )
@	
moveDisks:	
	push	{r4-r8, lr}

	@ if n==1:
	cmp	r4, #1
	bgt	moveN_1Disks

move1Disk:	
	@ print( "move disk from %c to %c\n", Source, Dest )
	ldr	r0, =string
	mov	r1, r5
	mov	r2, r6
	bl	printf
	b	endMoveDisk

moveN_1Disks:	
	@ moveDisks( n-1, Source, Extra, Dest )
	mov	r8, r7		@ swap Dest & Extra
	mov	r7, r6
	mov	r6, r8
	sub	r4, #1
	bl	moveDisks
	mov	r8, r7		@ unswap Dest & Extra
	mov	r7, r6
	mov	r6, r8

	@ print( "move disk from %c to %c\n", Source, Dest )
	ldr	r0, =string
	mov	r1, r5
	mov	r2, r6
	bl	printf

	@ moveDisks( n-1, Extra, Dest, Source )	
	mov	r8, r5		@ swap Source and Extra, i.e. r5 and r7.
	mov	r5, r7
	mov	r7, r8
	bl	moveDisks
	
endMoveDisk:	
	pop	{r4-r8, pc}

	
@ ---------------------------------------
@ main: call moveDisks( n, peg1, peg2, peg3 )

main:   push 	{ip, lr}	@ push return address + dummy register
				@ for alignment

	ldr	r4, =n		@ pass n
	ldr	r4, [r4]
	ldr	r5, =peg1	@ pass peg1
	ldr	r5, [r5]
	ldr	r6, =peg2	@ pass peg2
	ldr	r6, [r6]
	ldr	r7, =peg3	@ pass peg3
	ldr	r7, [r7]
	bl	moveDisks	@ call moveDisks( n, peg1, peg2, peg3 )

	
@ return to OS	
        pop 	{ip, pc}	@ pop return address into pc


```

```bash
pi@raspberrypi ~/temp $ make
as -o hanoi.o hanoi.s
gcc -o hanoi hanoi.o
pi@raspberrypi ~/temp $ ./hanoi 
move disk from A to C
move disk from A to B
move disk from C to B
move disk from A to C
move disk from B to A
move disk from B to C
move disk from A to C
move disk from A to B
move disk from C to B
move disk from C to A
move disk from B to A
move disk from C to B
move disk from A to C
move disk from A to B
move disk from C to B
pi@raspberrypi ~/temp $ 
```

---
# Versión 2: Solicitar al usuario el número de discos

```asm
@   hanoi2.s
@   D. Thiebaut
@   Recursive towers of Hanoi
@   Prompts the user for the number of disks to 
@   move.

@ ---------------------------------------
@	Data Section
@ ---------------------------------------
	
	.data
	.balign 4
prompt:	.asciz	"How many disk do you want to move? "
format:	.asciz	"%d"	
string: .asciz  "move disk from %c to %c\n\0"
peg1:	.int	'A'		@ name of Peg 1, must be a char
peg2:	.int	'B'
peg3:	.int	'C'
n:	.int	4		@ number of disks to move

	
@ ---------------------------------------
@	Code Section
@ ---------------------------------------
	
	.text
	.global main
	.extern printf
	.extern	scanf

@ ---------------------------------------
@ getNumberOfDisks():
@ prompts the user and puts the number
@ in n.
getNumberOfDisks:
	push 	{ip, lr}	@ push return address + dummy register
				@ for alignment

	ldr	r0, =prompt	@ print the prompt
	bl	printf

	ldr     r0, =format	@ call scanf, and pass address of format
	ldr	r1, =n		@ string and address of n in r0, and r1,
	bl	scanf		@ respectively.

        pop 	{ip, pc}
	
@ ---------------------------------------
@ moveDisks( n, Source, Dest, Extra )
@	    r4   r5     r6    r7
@    if n==1:
@	printf( "move disk from %c to %c\n", Source, Dest )
@    else:
@	moveDisks( n-1, Source, Extra, Desk )
@	printf( "move disk from %c to %c\n", Source, Dest )
@	moveDisks( n-1, Extra, Dest, Source )
@	
moveDisks:	
	push	{r4-r8, lr}

	@ if n==1:
	cmp	r4, #1
	bgt	moveN_1Disks

move1Disk:	
	@ print( "move disk from %c to %c\n", Source, Dest )
	ldr	r0, =string
	mov	r1, r5
	mov	r2, r6
	bl	printf
	b	endMoveDisk

moveN_1Disks:	
	@ moveDisks( n-1, Source, Extra, Dest )
	mov	r8, r7		@ swap Dest & Extra
	mov	r7, r6
	mov	r6, r8
	sub	r4, #1
	bl	moveDisks
	mov	r8, r7		@ unswap Dest & Extra
	mov	r7, r6
	mov	r6, r8

	@ print( "move disk from %c to %c\n", Source, Dest )
	ldr	r0, =string
	mov	r1, r5
	mov	r2, r6
	bl	printf

	@ moveDisks( n-1, Extra, Dest, Source )	
	mov	r8, r5		@ swap Source and Extra, i.e. r5 and r7.
	mov	r5, r7
	mov	r7, r8
	bl	moveDisks
	
endMoveDisk:	
	pop	{r4-r8, pc}

	
@ ---------------------------------------
@ main: call moveDisks( n, peg1, peg2, peg3 )

main:   push 	{ip, lr}	@ push return address + dummy register
				@ for alignment

	bl	getNumberOfDisks
				@ get n
	
	ldr	r4, =n		@ pass n
	ldr	r4, [r4]
	ldr	r5, =peg1	@ pass peg1
	ldr	r5, [r5]
	ldr	r6, =peg2	@ pass peg2
	ldr	r6, [r6]
	ldr	r7, =peg3	@ pass peg3
	ldr	r7, [r7]
	bl	moveDisks	@ call moveDisks( n, peg1, peg2, peg3 )

	
@ return to OS	
        pop 	{ip, pc}	@ pop return address into pc

```

```bash
pi@raspberrypi ~/temp $ ./hanoi2
How many disk do you want to move? 1
move disk from A to B
pi@raspberrypi ~/temp $ ./hanoi2
How many disk do you want to move? 2
move disk from A to C
move disk from A to B
move disk from C to B
pi@raspberrypi ~/temp $ ./hanoi2
How many disk do you want to move? 3
move disk from A to B
move disk from A to C
move disk from B to C
move disk from A to B
move disk from C to A
move disk from C to B
move disk from A to B
pi@raspberrypi ~/temp $ 
```

