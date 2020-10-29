@ blink.s
@ D. Thiebaut
@ based on the following C program:
@	
@ #include <wiringPi.h>
@ #include <stdio.h>
@ #include <stdlib.h>
@ 
@ int main (void) {
@   int pin = 7;
@   printf("Raspberry Pi wiringPi blink test\n");
@ 
@   if (wiringPiSetup() == -1) {
@     printf( "Setup didn't work... Aborting." );
@     exit (1);
@   }
@   
@   pinMode(pin, OUTPUT);
@   int i;
@   for ( i=0; i<10; i++ ) {
@     digitalWrite(pin, 1);
@     delay(250);
@ 
@     digitalWrite(pin, 0);
@     delay(250);
@   }
@ 
@   return 0;
@ }
@	
@ To assemble, link, and run:
@
@  as -o blink.o blink.s 
@  gcc -o blink2 blink.o -lwiringPi 
@  sudo ./blink2 

@ ---------------------------------------
@	Data Section
@ ---------------------------------------
	
	 .data
	 .balign 4	
Intro: 	 .asciz  "Raspberry Pi wiringPi blink test\n"
ErrMsg:	 .asciz	"Setup didn't work... Aborting...\n"
pin:	 .int	7
i:	 .int	0
delayMs: .int	250
OUTPUT	 =	1
	
@ ---------------------------------------
@	Code Section
@ ---------------------------------------
	
	.text
	.global main
	.extern printf
	.extern wiringPiSetup
	.extern delay
	.extern digitalWrite
	.extern pinMode
	
main:   push 	{ip, lr}	@ push return address + dummy register
				@ for alignment

@  printf( "blink..." )	;
	ldr	r0, =Intro	
        bl 	printf		

@  if (wiringPiSetup() == -1) {
@     printf( "Setup didn't work... Aborting." ) ;
@     exit (1)					 ;
@  }
	bl	wiringPiSetup
	mov	r1,#-1
	cmp	r0, r1
	bne	init
	ldr	r0, =ErrMsg
	bl	printf
	b	done

@  pinMode(pin, OUTPUT)		;
init:
	ldr	r0, =pin
	ldr	r0, [r0]
	mov	r1, #OUTPUT
	bl	pinMode

@   for ( i=0; i<10; i++ ) {
	ldr	r4, =i
	ldr	r4, [r4]
	mov	r5, #10
forLoop:
	cmp	r4, r5
	bgt	done
	
@	digitalWrite(pin, 1) ;
	ldr	r0, =pin
	ldr	r0, [r0]
	mov	r1, #1
	bl 	digitalWrite
	
@       delay(250)		 ;
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

@       digitalWrite(pin, 0) 	;
	ldr	r0, =pin
	ldr	r0, [r0]
	mov	r1, #0
	bl 	digitalWrite

@       delay(250)		 ;
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

	add	r4, #1
	b	forLoop
	
done:	
        pop 	{ip, pc}	@ pop return address into pc
