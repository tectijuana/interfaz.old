# Instalar gcc multilib de ser necesario
Si al compilar codigo c a assembly con el comando siguiente y al tratar de correr el archivo .s marca error:
```bash
$ gcc -Os -S -o evodd.s evodd.c
$ as -o evodd.o evodd.s
$ ld -o evodd  evodd.o
$ ./evodd
```

Instalar gcc multilib para poder compilar correctamente a 32-bit:
```bash
sudo apt-get install gcc-multilib g++-multilib
```

# Ejemplo codigo C y Assembly

![](images/c.png) 

```c
#include <stdio.h>

int main(){
    for (int i = 0; i < 10; i++){
        if(i&1)
	   printf("%d es impar\n", i);
        else
	   printf("%d es par\n", i);
    }
    return 0;
}
```

```bash
#Convertir a assembly
pi@raspberrypi:~/arm32 $ g++ -S evodd.c
```

![](images/asm.png)

```assembly
	.arch armv6
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"evodd.c"
	.text
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%d es impar\012\000"
	.align	2
.LC1:
	.ascii	"%d es par\012\000"
	.text
	.align	2
	.global	main
	.arch armv6
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	.fnstart
.LFB0:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #8
	sub	sp, sp, #8
	mov	r3, #0
	str	r3, [fp, #-8]
.L5:
	ldr	r3, [fp, #-8]
	cmp	r3, #9
	bgt	.L2
	ldr	r3, [fp, #-8]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L3
	ldr	r1, [fp, #-8]
	ldr	r0, .L7
	bl	printf
	b	.L4
.L3:
	ldr	r1, [fp, #-8]
	ldr	r0, .L7+4
	bl	printf
.L4:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	b	.L5
.L2:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L8:
	.align	2
.L7:
	.word	.LC0
	.word	.LC1
	.fnend
	.size	main, .-main
	.ident	"GCC: (Raspbian 8.3.0-6+rpi1) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
```

# Output
```bash
#construir binarios 32-bit
pi@raspberrypi:~/arm32 $ gcc -g evodd.s -o evodd -mbe32
pi@raspberrypi:~/arm32 $ ./evodd
0 es par
1 es impar
2 es par
3 es impar
4 es par
5 es impar
6 es par
7 es impar
8 es par
9 es impar
```


POR: OSCAR IVAN DOMINGUEZ ORTIZ
