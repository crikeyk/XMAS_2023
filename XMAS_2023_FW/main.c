/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */


#include "stm8s_gpio.h"


void delay(void)
{
	unsigned long i;
	for(i=10000;i>0;i--);
}


main()
{
	GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
	while (1)
	{
		GPIO_WriteReverse(GPIOB, GPIO_PIN_4);
	}
}