👩‍💻
# PRACTICA CON DOCKER EN ARM32 Y GITHUB REPORTANDO LOS AVANCES O TERMINACIÓN DE LA PRACTICA.
# Objetivo: Numeros.s

Cuando buscamos imprimir números en un programa reciente, tuvimos que hacer una conversión entre un número binario almacenado en la computadora y una serie de caracteres ascii que podrían representar un número denario.

Se enfrenta el mismo problema cuando queremos obtener un número del usuario y hacer algo con él en un programa ASM. Lo que sigue es una solución simple a este problema. Se toma una cadena de caracteres del teclado y se convierten en un número que se almacena en r0.

Se tienen algunas funciones básicas que pueda usar para crear programas que puedan realizar operaciones matemáticas, así como manejar Entradas/Salidas.


# ⌨️ GIT REPO INICIO ⌨️
## NOTA: De usar el nevagador WEB, debe usar $ git pull para actualizar el DOCKER y sincronizarlo.
```bash
cd
git clone https://github.com/tectijuana/li20b3ej-2-Armenta99 (CAMBIAR A SU REPOSITORIO DE ESTUDIANTE)
cd li20b3ej-2-Armenta99                                      (CAMBIAR A SU REPOSITORIO DE ESTUDIANTE)
wget https://github.com/tectijuana/interfaz/raw/master/arm32/codigo/numeros.s

git config --global user.email "SUCORREO@tectijuana.edu.mx"
git config --global user.name "Profe pongame 0 en esta practica por no cambiar el nombre ni correo, por favor"

nano Makefile
```

# ⌨️ Makefile (Obligatorio usat tecla TAB para identar no espacios, pues le marca error, asi funciona el CMAKE) ⌨️
```make
#Makefile
all: numeros
numeros: numeros.o
  ld -o $@ $+
numeros.o: numeros.s
  as -g -mfpu=vfpv2 -o  $@ $+
clean:
  rm -vf numeros *.o
```
----

# ⌨️ FLUJO DE LA PRACTICA: Editar, compilar com MAKE, usar GDB, etc. ⌨️
## Aqui es el trabajo de dia a dia.
```bash
make
./numeros 
echo $?
echo   (hora de purgar para subir el codigo a su GitHub)
make clean
```
----
# ⌨️ GIT REPO SUBIR TRABAJO AVANCES o TERMINADO ⌨️
## NOTA: Se asume que no hay edición en navegador de internet, de lo contrario usar $ git pull (para sincronizar)

```bash
git add .      (Si un punto al final, es *.*  es todo lo que esta en ese directorio)
git status
git commit -m "/////PONER MENSAJE DE APORTACION////"
```
## 🖥️ respuesta de la consola 🖥️

```
[main 9ec1dc1] 
 2 files changed, 87 insertions(+)
 create mode 100644 code2/Makefile
 create mode 100644 code2/numeros.s
```


```bash
git push
```

## 🖥️ respuesta de la consola..🖥️
```
Username for 'https://github.com': XXXXXX@tectijuana.edu.mx
Password for 'https://XXXXXXXX@tectijuana.edu.mx@github.com': 
Enumerating objects: 6, done.
Counting objects: 100% (6/6), done.
Delta compression using up to 4 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 1.24 KiB | 74.00 KiB/s, done.
Total 5 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To https://github.com/tectijuana/li20b3ej-2-Armenta99
   d0c468d..9ec1dc1  main -> main
```

🌎 Y listo puede ver el contenido en GitHUB.com 🌎

SUERTE !!

