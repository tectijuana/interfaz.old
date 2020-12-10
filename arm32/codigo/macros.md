# Usando macros

A veces, necesitará repetir algo varias veces en su código. Si se trata de un fragmento de código relativamente pequeño, es posible que se muestre reacio a convertirlo en una función, ya que los comandos de bifurcación y retorno pueden ser casi tan costosos como el código que desea ejecutar. Este es un buen momento para usar una macro.

Una macro es una directiva de ensamblador. Declaras una macro al inicio del programa. El ensamblador luego busca en su código ocurrencias del nombre de la macro y las reemplaza con el cuerpo de la macro. Puede usar parámetros en una macro, por lo que son bastante flexibles.

Aquí tienes un ejemplo. Uno de mis primeros programas fue calcular el mcd. Se reduce a estas líneas:

```asm
gcd:
    cmp	r0, r1
    subgt r0, r0, r1
    sublt r1, r1, r0    
    bne gcd
```

Aquí hay una versión de mi programa gcd en el que he convertido gcd en una macro.

```asm
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
```

---


Como puede ver, declara una macro con una línea que comienza con ".macro". A continuación, se encuentra el nombre de la macro y los parámetros utilizados. Los nombres de los parámetros deben tener el prefijo "\" en el cuerpo de la macro. Al final de la definición macro, necesitamos ".endm".

Este ejemplo en particular funciona bien y utilizará los registros que se le pasen para calcular el mcd. No utiliza ningún otro registro, por lo que no hay necesidad de preocuparse de que otros datos se "golpeen".

Por supuesto, puede escribir macros que utilicen registros con nombre. Aquí hay un programa corto que usa una macro para imprimir caracteres.

```asm
@ macros.s
@ experimenting with a couple of macros

.section    .data
nl:
    .byte 0xA   @ ascii codes
spc:
    .byte 0x20
char:
    .byte 0x41

.macro print_ch a
mov r0, $1
ldr r1, =\a
mov r2, $1
mov r7, $4
svc $0
.endm

.section  .text
.globl  _start
_start:

ldr r3, =char
ldrb r4, [r3]

print_ch nl
loop:
    print_ch char
    print_ch spc
    cmp r4, $0x5a
    addle r4, r4, $1
    strltb r4, [r3]
    blt loop

print_ch nl
mov r7, $1
svc $0

.end
```

Si ejecuta este programa, debería imprimir las letras mayúsculas de la A a la Z. La macro usa la impresión, por lo que va a golpear los registros r0, r1, r2 y r7. Puede ser más prudente usar una función, pero hay ocasiones en las que lo rápido y sucio es el camino a seguir y las macros son muy útiles.

Aquí hay un ejemplo más. Aquí tengo un pequeño procedimiento de módulo empaquetado como una macro.

```asm
@ simple program setting up a modulus macro

.section    .data
x:
    .long   2013
y:
    .long   19

.macro mod a, b
mod_\@:   cmp \a, \b
            subge \a, \a, \b
            bge mod_\@
.endm

.globl _start

_start:
    ldr r2, =x
    ldr r0, [r2]
    ldr r2, =y
    ldr r1, [r2]
    mod r0, r1

    mov r7, $1
    swi 0
.end 
```

Como puede ver, esta es otra macro "segura", como el ejemplo de gcd. Calcula el módulo de dos números utilizando solo los registros que se le pasaron. 


# NOTA: Debe de compilarse con "ld"
