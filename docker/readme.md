![](https://miro.medium.com/max/700/0*v5XDnFGcanCw_7vk.jpg)

# DOCKER Y ARM Holdings Inc.

_Docker a mediados del 2019 anunció una asociación con ARM Inc., para ayudar a acelerar la adopción de contenedores en el enorme ecosistema de ARM, en DockerCon San Francisco 2019, lanzó una vista previa técnica de compilaciones mejoradas de múltiples arquitecturas dentro de Docker Desktop._

_Docker Desktop es el estándar de facto cuando se trata de desarrollar aplicaciones en contenedores. Esta vista previa tecnológica abrirá el rico ecosistema de Arm a los millones de desarrolladores que ya utilizan y desarrollan en Docker Desktop. Esto no solo simplificará el desarrollo de imágenes de contenedores para su implementación en instancias de Amazon EC2 A1 basadas en Arm en la nube, sino que también ayudará a allanar el camino hacia el billón de dispositivos Edge e IoT basados ​​en Arm en todo el mundo. Analicemos por qué estamos haciendo esto, cómo funciona todo y cómo puede comenzar._

![](https://i1.wp.com/www.docker.com/blog/wp-content/uploads/engineering/2019/04/Screen-Shot-2019-04-26-at-7.25.34-PM.png)

# ¿Por qué Docker hace esto?
_En noviembre de 2018, Amazon anunció instancias EC2 A1 impulsadas por procesadores AWS Graviton que cuentan con núcleos ARM Neoverse de 64 bits y silicio personalizado diseñado por AWS. Las instancias A1 EC2 tienen un costo y un rendimiento optimizados para cargas de trabajo de escalamiento horizontal y ofrecen hasta un 45% de ahorro de costos en comparación con otras instancias EC2. Con esta versión preliminar de la tecnología de Docker Desktop, Docker hace que sea más fácil que nunca desarrollar contenedores en y para los servidores y dispositivos ARM. Con las herramientas y los procesos estándar de Docker con los que ya está familiarizado, puede comenzar a compilar, enviar, extraer y ejecutar imágenes sin problemas en diferentes arquitecturas de sistemas. No se necesitan cambios en Dockerfiles o en el código fuente para comenzar a compilar para ARM. Simplemente reconstruya su imagen utilizando las nuevas funciones que se lanzan hoy. Finalmente, Docker se está expandiendo rápidamente a Edge e IoT, y vemos esto como un paso importante en ese proceso. Docker siempre se ha dedicado a los desarrolladores y ha facilitado las cosas._

# ¿Como funciona?
_Docker Desktop está disponible para macOS y Windows. Agrupa y configura muchas cosas para los usuarios que facilitan enormemente el desarrollo de contenedores. Docker Desktop se envía con hipervisores para el sistema operativo host. El hipervisor es responsable de ejecutar un kernel de Linux ligero (LinuxKit), que se incluye como parte de Docker Desktop. Este sistema operativo contenedor rápido y liviano viene empaquetado con el emulador QEMU y viene preconfigurado con binfmt_misc para ejecutar binarios de cualquier arquitectura compatible. ARM se compromete a respaldar la bifurcación QEMU de Docker y ayudará a mantener este proyecto. Todos los parches se transmitirán, pero Docker Desktop contendrá el soporte de emulación más reciente. En el diagrama de arriba puede ver la emulación QEMU para las imágenes de Docker arm / v6, arm / v7 y arm64._

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



```dockerfile
dockerfile
````


# LOS 3 EDITORES A TRABAJAR

# vim

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
