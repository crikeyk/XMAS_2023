   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  14                     	bsct
  15  0000               _time:
  16  0000 00000000      	dc.l	0
  46                     ; 5 INTERRUPT_HANDLER(timer_2_irq, 13) {
  47                     	switch	.text
  48  0000               f_timer_2_irq:
  52                     ; 6     TIM2->SR1 = 0;
  54  0000 725f5304      	clr	21252
  55                     ; 7     time++;
  57  0004 ae0000        	ldw	x,#_time
  58  0007 a601          	ld	a,#1
  59  0009 cd0000        	call	c_lgadc
  61                     ; 8 }
  64  000c 80            	iret
  87                     ; 10 void timer_init() {
  89                     	switch	.text
  90  000d               _timer_init:
  94                     ; 12     TIM2->PSCR = 0b00001010;
  96  000d 350a530e      	mov	21262,#10
  97                     ; 15     TIM2->ARRH = 0x06;
  99  0011 3506530f      	mov	21263,#6
 100                     ; 16     TIM2->ARRL = 0x1A;
 102  0015 351a5310      	mov	21264,#26
 103                     ; 19     TIM2->IER = 0b00000001;
 105  0019 35015303      	mov	21251,#1
 106                     ; 22     TIM2->CR1 |= 0b00000001;
 108  001d 72105300      	bset	21248,#0
 109                     ; 24     enableInterrupts();
 112  0021 9a            rim
 114                     ; 25 }
 118  0022 81            	ret
 142                     .const:	section	.text
 143  0000               L21:
 144  0000 0000000a      	dc.l	10
 145                     ; 27 u32 timer_read() {
 146                     	switch	.text
 147  0023               _timer_read:
 151                     ; 28     return time / 10;
 153  0023 ae0000        	ldw	x,#_time
 154  0026 cd0000        	call	c_ltor
 156  0029 ae0000        	ldw	x,#L21
 157  002c cd0000        	call	c_ludv
 161  002f 81            	ret
 185                     ; 31 u32 timer_read_100ms() {
 186                     	switch	.text
 187  0030               _timer_read_100ms:
 191                     ; 32     return time;
 193  0030 ae0000        	ldw	x,#_time
 194  0033 cd0000        	call	c_ltor
 198  0036 81            	ret
 222                     	xdef	_time
 223                     	xdef	_timer_read_100ms
 224                     	xdef	_timer_read
 225                     	xdef	_timer_init
 226                     	xdef	f_timer_2_irq
 227                     	xref.b	c_x
 246                     	xref	c_ludv
 247                     	xref	c_ltor
 248                     	xref	c_lgadc
 249                     	end
