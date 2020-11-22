![](https://miro.medium.com/max/700/0*v5XDnFGcanCw_7vk.jpg)

# DOCKER Y ARM Holdings Inc.

_Docker a mediados del 2019 anunció una asociación con ARM Inc., para ayudar a acelerar la adopción de contenedores en el enorme ecosistema de ARM, en DockerCon San Francisco 2019, lanzó una vista previa técnica de compilaciones mejoradas de múltiples arquitecturas dentro de Docker Desktop._

_Docker Desktop es el estándar de facto cuando se trata de desarrollar aplicaciones en contenedores. Esta vista previa tecnológica abrirá el rico ecosistema de Arm a los millones de desarrolladores que ya utilizan y desarrollan en Docker Desktop. Esto no solo simplificará el desarrollo de imágenes de contenedores para su implementación en instancias de Amazon EC2 A1 basadas en Arm en la nube, sino que también ayudará a allanar el camino hacia el billón de dispositivos Edge e IoT basados ​​en Arm en todo el mundo. Analicemos por qué estamos haciendo esto, cómo funciona todo y cómo puede comenzar._

![](https://i1.wp.com/www.docker.com/blog/wp-content/uploads/engineering/2019/04/Screen-Shot-2019-04-26-at-7.25.34-PM.png)

# ¿Por qué Docker hace esto?
_En noviembre de 2018, Amazon anunció instancias EC2 A1 impulsadas por procesadores AWS Graviton que cuentan con núcleos ARM Neoverse de 64 bits y silicio personalizado diseñado por AWS. Las instancias A1 EC2 tienen un costo y un rendimiento optimizados para cargas de trabajo de escalamiento horizontal y ofrecen hasta un 45% de ahorro de costos en comparación con otras instancias EC2. Con esta versión preliminar de la tecnología de Docker Desktop, Docker hace que sea más fácil que nunca desarrollar contenedores en y para los servidores y dispositivos ARM. Con las herramientas y los procesos estándar de Docker con los que ya está familiarizado, puede comenzar a compilar, enviar, extraer y ejecutar imágenes sin problemas en diferentes arquitecturas de sistemas. No se necesitan cambios en Dockerfiles o en el código fuente para comenzar a compilar para ARM. Simplemente reconstruya su imagen utilizando las nuevas funciones que se lanzan hoy. Finalmente, Docker se está expandiendo rápidamente a Edge e IoT, y vemos esto como un paso importante en ese proceso. Docker siempre se ha dedicado a los desarrolladores y ha facilitado las cosas._

# ¿Como funciona?
_Docker Desktop está disponible para macOS, Linux y Windows. Agrupa y configura muchas cosas para los usuarios que facilitan enormemente el desarrollo de contenedores. Docker Desktop se envía con hipervisores para el sistema operativo host. El hipervisor es responsable de ejecutar un kernel de Linux ligero (LinuxKit), que se incluye como parte de Docker Desktop. Este sistema operativo contenedor rápido y liviano viene empaquetado con el emulador QEMU y viene preconfigurado con binfmt_misc para ejecutar binarios de cualquier arquitectura compatible. ARM se compromete a respaldar la bifurcación QEMU de Docker y ayudará a mantener este proyecto. Todos los parches se transmitirán, pero Docker Desktop contendrá el soporte de emulación más reciente. En el diagrama de arriba puede ver la emulación QEMU para las imágenes de Docker arm/v6, arm/v7 y arm64 requeridas para este curso_

|                    TIPO DE USO                   |
|:--------------------------------------------------:|
| linux/amd64 (64 bit Linux nativo)                  |
| linux/arm64 (para for Amazon EC2 A1 instancias) |
| linux/arm/v8 (para for Raspberry Pi)           |
| linux/arm/v71 (para for Raspberry Pi 32 bits)           |
| linux/s390x (para mainframe clasicos)                 |
| linux/ppc64le (para IBM POWER8 Little Endian)       |
| windows/amd64 (64 bit Windows nativo)              |
| .... Y mucho mas ....             |

![](https://dc722jrlp2zu8.cloudfront.net/media/cache/7a/9b/7a9bd671b3e1104196391f8c497d3e5c.jpg)

# ¿Qué es un Dockerfile?

1. Un Dockerfile es un archivo de configuración de un [texto escrito con una sintaxis especial](https://docs.docker.com/engine/reference/builder/)
2. Describe instrucciones paso a paso de todos los comandos que necesita ejecutar para ensamblar una imagen de Docker.
3. El comando docker build procesa este archivo generando una imagen de Docker en su caché de imágenes local, 
4. Luego puede iniciar con el comando docker run, o enviarlo a un repositorio de imágenes permanente.

_Docker file revisado para estas practicas estan algunas lineas opcionales con el "#" despues puede hacerlo directamente_

```dockerfile
dockerfile
````

![](https://images.cooltext.com/5483267.png)
<a href="http://cooltext.com" target="_top"><img src="https://cooltext.com/images/ct_pixel.gif" width="80" height="15" alt="Cool Text: Logo and Graphics Generator" border="0" /></a>

----
![](https://upload.wikimedia.org/wikipedia/commons/4/4f/Icon-Vim.svg)

Usar **Vim** es una experiencia completamente distinta a usar cualquier otro editor de código. La madurez de este editor de código es indiscutible, pues lleva desarrollándose más de 25 años. La característica más destacable de este editor es su modo de edición modal, en los que seremos capaces de realizar distintos tipos de operaciones.La gracia de usar Vim está en que no tendremos que usar más el ratón ni las teclas de dirección para editar archivos.

_Se utiliza una sintaxis de verbo-modificador-objeto._ Empezaremos en el modo normal, pulsaremos **i** (entrar al modo insertar) para introducir unos cuantos párrafos de texto, **pulsaremos Esc** para volver al modo normal y aquí empieza la magia.

**Aprender algunos verbos:** **v** (visual), **c** (change/cambiar), **d** (delete/borrar), **y** (yank/copiar).

**Aprender modificadores:** **i** (inside/dentro de), **a** (around/alrededor), **t** (till../hasta que encuentra el carácter), **f** (find../hasta que encuentra el carácter incluyéndolo), **/** (buscar).

**Aprender objetos:** **w** (word/palabra), **s** (sentence/frase) **p** (paragraph/párrafo) **b** (block/parentesis), **t** (tag/ para html/xml).

|           COMANDO         |                      ACCION DESCRIPTIVA                   |
|---------------------------|-----------------------------------------------------------|
| :e nombreDelarchivo         | editar otro archivo                                         |
| :split nombreDelarchivo     | ventana dividida y CARGA OTRO archivo                       |
| ctrl-w  flecha hacia arriba | el cursor hacia arriba en una ventana                       |
| ctrl-w ctrl-w               | mueve el cursor a otra ventana (ciclo)                      |
| ctrl-w _                    | maximizar la ventana actual                                 |
| ctrl-w =                    | hacer que todos tengan el mismo tamaño                      |
| 10 ctrl-w+                  | aumenta el tamaño de la ventana en 10 líneas                |
| :vsplit nombreDelarchivo    | división vertical                                           |
| :sview file                 | igual que dividido, pero de SOLO LECTURA                    |
| :hide                       | CERRAR la ventana actual                                    |
| :only                       | mantenga SOLO esta ventana abierta                          |
| :ls                         | muestra los búferes actuales (LISTA NUMEROS)                |
| :b NUMERO_LS                | presenta el numero de :ls a pantalla (ejemplo 1,2,4 de :ls) |

Cuando hayamos acabado de editar el archivo,  **guardar** nuestros cambios desde el modo normal **pulsaremos Esc** **:w**, los dos puntos nos llevan al modo de introducir comandos y la w es del ingles «write», escribir. Si queremos salir escribiremos **:q** (quit), para guardar y salir **:wq** y para salir sin guardar los cambios **:q!**.

[![Vim in 8 minutes](http://img.youtube.com/vi/ggSyF1SVFr4/0.jpg)](http://www.youtube.com/watch?v=ggSyF1SVFr4 "vim in 8 minutes (ingles con subtitulos)")

-----

# MIDNIGHT COMMANDER
![](https://upload.wikimedia.org/wikipedia/commons/9/9b/Midnight_Commander_4.7.0.9_on_Ubuntu_11.04.png)

**Midnight Commander (mc)** es un gestor de ficheros ortodoxo para sistemas tipo Unix y también existe para la plataforma Windows y es un clon del _Norton Commander._

 La pantalla principal consiste en dos paneles en los cuales se muestra el sistema de ficheros. Se usa de un modo similar a otras aplicaciones que corren en el shell o interfaz de comandos de Unix. Las teclas de cursor permiten desplazarse a través de los ficheros, la tecla insertar se usa para seleccionar ficheros y las Teclas de función realizan tareas tales como borrar, renombrar, editar, copiar ficheros, etc. Las versiones más recientes de Midnight Commander incluyen soporte para el ratón para facilitar el manejo de la aplicación.
 
 La corrida en la terminal es via:
 
 ```bash
 $ mc
 ```
 
 ----
 
 ![](https://upload.wikimedia.org/wikipedia/commons/1/1e/Oh_My_Zsh_logo.png)
 
 # ZSH
 
Z shell (o simplemente zsh) es un potente intérprete de comandos para sistemas operativos de tipo Unix, como por ejemplo los BSD o GNU/Linux.1​ La primera versión de zsh _fue escrita por Paul Falstad en 1990, cuando era estudiante en la Universidad de Princeton._

Zsh se diseñó para poder usarse interactivamente. Se le han incorporado muchas de las características principales de otras shells de Unix como bash, ksh, o tcsh y además posee características propias originales.

[![zsh en acción (ingles)](http://img.youtube.com/vi/4KBuPCeF9Gc/0.jpg)](http://www.youtube.com/watch?v=4KBuPCeF9Gc "zsh en acción (ingles)")
