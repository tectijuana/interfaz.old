#                                                                                                   
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

# Cada instrucción en este archivo genera una nueva capa que se envía a su caché de imágenes local
#
# Las líneas precedidas por # se consideran comentarios y se ignoran
#
# Localice una propuesta en HUB.DOCKER.COM para usar ARM32, adaptandolo Ensamblador y el debugger.
#
#
# Por MC. René Solis R.  
# Twitter:  @IoTeacher

#
# Generar la imagen
# $ docker build --tag arm32/lenginterfaz:compilador .   (si un PUNTO al final)
# $ docker images
#
# DOS FORMAS DE CORRER (la 2dqa es la recomendable mas compacta): 
# 
# a) Correr y RESIDENTE (ideal para SERVIDORES para nosotros en compilación no aplica, se documenta)
#     $  docker run -d -ti --name assembler arm32/lenginterfaz:compilador zsh
#                         para sair usar "exit" en terminal.
#     $  docker attach assembler zsh
#     $  docker ps -a
#                       Muestra la lista de procesos en memoria
#     $  docker rm assembler
#                       Para apagar y liberarlo "rm es REMOVER".
#
# b) Correr y borrar al SALIR
#     $  docker run --rm -ti --name assembler  arm32/lenginterfaz:compilador zsh
#                         para sair usar "exit" en terminal, se libera de memoria, "--rm es REMOVER".
#
#     (recordar que se destruye todo lo que esta dentro de esta, por ello debe de subir a GitHub.com con --
# las herramientas de $ git clone, git add, git commit y git push)

#
# TIPS PARA LAS IMAGENES
#
# $ docker container rm my_container — Borrar una o varios contenedores.
# $ docker container rm $(docker ps -a -q) — Borra TODO los contenedores que no estan corriendo en procesos.
# $ docker container kill $(docker ps -q)  — Parar todos los contenedores corriendo en memoria.

# PURGAR EL SISTEMAS OPERATIVO DE LA PC
# $ docker system prune — Borra todos los contenedores, redes sin usar y imagenes trabadas.


# Deposito original (puede cambiar por otras versiones, por ejemplo ARM64) para ensamblador 64 bits
FROM navikey/raspbian-buster

# Identificar al mantenedor de una imagen
LABEL maintainer="rene.solis@tectijuana.edu.mx"

#
# Actualizar la imagen con las herramientas para usar el ensamblador ARM32:
#
# build-essential - Compiladores soporte para sus trabajos con Ensamblador
# git nano vim gdb - debuger y editores junto con github.com
# wget curl htop mc tree ssh scp - diversas herramientas para el desarrollador
#
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y build-essential git nano vim gdb wget curl mc tree

RUN apt-get -y install cmake protobuf-compiler

RUN apt-get -y  install openssh-client

#
# Para mensajeria
# CMD ["/usr/games/cowsay", "Dockerfiles are cool!"]

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
# Puerto expuesto 80 (no hay servidores en nuestras practicas, por eso se deja por TEMPLETE) 
# EXPOSE 80

#
# La bienvenida a docker ARM mensaje
RUN sh -c "$(wget -O- https://raw.githubusercontent.com/tectijuana/interfaz/master/docker/dockerlogo.sh)"

#
# REFERENCIAS
# https://towardsdatascience.com/15-docker-commands-you-should-know-970ea5203421
