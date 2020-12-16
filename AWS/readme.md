![](https://www.instana.com/media/01_INSTANA_IconSet_AWS_EC2.svg)

# AWS para IaaS en la nube de Amazon
## Formato específico para la creación de servidores y la importancia de Amazon como herramienta de dispersión de infraestructura en internet.

1. Entrar a https://www.awseducate.com/student/s/
2. Entrar a la pestaña de AWS Account
3. Pulsar en AWS Educate Starter Account
4. Buscar y Pulsar el botón de AWS Console
5. En menú Services Buscar el apartado Informatica y seleccionas EC2
6. Seleccionar instancias (todos los estados)
- Ubicar el botón en la parte superior derecha que dice (Lanzar Instancias)
- Buscar y seleccionar Ubuntu Server 18.04 en arquitectura Arm
- Le Asignamos 2 GB de Ram
- En número de Instancias lo cambiamos a 9 y pulsamos siguiente
- En este caso el almacenamiento se quedará en 8 GB por lo que pulsamos Siguiente sin mover nada
- El paso 5 “Add Tags” no hacemos nada, pulsamos siguiente
- En el siguiente paso dejaremos el puerto predeterminado que es el 22 (SSH) y pulsamos siguiente
7. es una revisión de la instancia y la creación de la llave para acceder a ella por ssh
- Hacemos Click en Launch y abrirá una ventana emergente en donde crearemos la llave 
- Escogemos la opción de “Create a new key pair
- La nombramos y descargamos
- Hacemos click en “Launch Instances”
```
Una vez creada la Instancia ubicamos la IP Pública 3.83.235.164 (ver lado derecho tabulador se puede expandir), con esa ip podemos entrar desde Termius, ubicando los datos en el formulario
en la pantalla principal de termuis.com (ver beca GitHub Pro con el docente)
a) buscamos la opción “New Host”
b) en el formulario que se despliega ubicamos donde dice “Label” y ponemos la ip de la instancio creada de igual manera ponemos la ip en donde dice “Address”
c) más abajo en el espacio destinado al “Username” ponemos el nombre de nuestra instancia, en este caso “Ubuntu”
d) En el apartado de Password hacemos click al costado donde dice “keys” y buscamos la llave creada en el paso 7
e) una vez hecho aparecerá la máquina virtual en la pantalla principal y podremos ingresar a ella con los datos antes brindados
```
