/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include "stm8s.h"
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>


#define NUM_LEDS 8
#define NUM_LEDS_HALF 4
#define NUM_COLOURS 3


void delay_ms(uint16_t ms)
{
	uint16_t ms_count;
	for (ms_count = 0; ms_count < ms; ++ms_count) {
		uint16_t ticks;
		for (ticks = 0; ticks < 1074; ++ticks) {
			nop();
		}
	}
}


void ws_write_byte_top(uint8_t byte)
{
	uint8_t mask;
    for (mask = 0x80; mask != 0; mask >>= 1) {
        if ((byte & mask) != 0) {
            // Set pin high
            _asm("bset 20480, #1");

            // Delay for 850ns
            nop(); nop(); nop(); nop();
            nop(); nop(); nop(); nop();
						nop(); nop(); nop(); nop();

            // Set pin low
            _asm("bres 20480, #1");

            // Delay 400ns
            //nop(); nop();

        } else {
            // Set pin high
            _asm("bset 20480, #1");

            // Delay for 400ns
            nop(); nop(); nop(); nop();
						nop(); nop();
						
            // Set pin low
            _asm("bres 20480, #1");

            // Delay for 850ns
            nop(); nop(); nop();

        }
    }
}
void ws_write_byte_bot(uint8_t byte)
{
	uint8_t mask;
    for (mask = 0x80; mask != 0; mask >>= 1) {
        if ((byte & mask) != 0) {
            // Set pin high
            _asm("bset 20480, #2");

            // Delay for 850ns
            nop(); nop(); nop(); nop();
            nop(); nop(); nop(); nop();
						nop(); nop(); nop(); nop();

            // Set pin low
            _asm("bres 20480, #2");

            // Delay 400ns
            //nop(); nop();

        } else {
            // Set pin high
            _asm("bset 20480, #2");

            // Delay for 400ns
            nop(); nop(); nop(); nop();
						nop(); nop();
						
            // Set pin low
            _asm("bres 20480, #2");

            // Delay for 850ns
            nop(); nop(); nop();

        }
    }
}

void ws_write_grb_top(uint8_t* colour)
{
	uint8_t i;
    for (i = 0; i < 3; ++i) {
        ws_write_byte_top(colour[i]);
    }
}

void ws_write_grb_bot(uint8_t* colour)
{
	uint8_t i;
    for (i = 0; i < 3; ++i) {
        ws_write_byte_bot(colour[i]);
    }
}

void write_display(uint8_t (*lights)[3])
{
	uint8_t i;
	for (i = 0; i < 3*NUM_LEDS_HALF; ++i) {
		ws_write_grb_top(lights[i]);
	}
	
	for (i = 0; i < 3*NUM_LEDS_HALF; ++i) {
		ws_write_grb_bot(lights[NUM_LEDS-i-1]);
	}
}

static uint8_t lights[NUM_LEDS][3];
static uint8_t colour[] = {0, 0, 50};

int main(void) {
    // Initialize system clock
    CLK_DeInit();
    CLK_HSECmd(DISABLE);
    CLK_HSICmd(ENABLE);
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
    CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);

    // Initialize GPIO for pin D4
    GPIO_DeInit(GPIOA);
    GPIO_Init(GPIOA, GPIO_PIN_1, GPIO_MODE_OUT_PP_LOW_FAST);
		GPIO_Init(GPIOA, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
	
	// Initialise lights array
    memset(lights, 0, sizeof(lights));

    while (1) {
			
			uint8_t j;
			for (j = 0; j < NUM_COLOURS; ++j) {
				uint8_t i;
				for (i = 0; i < NUM_LEDS; ++i) {
					memset(lights, 0, sizeof(lights));
					lights[i][j] = 20;
					write_display(lights);
					delay_ms(100);
					lights[i][j] = 0;
				}
		 }
    }
}