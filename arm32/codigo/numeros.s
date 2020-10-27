@ num_in.s
@ get user input ready to do maths

@ registers
@ r1 - pointer to the buffer
@ r2 - used to load digits
@ r3 - counts digits
@ r4 - multiplier
@ r6 - counter
@ r0 - return value

.section	.bss
.comm buffer, 48	@ reserve 48 byte buffer

.section	.data
msg:
	.ascii	"Enter a number: "
msgLen = . - msg

.section	.text
.globl	_start
_start:

mov r0, $1		@ print program's opening message	
ldr r1, =msg
ldr r2, =msgLen
mov r7, $4
svc $0

                        @ get input 
mov r7, $3		@ 3 is the "read" syscall
mov r0, $1		
ldr r1, =buffer
mov r2, $0x30
svc $0

                        @ prepare to convert ascii to number 
ldrb r2, [r1]		@ load first char 
mov r3, $0		@ initialize r3 as a counter

pushDigits:
stmfd	sp!, {r2}	@ push digit onto stack
add	r3, r3, $1	@ increment counter
ldrb	r2, [r1, #1]!	@ load next digit (use writeback)
cmp	r2, $0xA	@ check for ascii code 10
beq 	convDigits      @ jump to conversion section
bne 	pushDigits      @ or carry on pushing

convDigits:
mov r4, $1		@ initialize multiplier to 1
mov r0, $0 		@ initialize number
mov r6, $0		@ initialize counter

jumpBack:
ldmfd	sp!, {r2}	@ pop a digit
cmp 	r2, $0x30	@ is it a digit?
blt	error
cmp	r2, $0x39       @ sure?
bgt	error
sub	r2, r2, $0x30	@ take away 48, to get the digit value
mul	r2, r4, r2	@ multiply it by r4
add	r0, r0, r2	@ add to r0
add	r6, r6, $1	@ increment counter		
cmp	r6, r3		@ check to see if done
beq 	exit
mov     r5, r4, lsl $3        @ do multiply by ten using adds and shifts
add     r4, r5, r4, lsl $1    @ x * 8 + x * 2 = x * 10
bal	jumpBack

@ Least significant byte available via "echo $?"

error:
mov r0, $-1
bal exit

exit:
mov r7, $1	@ exit syscall
svc $0		@ wake kernel
.end
