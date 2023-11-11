   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  67                     ; 14 void main() {
  69                     	switch	.text
  70  0000               _main:
  72  0000 5203          	subw	sp,#3
  73       00000003      OFST:	set	3
  76                     ; 19     clock_init();
  78  0002 cd0000        	call	_clock_init
  80                     ; 20     ws2812_init();
  82  0005 cd0000        	call	_ws2812_init
  84                     ; 22 		hue = 0;
  86  0008 5f            	clrw	x
  87  0009 1f01          	ldw	(OFST-2,sp),x
  89                     ; 23     index = 0;
  91  000b 0f03          	clr	(OFST+0,sp)
  93                     ; 26     GPIOA->DDR |= (1 << 1);
  95  000d 72125002      	bset	20482,#1
  96                     ; 27     GPIOA->CR1 |= (1 << 1);
  98  0011 72125003      	bset	20483,#1
  99                     ; 28     GPIOA->CR2 |= (1 << 1);
 101  0015 72125004      	bset	20484,#1
 102  0019               L33:
 103                     ; 32         GPIOA->ODR ^= (1 << 1);
 105  0019 90125000      	bcpl	20480,#1
 106                     ; 33         ws2812_set_color_hsl((u8)(index - 3) % 28, 0, 0, 0);
 108  001d 4b00          	push	#0
 109  001f 4b00          	push	#0
 110  0021 5f            	clrw	x
 111  0022 89            	pushw	x
 112  0023 7b07          	ld	a,(OFST+4,sp)
 113  0025 a003          	sub	a,#3
 114  0027 5f            	clrw	x
 115  0028 97            	ld	xl,a
 116  0029 a61c          	ld	a,#28
 117  002b 62            	div	x,a
 118  002c 5f            	clrw	x
 119  002d 97            	ld	xl,a
 120  002e 9f            	ld	a,xl
 121  002f cd0000        	call	_ws2812_set_color_hsl
 123  0032 5b04          	addw	sp,#4
 124                     ; 34         ws2812_set_color_hsl(index, hue, 255, 50);
 126  0034 4b32          	push	#50
 127  0036 4bff          	push	#255
 128  0038 1e03          	ldw	x,(OFST+0,sp)
 129  003a 89            	pushw	x
 130  003b 7b07          	ld	a,(OFST+4,sp)
 131  003d cd0000        	call	_ws2812_set_color_hsl
 133  0040 5b04          	addw	sp,#4
 134                     ; 35         hue++;
 136  0042 1e01          	ldw	x,(OFST-2,sp)
 137  0044 1c0001        	addw	x,#1
 138  0047 1f01          	ldw	(OFST-2,sp),x
 140                     ; 36         index++;
 142  0049 0c03          	inc	(OFST+0,sp)
 144                     ; 37         if (hue > 767) {
 146  004b 1e01          	ldw	x,(OFST-2,sp)
 147  004d a30300        	cpw	x,#768
 148  0050 2503          	jrult	L73
 149                     ; 38             hue = 0;
 151  0052 5f            	clrw	x
 152  0053 1f01          	ldw	(OFST-2,sp),x
 154  0055               L73:
 155                     ; 40         if (index > 28) {
 157  0055 7b03          	ld	a,(OFST+0,sp)
 158  0057 a11d          	cp	a,#29
 159  0059 2502          	jrult	L14
 160                     ; 41             index = 0;
 162  005b 0f03          	clr	(OFST+0,sp)
 164  005d               L14:
 165                     ; 43         ws2812_write_frame();
 167  005d cd0000        	call	_ws2812_write_frame
 169                     ; 44         delay(150);
 171  0060 ae0096        	ldw	x,#150
 172  0063 89            	pushw	x
 173  0064 ae0000        	ldw	x,#0
 174  0067 89            	pushw	x
 175  0068 cd0000        	call	_delay
 177  006b 5b04          	addw	sp,#4
 179  006d 20aa          	jra	L33
 192                     	xdef	_main
 193                     	xref	_ws2812_write_frame
 194                     	xref	_ws2812_set_color_hsl
 195                     	xref	_ws2812_init
 196                     	xref	_delay
 197                     	xref	_clock_init
 216                     	end
