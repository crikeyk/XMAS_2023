   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  43                     ; 53 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  43                     ; 54 {
  44                     	switch	.text
  45  0000               f_NonHandledInterrupt:
  49                     ; 58 }
  52  0000 80            	iret
  74                     ; 66 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  74                     ; 67 {
  75                     	switch	.text
  76  0001               f_TRAP_IRQHandler:
  80                     ; 71 }
  83  0001 80            	iret
 105                     ; 78 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 105                     ; 79 
 105                     ; 80 {
 106                     	switch	.text
 107  0002               f_TLI_IRQHandler:
 111                     ; 84 }
 114  0002 80            	iret
 136                     ; 91 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 136                     ; 92 {
 137                     	switch	.text
 138  0003               f_AWU_IRQHandler:
 142                     ; 96 }
 145  0003 80            	iret
 167                     ; 103 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 167                     ; 104 {
 168                     	switch	.text
 169  0004               f_CLK_IRQHandler:
 173                     ; 108 }
 176  0004 80            	iret
 199                     ; 115 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 199                     ; 116 {
 200                     	switch	.text
 201  0005               f_EXTI_PORTA_IRQHandler:
 205                     ; 120 }
 208  0005 80            	iret
 231                     ; 127 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 231                     ; 128 {
 232                     	switch	.text
 233  0006               f_EXTI_PORTB_IRQHandler:
 237                     ; 132 }
 240  0006 80            	iret
 263                     ; 139 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 263                     ; 140 {
 264                     	switch	.text
 265  0007               f_EXTI_PORTC_IRQHandler:
 269                     ; 144 }
 272  0007 80            	iret
 295                     ; 151 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 295                     ; 152 {
 296                     	switch	.text
 297  0008               f_EXTI_PORTD_IRQHandler:
 301                     ; 156 }
 304  0008 80            	iret
 327                     ; 163 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 327                     ; 164 {
 328                     	switch	.text
 329  0009               f_EXTI_PORTE_IRQHandler:
 333                     ; 168 }
 336  0009 80            	iret
 358                     ; 215 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 358                     ; 216 {
 359                     	switch	.text
 360  000a               f_SPI_IRQHandler:
 364                     ; 220 }
 367  000a 80            	iret
 390                     ; 227 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 390                     ; 228 {
 391                     	switch	.text
 392  000b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 396                     ; 232 }
 399  000b 80            	iret
 422                     ; 239 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 422                     ; 240 {
 423                     	switch	.text
 424  000c               f_TIM1_CAP_COM_IRQHandler:
 428                     ; 244 }
 431  000c 80            	iret
 454                     ; 277  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 454                     ; 278  {
 455                     	switch	.text
 456  000d               f_TIM2_UPD_OVF_BRK_IRQHandler:
 460                     ; 282  }
 463  000d 80            	iret
 486                     ; 289  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 486                     ; 290  {
 487                     	switch	.text
 488  000e               f_TIM2_CAP_COM_IRQHandler:
 492                     ; 294  }
 495  000e 80            	iret
 518                     ; 331  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 518                     ; 332  {
 519                     	switch	.text
 520  000f               f_UART1_TX_IRQHandler:
 524                     ; 336  }
 527  000f 80            	iret
 550                     ; 343  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 550                     ; 344  {
 551                     	switch	.text
 552  0010               f_UART1_RX_IRQHandler:
 556                     ; 348  }
 559  0010 80            	iret
 581                     ; 382 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 581                     ; 383 {
 582                     	switch	.text
 583  0011               f_I2C_IRQHandler:
 587                     ; 387 }
 590  0011 80            	iret
 612                     ; 461  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 612                     ; 462  {
 613                     	switch	.text
 614  0012               f_ADC1_IRQHandler:
 618                     ; 466  }
 621  0012 80            	iret
 644                     ; 487  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 644                     ; 488  {
 645                     	switch	.text
 646  0013               f_TIM4_UPD_OVF_IRQHandler:
 650                     ; 492  }
 653  0013 80            	iret
 676                     ; 500 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 676                     ; 501 {
 677                     	switch	.text
 678  0014               f_EEPROM_EEC_IRQHandler:
 682                     ; 505 }
 685  0014 80            	iret
 697                     	xdef	f_EEPROM_EEC_IRQHandler
 698                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 699                     	xdef	f_ADC1_IRQHandler
 700                     	xdef	f_I2C_IRQHandler
 701                     	xdef	f_UART1_RX_IRQHandler
 702                     	xdef	f_UART1_TX_IRQHandler
 703                     	xdef	f_TIM2_CAP_COM_IRQHandler
 704                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 705                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 706                     	xdef	f_TIM1_CAP_COM_IRQHandler
 707                     	xdef	f_SPI_IRQHandler
 708                     	xdef	f_EXTI_PORTE_IRQHandler
 709                     	xdef	f_EXTI_PORTD_IRQHandler
 710                     	xdef	f_EXTI_PORTC_IRQHandler
 711                     	xdef	f_EXTI_PORTB_IRQHandler
 712                     	xdef	f_EXTI_PORTA_IRQHandler
 713                     	xdef	f_CLK_IRQHandler
 714                     	xdef	f_AWU_IRQHandler
 715                     	xdef	f_TLI_IRQHandler
 716                     	xdef	f_TRAP_IRQHandler
 717                     	xdef	f_NonHandledInterrupt
 736                     	end
