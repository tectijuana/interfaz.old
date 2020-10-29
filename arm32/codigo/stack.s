// Basically Push() and Pop() as in stacks. Hmm, interesting stuff for me as a beginner.

.section __TEXT, __text
.global _main
.align 2

push {r7, lr}
mov r1, 0xB
pop{r7, pc}

