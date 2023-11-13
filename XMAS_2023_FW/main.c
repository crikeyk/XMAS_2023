#include "stm8s.h"


#define NUM_LEDS 8
#define NUM_LEDS_HALF 4
#define NUM_COLOURS 3

#define CW 1
#define CCW -1

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

static uint8_t lights[NUM_LEDS][3];
static uint8_t colour[] = {0, 0, 0};

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

void clear_lights(void)
{
	uint8_t j;
		for (j = 0; j < NUM_COLOURS; ++j) {
			uint8_t i;
			for (i = 0; i < NUM_LEDS; ++i) {
				lights[i][j] = 0;
			}
	 }
}

void setAllSameColour(uint8_t* colour){
	uint8_t i;
		for (i = 0; i < NUM_LEDS; ++i) {
			uint8_t j;
			for (j = 0; j < NUM_COLOURS; ++j) {
				lights[i][j] = colour[j];
			}
	 }
}

void RGBSpin(void)
{
	
	int8_t j = 0;
	int8_t i = 0;
	int8_t dir = CW;
	uint8_t press = 0;
	
	while (1) {
		clear_lights();
		lights[i][j] = 20;
		write_display(lights);
					
		i += dir;
		i = (i==-1) ? NUM_LEDS-1 : i;
		i %= NUM_LEDS;
		
		if(i==0){
			j += 1;
			j %= NUM_COLOURS;
		}
		
		delay_ms(50);
		press = GPIO_ReadInputPin(GPIOB, GPIO_PIN_4);
		delay_ms(50);
		if(GPIO_ReadInputPin(GPIOB, GPIO_PIN_4) && press){
			dir = (dir==CW) ? CCW : CW;
		}
		press = 0;
	}
}

void rainbowFade(void)
{
	uint8_t hue = 0;
	uint8_t red = 0;
	uint8_t green = 0;
	uint8_t blue = 0;
	while(1){
		
		colour[0] = hue;
		colour[1] = hue+128;
		colour[2] = hue-128;
		
		clear_lights();
		setAllSameColour(colour); 
		write_display(lights);
		
		hue++;
		
		delay_ms(50);

	}
	
}



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
	
	GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);

// Initialise lights array
	clear_lights();

	while(1){
		rainbowFade();
	}
	
    
}