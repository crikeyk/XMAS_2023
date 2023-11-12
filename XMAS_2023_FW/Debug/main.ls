   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  63                     ; 7 void delay_ms(uint16_t ms) {
  65                     	switch	.text
  66  0000               _delay_ms:
  68  0000 89            	pushw	x
  69  0001 89            	pushw	x
  70       00000002      OFST:	set	2
  73  0002 2011          	jra	L53
  74  0004               L33:
  75                     ; 11         for (i = 2000; i != 0; --i) {
  77  0004 ae07d0        	ldw	x,#2000
  78  0007 1f01          	ldw	(OFST-1,sp),x
  80  0009               L14:
  81                     ; 12             _asm("nop"); // Perform a no-operation to introduce a delay
  84  0009 9d            nop
  86                     ; 11         for (i = 2000; i != 0; --i) {
  88  000a 1e01          	ldw	x,(OFST-1,sp)
  89  000c 1d0001        	subw	x,#1
  90  000f 1f01          	ldw	(OFST-1,sp),x
  94  0011 1e01          	ldw	x,(OFST-1,sp)
  95  0013 26f4          	jrne	L14
  96  0015               L53:
  97                     ; 8     while (ms--) {
  99  0015 1e03          	ldw	x,(OFST+1,sp)
 100  0017 1d0001        	subw	x,#1
 101  001a 1f03          	ldw	(OFST+1,sp),x
 102  001c 1c0001        	addw	x,#1
 103  001f a30000        	cpw	x,#0
 104  0022 26e0          	jrne	L33
 105                     ; 15 }
 108  0024 5b04          	addw	sp,#4
 109  0026 81            	ret
 154                     ; 17 void ws_write_byte(uint8_t byte)
 154                     ; 18 {
 155                     	switch	.text
 156  0027               _ws_write_byte:
 158  0027 88            	push	a
 159  0028 88            	push	a
 160       00000001      OFST:	set	1
 163                     ; 20     for (mask = 0x80; mask != 0; mask >>= 1) {
 165  0029 a680          	ld	a,#128
 166  002b 6b01          	ld	(OFST+0,sp),a
 168  002d               L17:
 169                     ; 21         if ((byte & mask) != 0) {
 171  002d 7b02          	ld	a,(OFST+1,sp)
 172  002f 1501          	bcp	a,(OFST+0,sp)
 173  0031 2716          	jreq	L77
 174                     ; 23             _asm("bset 20480, #4");
 177  0033 72185000      bset 20480, #4
 179                     ; 26             nop(); nop(); nop(); nop();
 182  0037 9d            nop
 188  0038 9d            nop
 194  0039 9d            nop
 200  003a 9d            nop
 202                     ; 27             nop(); nop(); nop(); nop();
 206  003b 9d            nop
 212  003c 9d            nop
 218  003d 9d            nop
 224  003e 9d            nop
 226                     ; 30             _asm("bres 20480, #4");
 230  003f 72195000      bres 20480, #4
 232                     ; 33             nop(); nop(); nop(); nop();
 235  0043 9d            nop
 241  0044 9d            nop
 247  0045 9d            nop
 253  0046 9d            nop
 257  0047 2012          	jra	L101
 258  0049               L77:
 259                     ; 37             _asm("bset 20480, #4");
 262  0049 72185000      bset 20480, #4
 264                     ; 40             nop(); nop(); nop(); nop();
 267  004d 9d            nop
 273  004e 9d            nop
 279  004f 9d            nop
 285  0050 9d            nop
 287                     ; 41             nop(); nop();
 291  0051 9d            nop
 297  0052 9d            nop
 299                     ; 44             _asm("bres 20480, #4");
 303  0053 72195000      bres 20480, #4
 305                     ; 47             nop(); nop(); nop(); nop();
 308  0057 9d            nop
 314  0058 9d            nop
 320  0059 9d            nop
 326  005a 9d            nop
 328  005b               L101:
 329                     ; 20     for (mask = 0x80; mask != 0; mask >>= 1) {
 331  005b 0401          	srl	(OFST+0,sp)
 335  005d 0d01          	tnz	(OFST+0,sp)
 336  005f 26cc          	jrne	L17
 337                     ; 51 }
 340  0061 85            	popw	x
 341  0062 81            	ret
 372                     ; 53 int main(void) {
 373                     	switch	.text
 374  0063               _main:
 378                     ; 55     CLK_DeInit();
 380  0063 cd0000        	call	_CLK_DeInit
 382                     ; 56     CLK_HSECmd(DISABLE);
 384  0066 4f            	clr	a
 385  0067 cd0000        	call	_CLK_HSECmd
 387                     ; 57     CLK_HSICmd(ENABLE);
 389  006a a601          	ld	a,#1
 390  006c cd0000        	call	_CLK_HSICmd
 392                     ; 58     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);
 394  006f a618          	ld	a,#24
 395  0071 cd0000        	call	_CLK_HSIPrescalerConfig
 397                     ; 59     CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 399  0074 a680          	ld	a,#128
 400  0076 cd0000        	call	_CLK_SYSCLKConfig
 402                     ; 62     GPIO_DeInit(GPIOA);
 404  0079 ae5000        	ldw	x,#20480
 405  007c cd0000        	call	_GPIO_DeInit
 407                     ; 63     GPIO_Init(GPIOA, GPIO_PIN_1, GPIO_MODE_OUT_PP_LOW_FAST);
 409  007f 4be0          	push	#224
 410  0081 4b02          	push	#2
 411  0083 ae5000        	ldw	x,#20480
 412  0086 cd0000        	call	_GPIO_Init
 414  0089 85            	popw	x
 415                     ; 64 		GPIO_Init(GPIOA, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 417  008a 4be0          	push	#224
 418  008c 4b04          	push	#4
 419  008e ae5000        	ldw	x,#20480
 420  0091 cd0000        	call	_GPIO_Init
 422  0094 85            	popw	x
 423  0095               L311:
 424                     ; 73 				ws_write_byte(0xAA);
 426  0095 a6aa          	ld	a,#170
 427  0097 ad8e          	call	_ws_write_byte
 429                     ; 74 				ws_write_byte(0x00);
 431  0099 4f            	clr	a
 432  009a ad8b          	call	_ws_write_byte
 434                     ; 75 				ws_write_byte(0xAA);
 436  009c a6aa          	ld	a,#170
 437  009e ad87          	call	_ws_write_byte
 440  00a0 20f3          	jra	L311
 453                     	xdef	_main
 454                     	xdef	_ws_write_byte
 455                     	xdef	_delay_ms
 456                     	xref	_GPIO_Init
 457                     	xref	_GPIO_DeInit
 458                     	xref	_CLK_SYSCLKConfig
 459                     	xref	_CLK_HSIPrescalerConfig
 460                     	xref	_CLK_HSICmd
 461                     	xref	_CLK_HSECmd
 462                     	xref	_CLK_DeInit
 481                     	end
