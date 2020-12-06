# WIRING (PROCESSING)

**Wiring** es una plataforma de prototipado electrónico de fuente abierta compuesta de un lenguaje de programación, un entorno de desarrollo integrado (IDE), y un microcontrolador. Ha sido desarrollado desde 2003 por Hernando Barragán. https://es.wikipedia.org/wiki/Wiring


# Programe su Raspberry Pi como un Arduino
## Instalar WiringPi
Para controlar la E / S de la Raspberry Pi como las del microcontrolador Arduino, puede usar el cableado de la biblioteca wiringPi.h.

En una terminal, verifique que la biblioteca esté instalada escribiendo:

```bash
$ gpio -v
$ gpio readall
```

OPCIONALMENTE de no contar con el soporte de debemos copiar repositorio GIT:

```bash
cd
git clone https://github.com/WiringPi/WiringPi.git
```

OPCIONALMENTE compila la biblioteca:

```bash
cd ~/wiringPi
./build
```

------

## WiringPi.h Wiring
La biblioteca WiringPi usa la numeración GPIO (son las siglas de GPIO (General-purpose input/output):

![](https://www.aranacorp.com/wp-content/uploads/raspberrypi-gpio-wiringpi-pinout.png)

Puede encontrar el pinout escribiendo:

```bash
gpio readallCopy
```


## Código base para encender un LED con Raspberry Pi

![](https://www.aranacorp.com/wp-content/uploads/raspberry-pi3-led_bb.png)


# Blinking LED en C++

Una vez instalada la biblioteca, puede escribir un programa utilizando las mismas palabras clave que Arduino, además de la función main () y las funciones básicas incluidas.

```cpp
//
// blinky.cpp
//
//
#include <iostream>
#include <wiringPi.h>
using namespace std;

int ledPin = 29;  //Corresponde a pin 40

void setup(){

	pinMode(ledPin,OUTPUT);
	cout<<"Hello World" << endl;
}

void loop(){
	digitalWrite(ledPin,HIGH);
	delay(100);
	digitalWrite(ledPin,LOW);
	delay(100);

	cout<<"Blink the LED" << endl;
}

int main(void)//(int argc, char **argv)
{
	if(wiringPiSetup()<0){
		cout<<"setup wiring pi failed"<<endl;
		return 1;
	}
	setup();
	while(1){
		loop();
	}
	
	return 0;
}
```

## COMPILACION
```bash
g++ -Wall -o blinky blinky.cpp -lwiringPi
./blinky
PARA SALIR CANCELAR CON TECLA "CONTROL y C"
```

## SALIDA ESPERADA

```bash
root@raspberrypi:~#
root@raspberrypi:~# ls
led  led.c
root@raspberrypi:~# ./led
Hello World
Blink the LED
Blink the LED
Blink the LED
Blink the LED
Blink the LED
Blink the LED
Blink the LED
Blink the LED
Blink the LED
Blink the LED
Blink the LED
Blink the LED
Blink the LED
```

![](https://media1.tenor.com/images/621f6fd4aed7c89736712740cb65d3cb/tenor.gif?itemid=9599407)
PARA SALIR CANCELAR CON TECLA "CONTROL y C", es una **maquina de estado infinito**


# BIBLIOGRAFIA:
https://es.wikipedia.org/wiki/Wiring
https://es.wikipedia.org/wiki/GPIO
https://github.com/WiringPi/WiringPi
https://www.aranacorp.com/es/programe-su-raspberry-pi-con-c-c/
