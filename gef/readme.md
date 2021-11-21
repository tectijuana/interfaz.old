#  GDB Enhanced Features (GEF) 

GEF, es un conjunto de comandos increíble para X86, ARM, MIPS, PowerPC y SPARC para hacer que GDB vuelva a ser atractivo para los desarrolladores de exploits. Está destinado a ser utilizado principalmente por desarrolladores de exploits e ingenieros inversos, para proporcionar funciones adicionales a GDB utilizando la API de Python para ayudar durante el proceso de análisis dinámico y desarrollo de exploits.

Tiene soporte completo para Python2 y Python3 indistintamente (a medida que más y más distribuciones comienzan a impulsar gdb compilado con soporte Python3).


![](https://i.imgur.com/E3EuQPs.png)

# 1.- INSTALACION MANUAL
```bash
$ wget -O ~/.gdbinit-gef.py -q https://github.com/hugsy/gef/raw/master/gef.py
$ echo source ~/.gdbinit-gef.py >> ~/.gdbinit
```

# 2.- INSTALACION DEPENDIENCIAS
# Python3.x se tardó como 20 minutos la compilación de estas librerias, no desespere es Python para en ARM
```
$ pip3 install keystone-engine capstone unicorn keystone-engine ropper

-----
Looking in indexes: https://pypi.org/simple, https://www.piwheels.org/simple
Downloading https://files.pythonhosted.org/packages/0a/65/3a2e7e55cc1db188869bbbacee60036828330e0ce57fc5f05a3167ab4b4d/keystone-engine-0.9.2.tar.gz (2.8MB)
    100% |████████████████████████████████| 2.8MB 160kB/s
Building wheels for collected packages: keystone-engine
  Running setup.py bdist_wheel for keystone-engine ... 
  Stored in directory: /root/.cache/pip/wheels/18/98/f7/79001c67275329cc96c5badfd7af00f28df5afc21ae3b57e82
Successfully built keystone-engine
Installing collected packages: keystone-engine
Successfully installed keystone-engine-0.9.2
Collecting unicorn
  Downloading https://files.pythonhosted.org/packages/6c/64/18ebc847dd261ea1742640e87bbd5d78ed1934d7a9b76fb2f93b9908dd9f/unicorn-1.0.3.tar.gz (1.6MB)
    100% |████████████████████████████████| 1.6MB 279kB/s
Collecting capstone
  Downloading https://files.pythonhosted.org/packages/f2/ae/21dbb3ccc30d5cc9e8cdd8febfbf5d16d93b8c10e595280d2aa4631a0d1f/capstone-4.0.2.tar.gz (2.0MB)
    100% |████████████████████████████████| 2.0MB 224kB/s
Collecting ropper
  Downloading https://www.piwheels.org/simple/ropper/ropper-1.13.6-py3-none-any.whl (100kB)
    100% |████████████████████████████████| 102kB 235kB/s
Collecting filebytes>=0.10.0 (from ropper)
  Downloading https://www.piwheels.org/simple/filebytes/filebytes-0.10.2-py3-none-any.whl
Building wheels for collected packages: unicorn, capstone
  Running setup.py bdist_wheel for unicorn ... done
  Stored in directory: /root/.cache/pip/wheels/1a/cd/7e/35f6fe5ef4e5feb7c26d3199faae6b5b24c2f7c7d704c0c259
  Running setup.py bdist_wheel for capstone ... done
  Stored in directory: /root/.cache/pip/wheels/68/a3/9a/35a77336e02eea8951a7ee9f743493daea9f3f22d3a7982b9a
Successfully built unicorn capstone
Installing collected packages: unicorn, capstone, filebytes, ropper
Successfully installed capstone-4.0.2 filebytes-0.10.2 ropper-1.13.6 unicorn
----
```
# VIDEOINSTALACION EN YOUTUBE
Instrucciones estan Video no recomendado es: https://youtu.be/cdodcaR0ebQ
ver el playlist https://www.youtube.com/playlist?list=PLjAuO31Rg972WeMvdR_57Qu-aVM8T6DkQ

-----

# LISTO PARA TRABAJAR
```
➜  ~ gdb -q
GEF for linux ready, type `gef' to start, `gef config' to configure
96 commands loaded for GDB 8.2.1 using Python engine 3.7
GEF for linux ready, type `gef' to start, `gef config' to configure
96 commands loaded for GDB 8.2.1 using Python engine 3.7
gef➤
```
----
# Sitios para War Hack y testear el GEF
https://pwnable.tw


----
Bibliografia:
https://gef.readthedocs.io/en/master/#setup
https://azeria-labs.com/debugging-with-gdb-introduction/
