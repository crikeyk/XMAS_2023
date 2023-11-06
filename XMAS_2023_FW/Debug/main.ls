   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  53                     ; 10 void delay(void)
  53                     ; 11 {
  55                     	switch	.text
  56  0000               _delay:
  58  0000 5204          	subw	sp,#4
  59       00000004      OFST:	set	4
  62                     ; 13 	for(i=10000;i>0;i--);
  64  0002 ae2710        	ldw	x,#10000
  65  0005 1f03          	ldw	(OFST-1,sp),x
  66  0007 ae0000        	ldw	x,#0
  67  000a 1f01          	ldw	(OFST-3,sp),x
  69  000c               L72:
  73  000c 96            	ldw	x,sp
  74  000d 1c0001        	addw	x,#OFST-3
  75  0010 a601          	ld	a,#1
  76  0012 cd0000        	call	c_lgsbc
  81  0015 96            	ldw	x,sp
  82  0016 1c0001        	addw	x,#OFST-3
  83  0019 cd0000        	call	c_lzmp
  85  001c 26ee          	jrne	L72
  86                     ; 14 }
  89  001e 5b04          	addw	sp,#4
  90  0020 81            	ret
 115                     ; 17 main()
 115                     ; 18 {
 116                     	switch	.text
 117  0021               _main:
 121                     ; 19 	GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
 123  0021 4be0          	push	#224
 124  0023 4b10          	push	#16
 125  0025 ae5005        	ldw	x,#20485
 126  0028 cd0000        	call	_GPIO_Init
 128  002b 85            	popw	x
 129  002c               L54:
 130                     ; 22 		GPIO_WriteReverse(GPIOB, GPIO_PIN_4);
 132  002c 4b10          	push	#16
 133  002e ae5005        	ldw	x,#20485
 134  0031 cd0000        	call	_GPIO_WriteReverse
 136  0034 84            	pop	a
 138  0035 20f5          	jra	L54
 151                     	xdef	_main
 152                     	xdef	_delay
 153                     	xref	_GPIO_WriteReverse
 154                     	xref	_GPIO_Init
 173                     	xref	c_lzmp
 174                     	xref	c_lgsbc
 175                     	end
