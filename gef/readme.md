#  GDB Enhanced Features (GEF) 

GEF, es un conjunto de comandos increíble para X86, ARM, MIPS, PowerPC y SPARC para hacer que GDB vuelva a ser atractivo para los desarrolladores de exploits. Está destinado a ser utilizado principalmente por desarrolladores de exploits e ingenieros inversos, para proporcionar funciones adicionales a GDB utilizando la API de Python para ayudar durante el proceso de análisis dinámico y desarrollo de exploits.

Tiene soporte completo para Python2 y Python3 indistintamente (a medida que más y más distribuciones comienzan a impulsar gdb compilado con soporte Python3).


![](https://i.imgur.com/E3EuQPs.png)

# INSTALACION RAPIDA

Antes de iniciar asegurese de tener la versión GDB 7.7 or mas nueva.
```
# via  install wget (linux)
$ bash -c "$(wget http://gef.blah.cat/sh -O -)"
```


# Manualmente
```bash
$ wget -O ~/.gdbinit-gef.py -q https://github.com/hugsy/gef/raw/master/gef.py
$ echo source ~/.gdbinit-gef.py >> ~/.gdbinit

Alternativa DENTRO DEL DIRECTORIO es en directo:

$ gdb -q
(gdb) pi \
import urllib.request as u, tempfile as t; \
g=t.NamedTemporaryFile(suffix='-gef.py'); \
open(g.name, 'wb+').write( u.urlopen('https://github.com/hugsy/gef/raw/master/gef.py').read() ); \
gdb.execute('source %s' % g.name)

```
# INSTALACION CON YOUTUBE
Instrucciones estan en: 
Video no recomendado es: https://youtu.be/cdodcaR0ebQ

-----

# Sitios para War Hack y testear el GEF
https://pwnable.tw

ver el playlist https://www.youtube.com/playlist?list=PLjAuO31Rg972WeMvdR_57Qu-aVM8T6DkQ

----
Bibliografia:
https://gef.readthedocs.io/en/master/#setup
https://azeria-labs.com/debugging-with-gdb-introduction/
