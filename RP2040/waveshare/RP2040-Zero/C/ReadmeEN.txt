/*****************************************************************************
* | File      	:   Readme_EN.txt
* | Author      :   
* | Function    :   Help with use
* | Info        :
*----------------
* |	This version:   V1.0
* | Date        :   2021-02-04
* | Info        :   Here is an English version of the documentation for your quick use.
******************************************************************************/
This file is to help you use this routine.
Since our ink screens are getting more and more, it is not convenient for our maintenance, so all the ink screen programs are made into one project.
A brief description of the use of this project is here:

1. Basic information:
This routine is used to test or demonstrate WS2812B on RP2040-Zero.

2. Pin connection:
Pin connection You can look at dev_config.c/h in \lib\Config. Again, here:
DIN    ->    16

3. Basic use:
You need to execute:
    If the directory already exists, you can go directly. If there is no build directory, execute
         mkdir build
     Enter the build directory and type in the terminal:
         cd build
         export PICO_SDK_PATH=../../pico-sdk
     Where ../../pico-sdk is your installed SDK directory
     Execute cmake, automatically generate Makefile file, enter in the terminal:
         cmake ..
     Execute make to generate an executable file, and enter in the terminal:
         make
     Copy the compiled uf2 file to pico

