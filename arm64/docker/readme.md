# Alpine Linux en 64 bits
## Docker oficial de ARM64v8 Alpine

![](https://wiki.alpinelinux.org/images/alogo.png)

Alpine Linux es una distribución de Linux construida alrededor de musl libc y BusyBox. La imagen tiene sólo 5 MB de tamaño y tiene acceso a un repositorio de paquetes que es mucho más completo que otras imágenes basadas en BusyBox. Esto hace que Alpine Linux sea una gran base de imágenes para utilidades e incluso aplicaciones de producción. Lea más sobre Alpine Linux aquí y podrá ver cómo encaja su mantra en casa con las imágenes de Docker.

# Docker BUILD
Dockerfile
```
                                                                                                   
# 888888888888                888888888888  88  88                                                    
#     88                          88       ""  ""                                                    
#     88                          88                                                                 
#     88   ,adPPYba,   ,adPPYba,  88       88  88  88       88  ,adPPYYba,  8b,dPPYba,   ,adPPYYba,  
#     88  a8P_____88  a8"     ""  88       88  88  88       88  ""     `Y8  88P'   `"8a  ""     `Y8  
#     88  8PP"""""""  8b          88       88  88  88       88  ,adPPPPP88  88       88  ,adPPPPP88  
#     88  "8b,   ,aa  "8a,   ,aa  88       88  88  "8a,   ,a88  88,    ,88  88       88  88,    ,88  
#     88   `"Ybbd8"'   `"Ybbd8"'  88       88  88   `"YbbdP'Y8  `"8bbdP"Y8  88       88  `"8bbdP"Y8  
#                                             ,88                                                    
#                                           888P"                                                    
#
# Cada instrucción en este archivo genera una nueva capa que se envía a su caché de imágenes local
# Las líneas precedidas por # se consideran comentarios y se ignoran
# Localice una propuesta en HUB.DOCKER.COM para usar ARM64v8, adaptandolo ensamblador y el debugger.
#
# Por MC. René Solis R.  
# Twitter:  @IoTeacher

#
# $ docker container rm my_container — Borrar una o varios contenedores.
# $ docker container rm $(docker ps -a -q) — Borra TODO los contenedores que no estan corriendo en procesos.
# $ docker container kill $(docker ps -q)  — Parar todos los contenedores corriendo en memoria.

# PURGAR EL SISTEMAS OPERATIVO DE LA PC
# $ docker system prune — Borra todos los contenedores, redes sin usar y imagenes trabadas.
# Generar la imagen
#      $ docker build --tag arm32/lenginterfaz:compilador .   (si un PUNTO al final)
#      $ docker images

# Correr y borrar al SALIR
#      $  docker run  -it --rm --name compilador arm64v8/alpine:latest sh

#
# Deposito original (puede cambiar por otras versiones, por ejemplo ARM64) para ensamblador 64 bits
FROM arm64v8/alpine

#
# Actualizar la imagen con las herramientas para usar el ensamblador ARM32:
#
# build-base - Compiladores GCC soporte para sus trabajos con ensamblador
# git nano vim gdb - debuger y editores junto con github.com
# wget curl htop mc tree ssh scp - diversas herramientas para el desarrollador
#
apk add build-base git nano vim gdb wget curl mc tree openssh-client


#
# Puerto expuesto 80 (no hay servidores en nuestras practicas, por eso se deja por TEMPLETE) 
# EXPOSE 80

#
# La bienvenida a docker ARM mensaje
RUN sh -c "$(wget -O- https://raw.githubusercontent.com/tectijuana/interfaz/master/docker/dockerlogo.sh)"

#
# Instala ZSh interactiva a colores, ¡aguustoo! queda predeterminado al final.
# Uses "git", "ssh-agent" and "history-substring-search" bundled plugins
# https://github.com/deluan/zsh-in-docker
# RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.1/zsh-in-docker.sh)" -- \
#    -p git -p ssh-agent -p 'history-substring-search' \
#    -a 'bindkey "\$terminfo[kcuu1]" history-substring-search-up' \
#    -a 'bindkey "\$terminfo[kcud1]" history-substring-search-down'
# Default powerline10k theme, no plugins installed
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.1/zsh-in-docker.sh)"

#
# TIPS PARA LAS IMAGENES
# https://hub.docker.com/r/arm64v8/alpine
# https://pythonspeed.com/docker/
# https://towardsdatascience.com/15-docker-commands-you-should-know-970ea5203421
```

-----

# Bash Script para compilar (sin CMAKE)
# compilar.sh 
```bash
!/bin/bash
echo "Assembling with GCC"
gcc  -o $1.o $1.s
echo "Linking ... "
gcc -o $1 $1.o
echo "Done !"
```
_Marcarlos con propiedad de ejecutable_
```bash
$ chmod +x compilar.sh
```
----
# Hola mundo en 64bits
## hola64.s
```asm
.data

/* Data segment: define our message string and calculate its length. */
msg:
    .ascii        "Hello, ARM64!\n"
len = . - msg

.text

/* Our application's entry point. */
.globl _start
_start:
    /* syscall write(int fd, const void *buf, size_t count) */
    mov     x0, #1      /* fd := STDOUT_FILENO */
    ldr     x1, =msg    /* buf := msg */
    ldr     x2, =len    /* count := len */
    mov     w8, #64     /* write is syscall #64 */
    svc     #0          /* invoke syscall */

    /* syscall exit(int status) */
    mov     x0, #0      /* status := 0 */
    mov     w8, #93     /* exit is syscall #1 */
    svc     #0          /* invoke syscall */
```
----





