### Ejemplo 1:
Para el siguiente ejemplo utilizaremos la condicional **EQ**:

Primero vamos a crear un archivo .s: `nano comp.s`

Dentro de el se escribe el siguiente código:
``` asm
.text
.global main
main:
  mov r1, #5 /*r1=5*/
  mov r2, #5 /*r2=5*/
  cmp r1, r2 /*Compara r1 y r2*/
  beq igual /*Lo ejecuta sólo si Z=1*/
diferente:
  mov r0, #0  /*Si son diferentes mostrará 0*/
  b end
  
igual:  /*if*/
  mov r0, =1
end:
bx lr
```

Se ejecuta:

`as -o comp.o comp.s`

`gcc -o comp comp.o`

`./comp` o también: `./comp | echo $?`

![](imagen/nanocomp1.PNG)
