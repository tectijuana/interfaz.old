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

#
# Generar la imagen y visualizar los recursos de su PC
#      docker build --tag arm64/lenginterfaz:compilador .   (si un PUNTO al final)
#      docker images

# Correr y borrar al SALIR
#      docker run  -it --rm --name ensamblador arm64/lenginterfaz:compilador

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
    
WORKDIR /home
# CMD ["wget https://raw.githubusercontent.com/tectijuana/interfaz/master/docker/dockerlogo.sh"]
# CMD ["chmod +x dockerlogo.sh"]
# CMD ["git clone https://github.com/tectijuana/templete.git"]
# CMD ["dockerlogo"]
CMD ["fish"] 
#
# La bienvenida a docker ARM mensaje
 RUN sh -c "$(wget -O- https://raw.githubusercontent.com/tectijuana/interfaz/master/docker/dockerlogo.sh)"

#
# Puerto expuesto 80 (no hay servidores en nuestras practicas, por eso se deja por TEMPLETE) 
# EXPOSE 80 

#
# TIPS PARA LAS IMAGENES
# https://hub.docker.com/r/arm64v8/alpine
# https://pythonspeed.com/docker/
# https://towardsdatascience.com/15-docker-commands-you-should-know-970ea5203421
# https://dzone.com/articles/clone-code-into-containers-how
```
----

# CORRIDA
```
irene@iRenes-MacBook-Pro interfaz % wget https://github.com/tectijuana/interfaz/raw/master/arm64/docker/Dockerfile
--2020-11-23 21:07:13--  https://github.com/tectijuana/interfaz/raw/master/arm64/docker/Dockerfile
Resolving github.com (github.com)... 140.82.113.3
Connecting to github.com (github.com)|140.82.113.3|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://raw.githubusercontent.com/tectijuana/interfaz/master/arm64/docker/Dockerfile [following]
--2020-11-23 21:07:14--  https://raw.githubusercontent.com/tectijuana/interfaz/master/arm64/docker/Dockerfile
Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 151.101.64.133, 151.101.128.133, 151.101.192.133, ...
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|151.101.64.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 3707 (3.6K) [text/plain]
Saving to: ‘Dockerfile’
Dockerfile     100%   3.62K  --.-KB/s    in 0s           
2020-11-23 21:07:14 (23.1 MB/s) - ‘Dockerfile’ saved [3707/3707]


irene@iRenes-MacBook-Pro interfaz % docker build --tag arm64/lenginterfaz:compilador .
[+] Building 0.0s (2/2) FINISHED                          
 => [internal] load .dockerignore                    0.0s
 => => transferring context: 2B                      0.0s
 => [internal] load build definition from Dockerfil  0.0s
 => => transferring dockerfile: 3.75kB               0.0s
failed to solve with frontend dockerfile.v0: failed to create LLB definition: Dockerfile parse error line 48: unknown instruction: APK
irene@iRenes-MacBook-Pro interfaz % ls
Dockerfile
irene@iRenes-MacBook-Pro interfaz % nano Dockerfile 
irene@iRenes-MacBook-Pro interfaz % docker build --tag arm64/lenginterfaz:compilador .
[+] Building 412.6s (9/9) FINISHED                        
 => [internal] load .dockerignore                    0.0s
 => => transferring context: 2B                      0.0s
 => [internal] load build definition from Dockerfil  0.0s
 => => transferring dockerfile: 3.76kB               0.0s
 => [internal] load metadata for docker.io/arm64v8/  0.0s
 => [1/5] FROM docker.io/arm64v8/alpine              0.0s
 => => resolve docker.io/arm64v8/alpine:latest       0.0s
 => [2/5] RUN apk update && apk upgrade              3.5s
 => [3/5] RUN apk add build-base git nano vim gdb  375.8s
 => [4/5] RUN sh -c "$(wget -O- https://raw.githubu  1.0s 
 => [5/5] RUN sh -c "$(wget -O- https://github.com  29.2s 
 => exporting to image                               3.2s 
 => => exporting layers                              3.2s 
 => => writing image sha256:b83a4fb6cf04e21ca947849  0.0s 
 => => naming to docker.io/arm64/lenginterfaz:compi  0.0s 
irene@iRenes-MacBook-Pro interfaz % 

```



