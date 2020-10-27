



Programa prueba.s
```asm
.global _start              @ Proporcionar la dirección de inicio del programa al enlazador (linker)
_start: mov     R0, #17     @ Utilice 17 (decimal) como ejemplo de prueba
        lsl     R0, #2      @ Desplazar R0 a la izquierda en 2 bits (es decir, multiplicar por 4)
        mov     R7, #1      @ El código de comando de servicio 1 finaliza este programa,
        svc     0           @ para regresar al Sistemas Operativo
```


Archivo MAKE agilizar la compilación (https://www.gnu.org/software/make/)

**make**
```make
prueba: prueba.o
     ld -o prueba prueba.o

prueba.o: model.s
     as -g -o prueba.o prueba.s

clean:
     rm prueba prueba.o
```

