FROM navikey/raspbian-buster
RUN apt update && apt install -y build-essential cmake git nano vim gdb wget curl htop mc tree ssh scp
 
# CMD ["/usr/games/cowsay", "Dockerfiles are cool!"]
# Instala ZSh interactiva a colores, ¡aguustoo! queda predeterminado al final.
CMD ["sh -c", "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"]
CMD ["chsh -s $(which zsh)"]


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
