# Emulador para ARM32 de RaspberryPi 3


# macOS

## macos-qemu-rpi
Bash scripts para ejecutar Raspbian (arquitectura ARM) en macOS Catalina usando QEMU

## Instalación

Instale [homebrew] (https://brew.sh/), si aún no lo ha hecho.
A continuación, ejecute el siguiente script:

```bash
./install.sh
```

## Correr Raspbian en QEMU

```bash
./run.sh
```

Este script no requiere macOS, pero la imagen / kernel de Raspbian y QEMU son necesario.

Tenga en cuenta que estos scripts reenvían el puerto TCP / 5022 en el host (por ejemplo, macOS) al puerto
TCP / 22 en el invitado Raspbian donde escucha el servidor SSH de Raspbian.
Para ejecutar Raspbian en QEMU, ninguna otra aplicación, incluido Raspbian, puede escuchar
puerto TCP / 5022 en el host.

## Logging a RaspbianOS

Inicie sesión a través de la ventana de QEMU o use SSH:
```bash
ssh pi@127.0.0.1 -p 5022
```

Para obtener un shell de root, ejecute lo siguiente:
```bash
sudo bash
```

## Apagado de RaspbianOS
Inicie sesión en Raspbian y luego ejecute `sudo halt` en el shell de Raspbian.

## Tutorial

Las instrucciones de configuración avanzada en Raspbian se proporcionan en
https://azeria-labs.com/emulate-raspberry-pi-with-qemu/

## Créditos

Los scripts de este repositorio se basan en
https://gist.github.com/hfreire/5846b7aa4ac9209699ba#gistcomment-3075728.
El crédito es para @janwillemCA, @tinjaw y los otros contribuyentes de ese GitHub
esencia.


---------

# Windows 7-10



# Emulador para ARM32 de RaspberryPi 3


Referencia 1: https://thinkingeek.com/2013/01/09/arm-assembler-raspberry-pi-chapter-1/
Referencia 2: http://bob.cs.sonoma.edu/IntroCompOrg-RPi/intro-co-rpi.html
