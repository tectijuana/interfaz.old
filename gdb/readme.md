# GBD Servidor

La depuración de GDBRemote es el proceso de depurar un programa que se ejecuta en un sistema diferente (llamado destino) desde un sistema diferente (llamado host).

Para iniciar la depuración remota, un depurador que se ejecuta en la máquina host se conecta a un programa que se ejecuta en el destino a través de la red.

El depurador en el host puede controlar la ejecución del programa en el sistema remoto y recuperar información sobre su estado.

La depuración remota suele ser útil en el caso de aplicaciones integradas donde los recursos son limitados.

En este tutorial, veremos cómo podemos depurar programas que se ejecutan en un sistema diferente usando GDB Server.

Necesitamos las siguientes dos utilidades para realizar una depuración remota.

gdbserver: ejecute esto en su sistema de destino
GDB: ejecute esto en su sistema host para conectarse a su sistema de destino
GDB y gdbserver se comunican a través de una línea serial o una red, usando el protocolo serial remoto estándar gdb.


1. Instale gbdserver en el sistema de destino

La máquina de destino es la que está ejecutando el programa que debe depurar. Necesita tener el ejecutable "gdbserver" en la máquina de destino.

````
sudo apt-get install gdbserver

$ gdbserver localhost:2000 my_prg 

Process program created; pid = 2045
Listening on port 2000


````


__Bibliografía__
https://www.thegeekstuff.com/2014/04/gdbserver-example/
