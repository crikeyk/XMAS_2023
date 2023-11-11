/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include "stm8s.h"
#include "stm8s_gpio.h"
#include "clock.h"
#include "uart.h"
#include "timer.h"
#include "ws2812.h"


void main() {
	
	u16 hue;
	u8 index;
	
    clock_init();
    ws2812_init();
		
		hue = 0;
    index = 0;

    // Trigger GPIO
    GPIOA->DDR |= (1 << 1);
    GPIOA->CR1 |= (1 << 1);
    GPIOA->CR2 |= (1 << 1);


    while (1) {
        GPIOA->ODR ^= (1 << 1);
        ws2812_set_color_hsl((u8)(index - 3) % 28, 0, 0, 0);
        ws2812_set_color_hsl(index, hue, 255, 50);
        hue++;
        index++;
        if (hue > 767) {
            hue = 0;
        }
        if (index > 28) {
            index = 0;
        }
        ws2812_write_frame();
        delay(150);
    }
}