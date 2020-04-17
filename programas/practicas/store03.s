/* -- store02.s */
.data
myvar1:  .word 0
myvar2:  .word 0
.text
.global main
main:
 ldr r1, =myvar1  @ r1 <- &myvar1
 mov r3, #3       @ r3 <- 3
  str r3, [r1]     @ *r1 <- r3
  ldr r2, =myvar2  @ r2 <- &myvar2
  mov r3, #4       @ r3 <- 4
  str r3, [r2]     @ *r2 <- r3
  ldr r1, =myvar1  @ r1 <- &myvar1
  ldr r1, [r1]     @ r1 <- *r1
  ldr r2, =myvar2  @ r2 <- &myvar2
  ldr r2, [r2]     @ r2 <- *r2
  add r0, r1, r2
  bx  lr
