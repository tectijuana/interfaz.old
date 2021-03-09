@ macgcd.s

.section    .data
m:
    .long 6099
n:
    .long 2166

.macro gcd a, b
@ the '\@' in the next line causes the assembler to generate a local label.
gcd_\@:                    
    cmp	\a, \b
    subgt \a, \a, \b	
    sublt \b, \b, \a    
    bne gcd_\@ 
.endm

.globl  _start
_start:
    adr r1, m
    ldr r0, [r1]	@ load first number into r0.
    adr r2, n
    ldr r1, [r2]	@ load second number into r1.
    gcd r0, r1          @ use macro

    mov     r7, $1	@ prepare to exit
    swi     $0		@ wake kernel
  
.end
