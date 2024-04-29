

# Wokwi

**Wokwi** es una plataforma avanzada de simulación en línea diseñada para entusiastas y profesionales de la electrónica y la programación de microcontroladores. Esta herramienta permite simular una amplia variedad de proyectos de hardware, facilitando el desarrollo, la prueba y la enseñanza de electrónica sin necesidad de componentes físicos.

## Características Principales

- **Amplia compatibilidad de microcontroladores**: Incluye soporte para Arduino, ESP32, Raspberry Pi Pico y otros.
- **Simulación de componentes electrónicos**: Permite integrar y simular componentes como LEDs, sensores, pantallas y mucho más.
- **Entorno colaborativo**: Los usuarios pueden compartir sus proyectos y simulaciones con la comunidad, mejorando el aprendizaje colaborativo y la distribución de conocimientos.

## Beneficios

- **Educación**: Ideal para la enseñanza de programación y electrónica, permitiendo a los estudiantes experimentar sin riesgos.
- **Prototipado rápido**: Facilita la iteración y prueba de ideas sin necesidad de inversión inicial en hardware.
- **Colaboración**: Simplifica el compartir y revisar proyectos entre equipos o con la comunidad global.

## Uso

Para empezar a usar Wokwi especificamente usaremos la version C/C++, visita [https://wokwi.com/projects/new/pi-pico-w](https://wokwi.com/projects/new/pi-pico-w) 


# Templete universal para programas de RPI PicoW

~~~cpp


/*
  Programa: Control de Raspberry Pi Pico W
  Autor: [Tu Nombre]
  Fecha: [Fecha de creación]

  Descripción:
  Este programa inicializa la comunicación serial en una Raspberry Pi Pico W y envía un mensaje de bienvenida.
  Posteriormente, entra en un bucle infinito donde puede agregar más funcionalidades.

  Licencia: [Tipo de licencia]
*/

#include <Arduino.h>

void setup() {
  // Inicializa la comunicación serial a 115200 baudios.
  Serial.begin(115200);
  
  // Envía un mensaje de bienvenida.
  Serial.println("Hola, Raspberry Pi Pico W!");

  // Configuraciones adicionales aquí.
}

void loop() {
  // Código principal que se ejecuta repetidamente.

  // Por ejemplo, podrías agregar lógica para leer sensores, controlar actuadores, etc.

  // Retraso mínimo para evitar saturar el bucle.
  delay(1);
}

~~~

# Programar placa PicoW hardware

Para trabajar con la Raspberry Pi Pico W sin utilizar el entorno de Arduino, puedes programarla utilizando el SDK oficial en C/C++, en la terminal de comandos, trae su compilador y enlazador manualente,

En los equipos de Laboratorio acceder a Linux para cargar el SDK y no sea borrado por el bloqueador del laboratorista.

# Instalación

La comunidad Arduino apoyando hizo una modificación y agrego una extension del SDK (Software Development Kit) de Raspberry Pi; similar a VSCode con sus extensiones.

https://arduino-pico.readthedocs.io/en/latest/install.html

