#include "stm8s.h"


#define NUM_LEDS 8
#define NUM_LEDS_HALF 4
#define NUM_COLOURS 3

#define CW 1
#define CCW -1

#define MAX_BRIGHTNESS 30  // out of 256


volatile int8_t dir = CW;
volatile bool change = FALSE;


void delay_ms_HS(uint16_t ms)
{
	uint16_t ms_count;
	for (ms_count = 0; ms_count < ms; ++ms_count) {
		uint16_t ticks;
		for (ticks = 0; ticks < 1074; ++ticks) {
			nop();
		}
	}
}

void delay_ms(uint16_t ms)
{
	uint16_t ms_count;
	
	uint16_t targ = ms * 0.4;
	
	for (ms_count = 0; ms_count < targ; ++ms_count) {
		nop();
	}
}

/*static int8_t sine[] = {0,0,0,0,1,1,1,2,2,3,4,5,6,6,7,9,10,11,12,14,15,17,18,20,22,23,25,27,29,31,33,35,37,40,42,44,47,49,52,54,57,60,62,65,68,70,73,76,79,82,85,88,91,94,97,100,103,106,109,112,115,119,122,125,128,131,134,137,141,144,147,150,153,156,159,162,165,168,171,174,177,180,183,186,188,191,194,196,199,202,204,207,209,212,214,216,219,221,223,225,227,229,231,233,234,236,238,239,241,242,244,245,246,247,249,250,250,251,252,253,254,254,255,255,255,256,256,256,256,256,256,256,255,255,255,254,254,253,252,251,250,250,249,247,246,245,244,242,241,239,238,236,234,233,231,229,227,225,223,221,219,216,214,212,209,207,204,202,199,196,194,191,188,186,183,180,177,174,171,168,165,162,159,156,153,150,147,144,141,137,134,131,128,125,122,119,115,112,109,106,103,100,97,94,91,88,85,82,79,76,73,70,68,65,62,60,57,54,52,49,47,44,42,40,37,35,33,31,29,27,25,23,22,20,18,17,15,14,12,11,10,9,7,6,6,5,4,3,2,2,1,1,1,0,0,0};*/

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
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); //2MHz
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); // 15.625kHz

	for (i = 0; i < 3*NUM_LEDS_HALF; ++i) {
		ws_write_grb_top(lights[i]);
	}
	
	for (i = 0; i < 3*NUM_LEDS_HALF; ++i) {
		ws_write_grb_bot(lights[NUM_LEDS-i-1]);
	}
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8); //2MHz
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV128); // 15.625kHz
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
	uint8_t press = 0;

	change = FALSE;
	while (!change) {
		clear_lights();
		lights[i][j] = MAX_BRIGHTNESS;
		write_display(lights);
					
		i += dir;
		i = (i==-1) ? NUM_LEDS-1 : i;
		i %= NUM_LEDS;
		
		if(i==0){
			j += 1;
			j %= NUM_COLOURS;
		} 
		delay_ms(125);
	}
}

uint8_t linearSine(uint8_t val){
	val %= 256;
	if(val < 128){
		return(val);
	} else if (val > 128){
		return(256 - val);
	}
}	

void rainbowFade(void)
{
	uint8_t hue = 0;
	uint8_t red = 0;
	uint8_t green = 0;
	uint8_t blue = 0;
	float scale = MAX_BRIGHTNESS*1.0/256;


	change = FALSE;
	while(!change){
		
		colour[0] = linearSine(hue)*scale;
		colour[1] = linearSine(hue-128)*scale;
		colour[2] = linearSine(hue+128)*scale;
		
		clear_lights();
		setAllSameColour(colour); 
		write_display(lights);
		
		hue += 5;
		
		delay_ms(50);
	}
}

void init_tim2(void){
	
	TIM2->PSCR |= 0x0E; // set prescaler to 16384 ~ 1kHz
	TIM2->ARRH = 0x13;
	TIM2->ARRL = 0x88; 
	TIM2->IER |= 0x1; // generate interrupt
	
}

int main(void) {
	// Initialize system clock
	
	sim();
	CLK_DeInit();
	CLK_HSECmd(DISABLE);
	CLK_HSICmd(ENABLE);
	//CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	//CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
	
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8); //2MHz
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV128); // 15.625kHz

	// Initialize GPIO for pin D4
	GPIO_DeInit(GPIOA);
	GPIO_Init(GPIOA, GPIO_PIN_1, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(GPIOA, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
	
	GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_IN_FL_IT);
	EXTI->CR1 &= ~(1 << 3);
	EXTI->CR1 |= (1 << 2);
	
// Initialise lights array
	clear_lights();
	
	init_tim2();
			
	//TIM2->CR1 |= 0x1; // enable counter
	
	rim();

	while(1){
		dir = CW;
		RGBSpin();
		
		dir = CCW;
		RGBSpin();
		
		rainbowFade();
	}
	
    
}

@far @interrupt void buttonHandler(void)
{
	//dir = (dir==CW) ? CCW : CW;
	//halt();
	change = TRUE;
	
}

@far @interrupt void tim2Handler(void)
{
	TIM2->SR1 &= ~0x01; // clear status register
	//TIM2->CR1 &= ~0x01; // disable counter
	
	clear_lights();
	write_display(lights);
	
	halt();
	
}