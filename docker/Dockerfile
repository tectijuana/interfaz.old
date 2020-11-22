FROM navikey/raspbian-buster
RUN apt update && apt install -y build-essential git nano vim gdb wget curl htop mc tree ssh scp
 
# CMD ["/usr/games/cowsay", "Dockerfiles are cool!"]
# Instala ZSh interactiva a colores, ¡aguustoo! queda predeterminado al final.
CMD ["sh -c", "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"]
CMD ["chsh -s $(which zsh)"]

# Editor defaulr de Git es "$ git var -l " es vim, cambiarlo a nano fue el primer editor del semestre
