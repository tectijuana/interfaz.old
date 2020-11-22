# Cada instrucción en este archivo genera una nueva capa que se envía a su caché de imágenes local
#
#
# Las líneas precedidas por # se consideran comentarios y se ignoran
#
#
# Localice una propuesta en HUB.DOCKER.COM para usar ARM32, adaptandolo Ensamblador y el debugger.

FROM navikey/raspbian-buster
#
# Identify the maintainer of an image
LABEL maintainer="rene.solis@tectijuana.edu.mx"

#
# Actualizar la imagen con las herramientas para usar el ensamblador ARM32
# build-essential - Compiladores 
# git nano vim gdb - debuger y editores junto con github
#  wget curl htop mc tree ssh scp - soporte diverso productivo para el desarrollador
RUN apt update && apt install -y build-essential cmake git nano vim gdb wget curl htop mc tree ssh scp
 
# CMD ["/usr/games/cowsay", "Dockerfiles are cool!"]

# Instala ZSh interactiva a colores, ¡aguustoo! queda predeterminado al final.
CMD ["sh -c", "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"]
CMD ["chsh -s $(which zsh)"]

# ------------- Por Mejorar ----------
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
