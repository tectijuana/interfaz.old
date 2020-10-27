@ dummy.s
@ a template for asm programs
.section	.data
.section	.text
.globl		_start
_start:
nop		@ no operation
mov r7, $1	@ exit syscall
svc $0		@ wake kernel
.end
