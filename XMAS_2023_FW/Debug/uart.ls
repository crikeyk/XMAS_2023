   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  42                     ; 3 void uart_init() {
  44                     	switch	.text
  45  0000               _uart_init:
  49                     ; 5   UART1->BRR2 = 0x0B;
  51  0000 350b5233      	mov	21043,#11
  52                     ; 6   UART1->BRR1 = 0x08;
  54  0004 35085232      	mov	21042,#8
  55                     ; 13   UART1->CR2 |= UART1_CR2_TEN;
  57  0008 72165235      	bset	21045,#3
  58                     ; 14 }
  61  000c 81            	ret
  95                     ; 16 void putchar(int c) {
  96                     	switch	.text
  97  000d               _putchar:
  99  000d 89            	pushw	x
 100       00000000      OFST:	set	0
 103  000e               L14:
 104                     ; 18     while ((UART1->SR & UART1_SR_TXE) == 0);
 106  000e c65230        	ld	a,21040
 107  0011 a580          	bcp	a,#128
 108  0013 27f9          	jreq	L14
 109                     ; 21     UART1->DR = c;
 111  0015 7b02          	ld	a,(OFST+2,sp)
 112  0017 c75231        	ld	21041,a
 113                     ; 22 }
 116  001a 85            	popw	x
 117  001b 81            	ret
 130                     	xdef	_putchar
 131                     	xdef	_uart_init
 150                     	end
