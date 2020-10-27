# Cuándo evitar la "mul".

En mi lectura sobre el ensamblador ARM, encontré el siguiente consejo: si está multiplicando por una constante, use cambios y sumas, el multiplicador es lento.

Solo para demostrar el punto, gcc no usa "mul" para multiplicar por una constante. Aquí tienes un programa C simple:

```clang
int c = 5;
main()
{
   c = c * 10;
}
```

Compilé esto con la siguiente instrucción:

```bash
gcc -S times.c -O3
```

Y aquí está la parte relevante del código ensamblador que se produjo:

```asm
ldr r3, .L2
ldr r2, [r3, #0]
add r2, r2, r2, asl #2
mov r2, r2, asl #1
str r2, [r3, #0]
```

Repasemos esto paso a paso. Cada desplazamiento a la izquierda equivale a multiplicar por 2.

```
1. cargue r2 con un valor inicial de c.
    r2 = 5
2. Sume r2 al desplazamiento aritmético a la izquierda (2 lugares) de r2.
    r2 = 5 + 5 * 4 = 25
3. Reemplace r2 con el desplazamiento aritmético a la izquierda (1 lugar) de r2
    r2 = r2 * 2 = 50
```

Entonces, es oficial. Si desea que su código ensamblador sea al menos tan bueno como el producido por gcc, debe evitar usar la instrucción “mul” para la multiplicación por constantes.

Por cierto, a menudo hay varias formas de lograr una multiplicación por una serie de cambios y sumas. Esta es mi forma preferida de multiplicar por 10. En este ejemplo, r4 contiene el número a multiplicar y quiero que el resultado esté en r5.

```asm
mov r5, r4, lsl $3            @ r5 now holds r4 * 8
add r5, r5, r4, lsl $1        @ add r4 * 2 to r5
```
