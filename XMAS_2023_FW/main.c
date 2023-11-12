/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include "stm8s.h"
void delay_ms(uint16_t ms) {
    while (ms--) {
        // Assuming a 16 MHz clock
				uint16_t i;
        for (i = 2000; i != 0; --i) {
            _asm("nop"); // Perform a no-operation to introduce a delay
        }
    }
}

void ws_write_byte(uint8_t byte)
{
	uint8_t mask;
    for (mask = 0x80; mask != 0; mask >>= 1) {
        if ((byte & mask) != 0) {
            // Set pin high
            _asm("bset 20480, #4");

            // Delay for 850ns minus overheads
            nop(); nop(); nop(); nop();
            nop(); nop(); nop(); nop();

            // Set pin low
            _asm("bres 20480, #4");

            // Delay 400ns minus overhead
            nop(); nop(); nop(); nop();

        } else {
            // Set pin high
            _asm("bset 20480, #4");

            // Delay for 400ns minus overheads
            nop(); nop(); nop(); nop();
            nop(); nop();

            // Set pin low
            _asm("bres 20480, #4");

            // Delay for 850ns minus overheads
            nop(); nop(); nop(); nop();

        }
    }
}

int main(void) {
    // Initialize system clock
    CLK_DeInit();
    CLK_HSECmd(DISABLE);
    CLK_HSICmd(ENABLE);
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);
    CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);

    // Initialize GPIO for pin D4
    GPIO_DeInit(GPIOA);
    GPIO_Init(GPIOA, GPIO_PIN_1, GPIO_MODE_OUT_PP_LOW_FAST);
		GPIO_Init(GPIOA, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);

    while (1) {
        //GPIO_WriteReverse(GPIOA, GPIO_PIN_1);
				//GPIO_WriteReverse(GPIOA, GPIO_PIN_2);

        //nop(); nop(); nop(); nop();
				//nop(); nop(); nop(); nop();
				
				ws_write_byte(0xAA);
				ws_write_byte(0x00);
				ws_write_byte(0xAA);
				
    }
}