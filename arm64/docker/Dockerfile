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

#
# Generar la imagen y visualizar los recursos de su PC
#      docker build --tag arm64/lenginterfaz:compilador .   (si un PUNTO al final)
#      docker images

# Correr y borrar al SALIR
#      docker run  -it --rm --name ensamblador arm32/lenginterfaz:compilador fish

#
# Borrado de imagenes
#      docker  rm Mi_Contenedor        — Borrar una o varios contenedores.
#      docker  rm $(docker ps -a -q)   — Borra TODO los contenedores que no estan corriendo en procesos.
#      docker  kill $(docker ps -q)    — Parar todos los contenedores corriendo en memoria.
#      docker system prune             — Borra todos los contenedores, redes sin usar y imagenes trabadas.
#      docker system prune -a          - ELIMINACION A RESET TOTAL DESDE CER Y RECLAMO DE SU ESPACIO EN DISCO DURO.

#---------------------------------------------------------------------
# Imagen Oficial
#---------------------------------------------------------------------
#
# Deposito original para ensamblador 64 bits OFICIAL, basada en ALPINE Linux (ligero)
FROM arm64v8/alpine
#
MAINTAINER René Solis <rene.solis@tectijuana.edu.mx>

#---------------------------------------------------------------------
# Actualizaciones e instalaciones
#---------------------------------------------------------------------
#
# Actualizar la imagen con las herramientas para usar el ensamblador ARM64:
#
# build-base - Compiladores GCC soporte para sus trabajos con ensamblador
# fish - el Bash MEJORADO a colores
# git nano vim gdb - debuger y editores junto con github.com
# wget curl htop mc tree ssh scp - diversas herramientas para el desarrollador
#
RUN apk update && apk upgrade
RUN apk add build-base git nano vim gdb wget curl mc tree openssh-client fish

#---------------------------------------------------------------------
# Mensajeria al Shell
#---------------------------------------------------------------------
#
# Source working/installation directory
ENV INSTALL /usr/local/src
RUN echo '[ ! -z "$TERM" -a -r /etc/motd ] && cat /etc/issue && cat /etc/motd' \
    >> /etc/bash.bashrc \
    ; echo "\
===================================================================\n\
= SomeApp Docker container                                        =\n\
===================================================================\n\
\n\
Ensamblador: Su materia favorita.\n\
(c) Rene 2020\n\
\n\
Source directory is $INSTALL\n"\
    > /etc/motd
    
CMD ["fish"] 
#
# La bienvenida a docker ARM mensaje
# RUN sh -c "$(wget -O- https://raw.githubusercontent.com/tectijuana/interfaz/master/docker/dockerlogo.sh)"

#
# Puerto expuesto 80 (no hay servidores en nuestras practicas, por eso se deja por TEMPLETE) 
# EXPOSE 80 

#
# TIPS PARA LAS IMAGENES
# https://hub.docker.com/r/arm64v8/alpine
# https://pythonspeed.com/docker/
# https://towardsdatascience.com/15-docker-commands-you-should-know-970ea5203421
