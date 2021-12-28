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
# Las líneas precedidas por # se consideran comentarios y se ignoran. Localice una propuesta en HUB.DOCKER.COM para usar ARM32, 
# adaptandolo Ensamblador y el debugger. Para esta practica seleccionamos uno no-oficial. En futuras practicas usar "Alpine Linux"
#
# Por MC. René Solis R.  
# Twitter:  @IoTeacher

#
# Generar la imagen
# $ docker build --tag arm32/lenginterfaz:compilador .   (si un PUNTO al final)
# $ docker images
#
# DOS FORMAS DE CORRER, la 1ra es la recomendable. 
# 
# a) Correr y se libera al salir de la sesión.
#     $  docker run --rm -ti --name assembler  arm32/lenginterfaz:compilador sh
#                         para salir usar "exit" en terminal, se libera de memoria, "--rm es REMOVER".
#                         (recordar que se destruye todo lo que esta dentro de esta, por ello debe de subir a GitHub.com con --
#                         las herramientas de $ git clone, git add, git commit y git push)
#  
#
# b) Lanzamos la imagen y accedemos a el contenedor..
#        
#     $  docker run -d -ti --name assembler arm32/lenginterfaz:compilador sh
#                         para sair usar "exit" en terminal.
#     $  docker rename >>EL ID CONTENEDOR<<< practidock
#     $  docker start practidocker
#     $  docker attach practidocker
#     $  docker ps -a
#                       Muestra la lista de procesos en memoria
#     $  docker rm assembler
#                       Para apagar y liberarlo "rm es REMOVER".

#
# TIPS PARA LAS IMAGENES
#
# $ docker container rm my_container — Borrar una o varios contenedores.
# $ docker container rm $(docker ps -a -q) — Borra TODO los contenedores que no estan corriendo en procesos.
# $ docker container kill $(docker ps -q)  — Parar todos los contenedores corriendo en memoria.

# PURGAR DOCKER EL SISTEMAS OPERATIVO DE LA PC
# $ docker system prune  (Borra todos los contenedores, redes sin usar y imagenes trabadas)
# $ docker system prune -a (un RESETEO desde CERO todo borra y deja como 1ra vez que se instalo)

# Deposito original (puede cambiar por otras versiones, por ejemplo ARM64) para ensamblador 64 bits
# Para Raspbian (que en si es Debian Buster 2019) compatible
# FROM navikey/raspbian-buster:latest
# Debian BullsEye 2021
FROM arm32v7/debian:bullseye-slim
# PAra 64 bits 2021
# FROM arm64v8/debian:bullseye-slim

# Identificar al mantenedor de una imagen
LABEL maintainer="rene.solis@tectijuana.edu.mx"

#
# Actualizar la imagen con las herramientas para usar el ensamblador ARM32:
#
# build-essential - Compiladores soporte para sus trabajos con Ensamblador
# git nano vim gdb - debuger y editores junto con github.com
# wget curl htop mc tree ssh scp - diversas herramientas para el desarrollador
#
RUN echo 'Actualizando cargando Tool Chain de asssembly, mas otros comandos  de soporte ...💨'
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y build-essential git nano vim gdb wget curl mc tree
RUN echo 'Soporte de CMAKE ...💨'
RUN apt-get -y install cmake protobuf-compiler
RUN echo 'SSH para conectarnos Pi4.duckdns.org ... para el GDB ..💨'
RUN apt-get -y  install openssh-client
WORKDIR /home

#
# Instala ZSh interactiva a colores, ¡aguustoo! queda predeterminado al final.
# Uses "git", "ssh-agent" and "history-substring-search" bundled plugins
# https://github.com/deluan/zsh-in-docker
# Default powerline10k theme, no plugins installed
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.1/zsh-in-docker.sh)"

#
# La bienvenida a docker ARM mensaje
RUN sh -c "$(wget -O- https://raw.githubusercontent.com/tectijuana/interfaz/master/docker/dockerlogo.sh)"

#
# 📢  Para no teclear el Git Global y configurar para su token📢
RUN echo 'Personalizando el Git Account..💨'
RUN git config --global user.name "your_github_username"
RUN git config --global user.email "your_github_email"
RUN git config -l
RUN git config --global core.editor nano

# Una vez configurado GIT ahora accedemos a:

#  git clone https://github.com/YOUR-USERNAME/YOUR-REPOSITORY
# > Cloning into `Spoon-Knife`...
#  Username for 'https://github.com' : username
#  Password for 'https://github.com' : aqui poner su tocken
#  
#  Ahora podrá tener en caché el registro del token que lo recuerde:
#  git config --global credential.helper cache
#  Si requiere BORRARLO realizar: :
#  git config --global --unset credential.helper
#   git config --system --unset credential.helper

#   Intente hacer un pull con -v para verificar
# git pull -v


#
# Puerto expuesto 80 (no hay servidores en nuestras practicas, por eso se deja por TEMPLETE) 
# EXPOSE 80

#
# -- Cuando accede el usuario aqui preparar su entrada 
# ADD copia contenido descargado en local hacia el DOCKER (debe estar el archivo fisico)
#ADD setup.sh /root/setup.sh 
#ENTRYPOINT ["/home/setup.sh"]
#CMD []

#
# 👀 Observaciones del Git 👀
# git add --all
# git commit -am "<commit message>"
# git status (para ver en COLOR VERDE que es lo que va a subir) 
# git push --force origin master

#
# REFERENCIAS
# https://towardsdatascience.com/15-docker-commands-you-should-know-970ea5203421
