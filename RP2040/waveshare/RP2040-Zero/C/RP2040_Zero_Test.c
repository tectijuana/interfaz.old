#include <stdio.h>
#include <stdlib.h>

#include "pico/stdlib.h"
#include "hardware/pio.h"
#include "hardware/clocks.h"
#include "ws2812.pio.h"

void put_pixel(uint32_t pixel_grb)
{
    pio_sm_put_blocking(pio0, 0, pixel_grb << 8u);
}
void put_rgb(uint8_t red, uint8_t green, uint8_t blue)
{
    uint32_t mask = (green << 16) | (red << 8) | (blue << 0);
    put_pixel(mask);
}

int main()
{
    //set_sys_clock_48();
    stdio_init_all();

    PIO pio = pio0;
    int sm = 0;
    uint offset = pio_add_program(pio, &ws2812_program);
    uint8_t cnt = 0;

    puts("RP2040-Zero WS2812 Test");

    ws2812_program_init(pio, sm, offset, 16, 800000, true);

    while (1)
    {
        for (cnt = 0; cnt < 0xff; cnt++)
        {
            put_rgb(cnt, 0xff - cnt, 0);
            sleep_ms(3);
        }
        for (cnt = 0; cnt < 0xff; cnt++)
        {
            put_rgb(0xff - cnt, 0, cnt);
            sleep_ms(3);
        }
        for (cnt = 0; cnt < 0xff; cnt++)
        {
            put_rgb(0, cnt, 0xff - cnt);
            sleep_ms(3);
        }
    }
}