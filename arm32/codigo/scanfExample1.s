@ scanfExample1.s
@ D. Thiebaut
@ A simple example illustrating how one
@ can call the C function scanf() from
@ assembly.
@ The C example for this code would be:
@
@	int num = 0;
@	printf( "> " );
@	scanf( "%d", &num );
@	print( "your input: %d\n", num ) ;
@

@ ---------------------------------------
@	Data Section
@ ---------------------------------------
	
	.data
	.balign 4	
prompt:	.asciz	"> "
format: .asciz 	"%d"
num:	.int	0
output: .asciz 	"your input: %d\n"
	
@ ---------------------------------------
@	Code Section
@ ---------------------------------------
	
	.text
	.global main
	.extern printf
	.extern scanf

main:   push 	{ip, lr}	@ push return address + dummy register
				@ for alignment

	ldr	r0, =prompt	@ print the prompt
	bl	printf

	ldr     r0, =format	@ call scanf, and pass address of format
	ldr	r1, =num	@ string and address of num in r0, and r1,
	bl	scanf		@ respectively.

	ldr	r1, =num	@ print num formatted by output string.
	ldr	r1, [r1]
	ldr	r0, =output
	bl	printf


        pop 	{ip, pc}	@ pop return address into pc
