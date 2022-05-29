```console
echo "╭―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――╮"
echo "│             Instalación de EABI Arm ToolChain en laboratorio del TEC              │"
echo "│   Descargar la versión mas nueva para este mayo 2022 el archivo especifico        │"
echo "╰―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――╯"
echo "Este URL debe ser actualizado: mayo 22"
wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2

echo "Soporte diverso compilador y de GDB"
sudo apt install cmake libncurses5 -y


echo "Descomprimir en directorio para todos lo usuarios"
sudo tar xjf gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 -C /usr/share/

echo "Crear simbolic links, para ejecutar desde cualquier parte del shell"
sudo ln -s /usr/share/gcc-arm-none-eabi-10.3-2021.10/bin/* /usr/bin/

echo "Verificamos las versiones... y todo sea localizado por Shell"
arm-none-eabi-gcc --version
arm-none-eabi-g++ --version
arm-none-eabi-size --version
arm-none-eabi-objcopy --version
arm-none-eabi-gdb --version

echo "desde cualquier parte usando $nano puede compiar un programa en ARM Assembly o C, pero recuerde que el TOOLCHAIN es para todos los microcontroladores de ARM no especificame supongamos un PICO 2040, ahi ocupadaría el SDK del producto"
