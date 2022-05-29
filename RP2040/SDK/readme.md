```console
echo "╭――――――――――――――――――――――――――――――――――――――――――――――――――╮"
echo "│   Adaptación del SDK en la terminal directa      │"
echo "│ Crear directorio PICO para clonar SDK y ejemplos │"
echo "╰――――――――――――――――――――――――――――――――――――――――――――――――――╯"

cd
mkdir pico
cd pico
git clone -b master https://github.com/raspberrypi/pico-sdk.git
git clone -b master https://github.com/raspberrypi/pico-examples.git
cd pico-sdk
git submodule update --init

echo "Instalar ARM Toolchain desactualizado"
sudo apt install cmake gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential
echo "(CLAVE es 123 en LABORATORIOS)"


echo "Para  Ubuntu derivados usaremos este soporte"
sudo apt install cmake gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential libstdc++-arm-none-eabi-newlib

echo "Actualizar (opcional)"
cd pico-sdk
git pull
git submodule update


echo "Corre el Blink"
echo "En el directorio pico acceder al pico-examples "
pwd
cd …/pico-examples
mkdir build
cd build

echo "Aqui de usar las mismas rutas previas en primer parrafo damos un PATH para el CMake localice complementos"
export PICO_SDK_PATH=../../pico-sdk

echo "Compilar el blink LED"
cmake ..
cd blink
make -j4

echo "Listar el directorio ahivera el *.uf2"
ls

echo "blink.elf, es para el debugger"
echo "blink.uf2, es para el RPI 2040 Pico Hardware copiarlo por favor."
echo " $ df, para ver donde esta la pico, previamente presionado el boton BOOTLOADER-conectada USB"

df
echo "cp blink.uf2 /media/__________/RP-PICO "
