![](https://d33wubrfki0l68.cloudfront.net/306f655dcc33cc3d958cab80d78d3f2da427974c/a2bd8/img/logo/svg/full_colored_dark.svg)

Trabajaremos de manera interactiva con el bash del sistema operativo RaspbianOS, para que no se ven tan aburrida la interface estamos adaptando un Framework un templete de color y forma de nombre OmyZH

![https://github.com/ohmyzsh/ohmyzsh](https://ohmyz.sh/img/OMZLogo_BnW.png)

#OMyZsh


Oh My Zsh es un framework para gestionar la configuración de la línea de comandos en Unix y sistemas operativos similares. Proporciona una gran cantidad de funciones útiles y una amplia variedad de temas y complementos que permiten personalizar y mejorar la experiencia en la terminal.

Para comenzar a trabajar con Oh My Zsh, primero debes instalarlo. Puedes hacerlo siguiendo las instrucciones en su página web oficial: https://ohmyz.sh/#install

Una vez que hayas instalado Oh My Zsh, puedes comenzar a personalizar tu configuración en la terminal. Puedes hacerlo a través del archivo .zshrc, que se encuentra en tu directorio de inicio. Este archivo es donde se almacena tu configuración personalizada y donde puedes agregar temas y complementos.

> omz theme list
> omz theme set fox


Por ejemplo, puedes cambiar el tema de la terminal agregando la línea __ZSH_THEME="nombre_del_tema"__ al archivo .zshrc, donde "nombre_del_tema" es el nombre del tema que deseas usar. También puedes agregar complementos a través de la variable plugins, como plugins=(git docker) para habilitar los complementos de Git y Docker.

Además, Oh My Zsh viene con una amplia variedad de alias útiles que puedes usar para agilizar tus tareas en la terminal. Puedes ver una lista completa de alias escribiendo alias en la terminal.









# SCRIPT Demo de "nieve" demostrativo para el grupo
## SnowFlakes

```bash
#!/bin/bash

LINES=$(tput lines)
COLUMNS=$(tput cols)

declare -A snowflakes
declare -A lastflakes

clear

function move_flake() {
    i="$1"

    if [ "${snowflakes[$i]}" = "" ] || [ "${snowflakes[$i]}" = "$LINES" ]; then
        snowflakes[$i]=0
    else
        if [ "${lastflakes[$i]}" != "" ]; then
            printf "\033[%s;%sH \033[1;1H " ${lastflakes[$i]} $i
        fi
    fi

    printf "\033[%s;%sH\u274$[($RANDOM%6)+3]\033[1;1H" ${snowflakes[$i]} $i

    lastflakes[$i]=${snowflakes[$i]}
    snowflakes[$i]=$((${snowflakes[$i]}+1))
}

while :
do
    i=$(($RANDOM % $COLUMNS))

    move_flake $i

    for x in "${!lastflakes[@]}"
    do
        move_flake "$x"
    done

    sleep 0.1
done
```
