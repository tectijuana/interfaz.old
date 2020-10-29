@ sum4.s
@   D. Thiebaut
@   Illustrates how to pass 2 ints by reference
@   to a function that adds them up and returns	
@   the sum in r0.

@ ---------------------------------------
@	Data Section
@ ---------------------------------------
	
	.data
	.balign 4	
string: .asciz "\n%d + %d = %d\n"
a:	.word	33
b:	.word	44
c:	.word 	0		@ will contain a+b 
d:	.word	55
e:	.word	22
	
@ ---------------------------------------
@	Code Section
@ ---------------------------------------
	
.text
.global main
.extern printf

	
@ ---------------------------------------
@ sumFunc: gets 2 ints in r1 and r2, adds
@ 	them up and saves the results in
@	r0.	
sumFunc:
	push	{ip, lr}
	ldr	r1, [r1]
	ldr	r2, [r2]
	add	r0, r1, r2
	pop	{ip, pc}

@ ---------------------------------------
@ printFunc: prints [r1], [r2], r3 in this way.
@ printf( "%d + %d = %d\n", r1, r2, r3 )
@ (format-string address passed in r0)
printFunc:
	push	{ip, lr}
        ldr 	r0, =string 	@ get address of string into r0
	ldr	r1, [r1]
	ldr	r2, [r2]
	mov	r3, r3		@ not necessary...
        bl 	printf		@ print string and pass params
				@ into r1, r2, and r3

	pop	{ip, pc}
	
@ ---------------------------------------
@ main: passes 2 ints to sumFunc and prints
@ the resulting value using printf	
main:   push 	{ip, lr}	@ push return address + dummy register
				@ for alignment

@ c = a + b
	ldr	r1, =a		@ get address of a into r1
	ldr	r2, =b		@ get address of b into r2

	bl	sumFunc		@ pass (r1, r2) to sumFunc
				@ gets sum back in r0
	ldr	r3, =c		@ get address of c into r2
	str	r0, [r3]	@ store r0 into c

@ print a + b = c
	ldr	r1, =a
	ldr	r2, =b
	ldr	r3, =c
	ldr	r3, [r3]
	bl	printFunc

	
@ return to OS	
        pop 	{ip, pc}	@ pop return address into pc
