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
#

#
# docker build --tag arm32:1.0 .
#


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
RUN apt update && apt install -y 
RUN apt install build-essential cmake git nano vim gdb wget curl htop mc tree ssh scp -y

#
# Para mensajeria
# CMD ["/usr/games/cowsay", "Dockerfiles are cool!"]

#
# Instala ZSh interactiva a colores, ¡aguustoo! queda predeterminado al final.
CMD ["sh -c", "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"]
CMD ["chsh -s $(which zsh)"]

#
# Puerto expuesto 80 (no hay servidores en nuestras practicas, por eso se deja por TEMPLETE) 
# EXPOSE 80

#
# La bienvenida a docker ARM mensaje
CMD ["sh -c", "$(wget -O- https://raw.githubusercontent.com/tectijuana/interfaz/master/docker/dockerlogo.sh)"]

# ------------- es una mejora opcional para VIM (de usarlo Ud.) ----------
# Soporte para VIM
# mkdir ~/.vim
# cd .vim
# wget https://github.com/tectijuana/interfaz/raw/master/docker/bash-support.zip
# unzip bash-support.zip 
# rm bash-support.zip
# Agregar a la configuracion via >>
# touch ~/.vimrc
# echo 'file plug-in on' >> ~/.vimrc
## Sin no quire los numeros a la izquierda quitarlo.
# echo 'set number' >> ~/.vimrc
# Editor defaulr de Git es "$ git var -l " es vim, cambiarlo a nano fue el primer editor del semestre
# -------------------------------------
