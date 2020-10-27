@ primos.s 
@ find and print first 500 primes
@ This program finds and prints the first 500 prime numbers. It is based on the program presented in Knuth’s classic The Art of Computer Programming.
@ The code itself is pretty heavily commented, so I don’t think much further explanation is needed.
@ I have used the number printing routine described in my earlier blog post to handle the output in this example.
@ based on Knuth TAOCP vol. 1 147ff
@ I've used the labels and variables Knuth uses, up to a point.

@@@@@@@@@@@@@
@ registers @
@@@@@@@@@@@@@

@ r1 points to address of "prime"
@ r3 number we are checking 	(N in Knuth)
@ r4 count of primes		(J in Knuth)
@ r5 divisors we are checking	
@ r6 index for the prime divisors
@ r7 will hold remainder	(R in Knuth)
@ r8 will hold quotient		(Q in Knuth)
@ r9 number of primes sought.

.section	.bss
.comm prime, 2000	@ reserve space for the primes

.section	.data
spc:			@ space the primes with 3 spaces
	.ascii "  "
len = . - spc
nl: 			@ just a newline
	.ascii "\n"
limit:			@ index of last prime we need
	.long 500 

.section .text
.globl	_start
_start:

P1:			@ setting up
ldr r1, =prime		@ r1 points to "prime"
mov r0, $2		@ First prime is 2
str r0, [r1]		@ Store this number in "prime"
ldr r0, =limit
ldr r9, [r0]		@ r2 holds number of primes to find
mov r3, $3		@ initialize N to 3
mov r4, $1		@ initialize J to 1

P2:			@ we come here when we have found a prime
add r4, r4, $1		@ increment J
str r3, [r1, #4]!	@ store N in "prime" (with writeback)

P3:
cmp r4, r9		@ check if we are done
bge P9			@ if so branch to p9

P4:
add r3, r3, $2		@ add 2 to N 

P5:			@ start checking divisors
ldr r6, =prime		@ copy pointer to start of "prime"
ldr r5, [r6]		@ load first divisor
mov r7, r3		@ copy N into R
mov r8, $0		@ initialize Q

P6:
cmp r7, r5		@ if R >= divisor
subge r7, r7, r5 	@ subtract divisor from R
addge r8, r8, $1	@ increment Q
bge P6			@ repeat
cmp r7, $0		@ if R == 0 ...
beq P4			@ N is not prime so try next N

P7:
cmp r8, r5		@ compare Q with divisor
ble P2			@ if Q <= divisor, N is prime

P8:
mov r7, r3		@ reset r7 to N
mov r8, $0		@ reset Q
ldr r5, [r6, #4]!	@ get next divisor
bal P6			@ divide again

P9:
mov r0, $1		@ choose stdout
mov r4, $0		@ use r4 as a temporary counter
mov r5, $0		@ r5 counts total primes printed
ldr r6, =prime		@ pointer to "prime"
ldr r3, [r6]		@ load first prime

printLoop:
bl print_num		@ function call
add r4, $1		@ add one to temp counter
add r5, $1		@ add one to counter
cmp r5, r9 		@ are we done?
bge exit		@ if so, exit
cmp r4, $9		@ after 10 primes ...
bgt newline		@ print a newline
ble space		@ add spaces

space:                  @ we jump here if
mov r0, $1              @ we are going to 
ldr r1, =spc		@ print spaces
ldr r2, =len	
mov r7, $4
svc $0
ldr r3, [r6, #4]!	@ load next prime
bal printLoop           @ continue printing

newline:                @ we jump here if
mov r0, $1              @ we are going to
ldr r1, =nl             @ print a newline
mov r2, $1
mov r7, $4
svc $0
ldr r3, [r6, #4]!       @ load next prime
mov r4, $0              @ reset temporary counter
bal printLoop		@ continue printing

@@@@@@@@@@@@@@@@@@@@@@
@ print_num function @
@@@@@@@@@@@@@@@@@@@@@@

print_num:
	stmfd sp!, {r0-r9, lr}	@ push regs to stack
	mov r4, $0 		@ set division counter to zero
	mov r5, $1		@ set char counter to one

loop:				@ division routine
	cmp r3, $9		
	ble stackPush		@ if r3 <= 9, call stackPush
	sub r3, r3, $10		@ else, subtract 10 from r3
	add r4, r4, $1		@ add one to div. counter
	bal loop		@ repeat

stackPush:
	add r5, r5, $1		@ increment char counter
	orr r0, r3, $0x30	@ logical OR - add 48 to digit to get ascii code
	stmfd	sp!, {r0}	@ push onto stack
	cmp r4, $0		@ if the div. counter is zero ...
	beq printChars		@ call print function
	mov r3, r4		@ else, load div. count into r3
	mov r4, $0		@ reset div. counter
	bal loop		@ back to top of loop

printChars:
	mov r1, sp		@ use stack pointer to provide ascii code
	mov r0, $1		@ stdout is file descriptor 1
	mov r2, $1		@ length to print is 1
	mov r7, $4		@ write syscall
	svc $0			@ wake kernel
	subs r5, r5, $1		@ decrement string counter and set flag
	ble return		@ return if done
	ldmfd sp!, {r0}		@ pull next char from from stack 
	bal printChars		@ get next char
return:
	ldmfd sp!, {r0-r9, pc}	@ restore registers

exit:
mov r0, $1			@ print a newline
ldr r1, =nl
mov r2, $1
mov r7, $4
svc $0
mov r7, $1			@ exit
svc $0

.end
