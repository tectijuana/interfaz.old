/* blink.c
   D. Thiebaut
   taken from https://www.raspberrypi.org/forums/viewtopic.php?f=33&t=23090
   blinks Physical Pin 7 On and Off, 10 times.

   to compile and run:
   gcc -o blink blink.c -lwiringPi
   sudo ./blink
*/

#include <wiringPi.h>
#include <stdio.h>
#include <stdlib.h>

int main ( void ) {
  int pin = 7;
  printf("Raspberry Pi wiringPi blink test\n");

  if (wiringPiSetup() == -1) {
    printf( "Setup didn't work... Aborting." );
    exit (1);
  }
  
  pinMode(pin, OUTPUT);

  int i;
  for ( i=0; i<10; i++ ) {
    digitalWrite(pin, 1);    
    delay(250);

    digitalWrite(pin, 0);
    delay(250);
  }

  return 0;
}
