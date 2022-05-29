// Por ABRAHAM JHARED FLORES A.
// Generacion 22A

#include "pico/stdlib.h"

int main() {
    const unsigned short SLEEP_TIME_MS = 500;
    const unsigned char LED_BIT_N[4] = {19, 14, 11, 9}; //bit0->PIN_GPIO19, bit1->PIN_GPIO14, bit2->PIN_GPIO11, bit3->PIN_GPIO9
    unsigned char bits_number[4] = {0, 0, 0, 0};
    unsigned short number = 0;
    
    for (unsigned char i=0; i < sizeof(bits_number); i++)
        gpio_init(LED_BIT_N[i]);
    
   for (unsigned char i=0; i < sizeof(bits_number); i++)
        gpio_set_dir(LED_BIT_N[i], GPIO_OUT);

    while (true) {
        switch (number) {
            case 0:
		        sleep_ms(SLEEP_TIME_MS);
		        number++;
            break;
            
            default:
                for (unsigned char i=0; i < sizeof(bits_number); i++)
                    bits_number[i] = number & (1 << i) ? 1 : 0;
                for (unsigned char i=0; i < sizeof(bits_number); i++)
                    gpio_put(LED_BIT_N[i], bits_number[i]);
                sleep_ms(SLEEP_TIME_MS);
		        for (unsigned char i=0; i < sizeof(bits_number); i++)
        		    gpio_put(LED_BIT_N[i], 0);
		        sleep_ms(SLEEP_TIME_MS);
        		number++;
            break;
            
            case 256:
                number = 0;
                sleep_ms(SLEEP_TIME_MS);
            break;
        }
   }
}
