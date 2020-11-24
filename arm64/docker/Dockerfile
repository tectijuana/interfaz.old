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
# Generar la imagen y visualizar los recursos de su PC
#      $ docker build --tag arm32/lenginterfaz:compilador .   (si un PUNTO al final)
#      $ docker images

# Correr y borrar al SALIR
#      $  docker run  -it --rm --name compilador arm64v8/alpine:latest sh

#
# PURGAR EL SISTEMAS OPERATIVO DE LA PC
#
# $ docker container rm my_container — Borrar una o varios contenedores.
# $ docker container rm $(docker ps -a -q) — Borra TODO los contenedores que no estan corriendo en procesos.
# $ docker container kill $(docker ps -q)  — Parar todos los contenedores corriendo en memoria.
# $ docker system prune — Borra todos los contenedores, redes sin usar y imagenes trabadas.

# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#
# Deposito original para ensamblador 64 bits OFICIAL, basada en ALPINE Linux (ligero)
FROM arm64v8/alpine

#
# Actualizar la imagen con las herramientas para usar el ensamblador ARM64:
#
# build-base - Compiladores GCC soporte para sus trabajos con ensamblador
# git nano vim gdb - debuger y editores junto con github.com
# wget curl htop mc tree ssh scp - diversas herramientas para el desarrollador
#
apk update && apk upgrade
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
