/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */


#include "stm8s_gpio.h"


void delay(void)
{
	for(i=10000;i>0;i--);
}


main()
{
	GPIO_Init(GPIO_B, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
	while (1)
	{
		GPIO_WriteReverse(GPIOB, GPIO_Pin_4);
	}
}