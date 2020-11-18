# Compilar y ejecutar primer programa ASM ARM 32bits
## Procedimiento generico varia.
- Accedervia **ssh** al Pi usando la ventana de terminal. 
- Usa tu editor favorito en Pi (el mío es nano), crea un archivo llamado first.s e ingresa este código. Si está interesado en omitir el editor, simplemente escriba esto:
```bash
cat > primero.s
```

y pega el código de siguiente. Luego presione **ENTER, Control-D, ENTER,** y esto debería crear el archivo por usted.


```asm
@ primero.s
@   from thinkingeek.com
@   http://thinkingeek.com/2013/01/09/arm-assembler-raspberry-pi-chapter-1/
@   Defines a main function that returns 2 as an exit code.
@	

	
	.global main
	
main:   mov r0, #2       @ load immediate value 2 into Register r0 
	bx lr            @ return 2 to Operating Sytem
  
```

Para verificar que se crea el archivo, escriba esto:

```bash
   cat primero.s
```

y debería ver el contenido del archivo.


# ¡Ensamble, compile y ejecute!

. Ensamble el código para crear un archivo de objeto:
```bash
as -o primero.o primero.s
```

- Esto creará el archivo de objeto primero, Compílelo. 
- El archivo de objeto no es ejecutable. 
- Sin embargo, un compilador de C puede leerlo y transformarlo en un ejecutable.

```bash
  gcc -o primero primero.o
```

Esto toma el archivo de objeto first.o y genera el archivo ejecutable primero.
¡Ejecutarlo!

```bash
  ./primero | echo $?
    2 
```
 
NOTA: **echo $?** nos muestra el salida final del kernel (stack) al terminar el programa pues no imprime en pantalla
y **|** se llama PIPA, es para unir 2 o mas comandos seguidos de esta (ejemplo $sudo apt upgrade | sudo apt upgrade)


### Bibliografia: http://www.science.smith.edu/dftwiki/index.php/Tutorial:_Assembly_Language_with_the_Raspberry_Pi
