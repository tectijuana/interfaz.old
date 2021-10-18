## En Windows es directo el trabajo
Descargar e instalar, 
arreglar el $path$ para que cuando corra uno de los comandos se ejecute y no marque "error command not found"

## Introducción ARM TOOLCHAIN para macOS y Linux

ARM Embedded Toolchain es un compilador cruzado con licencia GNU para arquitecturas de CPU ARM,
lo que le permite compilar código C/C++ en binarios que se pueden ejecutar en CPU como el
Línea de microcontroladores Cortex-M.

Cuando se trata de desarrollo integrado C/C++, tiene la opción de varios compiladores.
[Keil] (https://www.keil.com/) es probablemente la marca comercial más conocida en el
espacio de cadena de herramientas incrustado. Tienen su propio compilador y IDE patentados, que es
bastante popular para aplicaciones comerciales (es caro y solo se ejecuta en Windows).

Nos centraremos en la cadena de herramientas ARM (__ARM ToolChain__), que es de código abierto bajo una licencia GNU y
de uso gratuito para todos los proyectos.

## Descargar

Visite la [página de descargas] (https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads).
y descargue el archivo `.pkg` etiquetado con` Paquete Mac OS X de 64 bits (firmado y notariado) `.

## Instalar

Ejecute el instalador `.pkg`. `cd / Applications / ARM` y debería ver lo siguiente
estructura:

```bash
.
├── arm-none-eabi
│   ├── bin
│   ├── include
│   ├── lib
│   └── share
├── bin
│   ├── arm-none-eabi-addr2line
│   ├── arm-none-eabi-ar
│   ├── arm-none-eabi-as
│   ├── arm-none-eabi-c++
│   ├── arm-none-eabi-c++filt
│   ├── arm-none-eabi-cpp
│   ├── arm-none-eabi-elfedit
│   ├── arm-none-eabi-g++
│   ├── arm-none-eabi-gcc
│   ├── arm-none-eabi-gcc-10.2.1
│   ├── arm-none-eabi-gcc-ar
│   ├── arm-none-eabi-gcc-nm
│   ├── arm-none-eabi-gcc-ranlib
│   ├── arm-none-eabi-gcov
│   ├── arm-none-eabi-gcov-dump
│   ├── arm-none-eabi-gcov-tool
│   ├── arm-none-eabi-gdb
│   ├── arm-none-eabi-gdb-add-index
│   ├── arm-none-eabi-gdb-add-index-py
│   ├── arm-none-eabi-gdb-py
│   ├── arm-none-eabi-gprof
│   ├── arm-none-eabi-ld
│   ├── arm-none-eabi-ld.bfd
│   ├── arm-none-eabi-lto-dump
│   ├── arm-none-eabi-nm
│   ├── arm-none-eabi-objcopy
│   ├── arm-none-eabi-objdump
│   ├── arm-none-eabi-ranlib
│   ├── arm-none-eabi-readelf
│   ├── arm-none-eabi-size
│   ├── arm-none-eabi-strings
│   └── arm-none-eabi-strip
├── lib
│   ├── gcc
│   ├── libcc1.0.so
│   └── libcc1.so -> libcc1.0.so
└── share
    ├── doc
    └── gcc-arm-none-eabi
```

La mayoría de las herramientas e IDE de terceros intentarán ejecutar varios binarios en el
carpeta `./bin` (por ejemplo, el compilador `arm-none-eabi-g++`, C++), así que agréguelo a su
`PATH`.

¡Eso es! Debería poder ejecutar `arm-none-eabi-g++` en cualquier lugar de su sistema
para ejecutar el compilador cruzado de C++. 
