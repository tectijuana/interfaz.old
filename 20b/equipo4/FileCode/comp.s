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