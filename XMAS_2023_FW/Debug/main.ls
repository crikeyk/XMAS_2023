   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  72                     ; 17 void delay_ms(uint16_t ms)
  72                     ; 18 {
  74                     	switch	.text
  75  0000               _delay_ms:
  77  0000 89            	pushw	x
  78  0001 5204          	subw	sp,#4
  79       00000004      OFST:	set	4
  82                     ; 20 	for (ms_count = 0; ms_count < ms; ++ms_count) {
  84  0003 5f            	clrw	x
  85  0004 1f03          	ldw	(OFST-1,sp),x
  88  0006 2019          	jra	L34
  89  0008               L73:
  90                     ; 22 		for (ticks = 0; ticks < 1074; ++ticks) {
  92  0008 5f            	clrw	x
  93  0009 1f01          	ldw	(OFST-3,sp),x
  95  000b               L74:
  96                     ; 23 			nop();
  99  000b 9d            nop
 101                     ; 22 		for (ticks = 0; ticks < 1074; ++ticks) {
 104  000c 1e01          	ldw	x,(OFST-3,sp)
 105  000e 1c0001        	addw	x,#1
 106  0011 1f01          	ldw	(OFST-3,sp),x
 110  0013 1e01          	ldw	x,(OFST-3,sp)
 111  0015 a30432        	cpw	x,#1074
 112  0018 25f1          	jrult	L74
 113                     ; 20 	for (ms_count = 0; ms_count < ms; ++ms_count) {
 115  001a 1e03          	ldw	x,(OFST-1,sp)
 116  001c 1c0001        	addw	x,#1
 117  001f 1f03          	ldw	(OFST-1,sp),x
 119  0021               L34:
 122  0021 1e03          	ldw	x,(OFST-1,sp)
 123  0023 1305          	cpw	x,(OFST+1,sp)
 124  0025 25e1          	jrult	L73
 125                     ; 26 }
 128  0027 5b06          	addw	sp,#6
 129  0029 81            	ret
 174                     ; 29 void ws_write_byte_top(uint8_t byte)
 174                     ; 30 {
 175                     	switch	.text
 176  002a               _ws_write_byte_top:
 178  002a 88            	push	a
 179  002b 88            	push	a
 180       00000001      OFST:	set	1
 183                     ; 32     for (mask = 0x80; mask != 0; mask >>= 1) {
 185  002c a680          	ld	a,#128
 186  002e 6b01          	ld	(OFST+0,sp),a
 188  0030               L77:
 189                     ; 33         if ((byte & mask) != 0) {
 191  0030 7b02          	ld	a,(OFST+1,sp)
 192  0032 1501          	bcp	a,(OFST+0,sp)
 193  0034 2716          	jreq	L501
 194                     ; 35             _asm("bset 20480, #1");
 197  0036 72125000      bset 20480, #1
 199                     ; 38             nop(); nop(); nop(); nop();
 202  003a 9d            nop
 208  003b 9d            nop
 214  003c 9d            nop
 220  003d 9d            nop
 222                     ; 39             nop(); nop(); nop(); nop();
 226  003e 9d            nop
 232  003f 9d            nop
 238  0040 9d            nop
 244  0041 9d            nop
 246                     ; 40 						nop(); nop(); nop(); nop();
 250  0042 9d            nop
 256  0043 9d            nop
 262  0044 9d            nop
 268  0045 9d            nop
 270                     ; 43             _asm("bres 20480, #1");
 274  0046 72135000      bres 20480, #1
 277  004a 2011          	jra	L701
 278  004c               L501:
 279                     ; 50             _asm("bset 20480, #1");
 282  004c 72125000      bset 20480, #1
 284                     ; 53             nop(); nop(); nop(); nop();
 287  0050 9d            nop
 293  0051 9d            nop
 299  0052 9d            nop
 305  0053 9d            nop
 307                     ; 54 						nop(); nop();
 311  0054 9d            nop
 317  0055 9d            nop
 319                     ; 57             _asm("bres 20480, #1");
 323  0056 72135000      bres 20480, #1
 325                     ; 60             nop(); nop(); nop();
 328  005a 9d            nop
 334  005b 9d            nop
 340  005c 9d            nop
 342  005d               L701:
 343                     ; 32     for (mask = 0x80; mask != 0; mask >>= 1) {
 345  005d 0401          	srl	(OFST+0,sp)
 349  005f 0d01          	tnz	(OFST+0,sp)
 350  0061 26cd          	jrne	L77
 351                     ; 64 }
 354  0063 85            	popw	x
 355  0064 81            	ret
 400                     ; 65 void ws_write_byte_bot(uint8_t byte)
 400                     ; 66 {
 401                     	switch	.text
 402  0065               _ws_write_byte_bot:
 404  0065 88            	push	a
 405  0066 88            	push	a
 406       00000001      OFST:	set	1
 409                     ; 68     for (mask = 0x80; mask != 0; mask >>= 1) {
 411  0067 a680          	ld	a,#128
 412  0069 6b01          	ld	(OFST+0,sp),a
 414  006b               L331:
 415                     ; 69         if ((byte & mask) != 0) {
 417  006b 7b02          	ld	a,(OFST+1,sp)
 418  006d 1501          	bcp	a,(OFST+0,sp)
 419  006f 2716          	jreq	L141
 420                     ; 71             _asm("bset 20480, #2");
 423  0071 72145000      bset 20480, #2
 425                     ; 74             nop(); nop(); nop(); nop();
 428  0075 9d            nop
 434  0076 9d            nop
 440  0077 9d            nop
 446  0078 9d            nop
 448                     ; 75             nop(); nop(); nop(); nop();
 452  0079 9d            nop
 458  007a 9d            nop
 464  007b 9d            nop
 470  007c 9d            nop
 472                     ; 76 						nop(); nop(); nop(); nop();
 476  007d 9d            nop
 482  007e 9d            nop
 488  007f 9d            nop
 494  0080 9d            nop
 496                     ; 79             _asm("bres 20480, #2");
 500  0081 72155000      bres 20480, #2
 503  0085 2011          	jra	L341
 504  0087               L141:
 505                     ; 86             _asm("bset 20480, #2");
 508  0087 72145000      bset 20480, #2
 510                     ; 89             nop(); nop(); nop(); nop();
 513  008b 9d            nop
 519  008c 9d            nop
 525  008d 9d            nop
 531  008e 9d            nop
 533                     ; 90 						nop(); nop();
 537  008f 9d            nop
 543  0090 9d            nop
 545                     ; 93             _asm("bres 20480, #2");
 549  0091 72155000      bres 20480, #2
 551                     ; 96             nop(); nop(); nop();
 554  0095 9d            nop
 560  0096 9d            nop
 566  0097 9d            nop
 568  0098               L341:
 569                     ; 68     for (mask = 0x80; mask != 0; mask >>= 1) {
 571  0098 0401          	srl	(OFST+0,sp)
 575  009a 0d01          	tnz	(OFST+0,sp)
 576  009c 26cd          	jrne	L331
 577                     ; 100 }
 580  009e 85            	popw	x
 581  009f 81            	ret
 626                     ; 102 void ws_write_grb_top(uint8_t* colour)
 626                     ; 103 {
 627                     	switch	.text
 628  00a0               _ws_write_grb_top:
 630  00a0 89            	pushw	x
 631  00a1 88            	push	a
 632       00000001      OFST:	set	1
 635                     ; 105     for (i = 0; i < 3; ++i) {
 637  00a2 0f01          	clr	(OFST+0,sp)
 639  00a4               L761:
 640                     ; 106         ws_write_byte_top(colour[i]);
 642  00a4 7b01          	ld	a,(OFST+0,sp)
 643  00a6 5f            	clrw	x
 644  00a7 97            	ld	xl,a
 645  00a8 72fb02        	addw	x,(OFST+1,sp)
 646  00ab f6            	ld	a,(x)
 647  00ac cd002a        	call	_ws_write_byte_top
 649                     ; 105     for (i = 0; i < 3; ++i) {
 651  00af 0c01          	inc	(OFST+0,sp)
 655  00b1 7b01          	ld	a,(OFST+0,sp)
 656  00b3 a103          	cp	a,#3
 657  00b5 25ed          	jrult	L761
 658                     ; 108 }
 661  00b7 5b03          	addw	sp,#3
 662  00b9 81            	ret
 707                     ; 110 void ws_write_grb_bot(uint8_t* colour)
 707                     ; 111 {
 708                     	switch	.text
 709  00ba               _ws_write_grb_bot:
 711  00ba 89            	pushw	x
 712  00bb 88            	push	a
 713       00000001      OFST:	set	1
 716                     ; 113     for (i = 0; i < 3; ++i) {
 718  00bc 0f01          	clr	(OFST+0,sp)
 720  00be               L712:
 721                     ; 114         ws_write_byte_bot(colour[i]);
 723  00be 7b01          	ld	a,(OFST+0,sp)
 724  00c0 5f            	clrw	x
 725  00c1 97            	ld	xl,a
 726  00c2 72fb02        	addw	x,(OFST+1,sp)
 727  00c5 f6            	ld	a,(x)
 728  00c6 ad9d          	call	_ws_write_byte_bot
 730                     ; 113     for (i = 0; i < 3; ++i) {
 732  00c8 0c01          	inc	(OFST+0,sp)
 736  00ca 7b01          	ld	a,(OFST+0,sp)
 737  00cc a103          	cp	a,#3
 738  00ce 25ee          	jrult	L712
 739                     ; 116 }
 742  00d0 5b03          	addw	sp,#3
 743  00d2 81            	ret
 790                     ; 118 void write_display(uint8_t (*lights)[3])
 790                     ; 119 {
 791                     	switch	.text
 792  00d3               _write_display:
 794  00d3 89            	pushw	x
 795  00d4 88            	push	a
 796       00000001      OFST:	set	1
 799                     ; 121 	for (i = 0; i < 3*NUM_LEDS_HALF; ++i) {
 801  00d5 0f01          	clr	(OFST+0,sp)
 803  00d7               L742:
 804                     ; 122 		ws_write_grb_top(lights[i]);
 806  00d7 7b01          	ld	a,(OFST+0,sp)
 807  00d9 97            	ld	xl,a
 808  00da a603          	ld	a,#3
 809  00dc 42            	mul	x,a
 810  00dd 72fb02        	addw	x,(OFST+1,sp)
 811  00e0 adbe          	call	_ws_write_grb_top
 813                     ; 121 	for (i = 0; i < 3*NUM_LEDS_HALF; ++i) {
 815  00e2 0c01          	inc	(OFST+0,sp)
 819  00e4 7b01          	ld	a,(OFST+0,sp)
 820  00e6 a10c          	cp	a,#12
 821  00e8 25ed          	jrult	L742
 822                     ; 125 	for (i = 0; i < 3*NUM_LEDS_HALF; ++i) {
 824  00ea 0f01          	clr	(OFST+0,sp)
 826  00ec               L552:
 827                     ; 126 		ws_write_grb_bot(lights[NUM_LEDS-i-1]);
 829  00ec a600          	ld	a,#0
 830  00ee 97            	ld	xl,a
 831  00ef a607          	ld	a,#7
 832  00f1 1001          	sub	a,(OFST+0,sp)
 833  00f3 2401          	jrnc	L02
 834  00f5 5a            	decw	x
 835  00f6               L02:
 836  00f6 02            	rlwa	x,a
 837  00f7 a603          	ld	a,#3
 838  00f9 cd0000        	call	c_bmulx
 840  00fc 72fb02        	addw	x,(OFST+1,sp)
 841  00ff adb9          	call	_ws_write_grb_bot
 843                     ; 125 	for (i = 0; i < 3*NUM_LEDS_HALF; ++i) {
 845  0101 0c01          	inc	(OFST+0,sp)
 849  0103 7b01          	ld	a,(OFST+0,sp)
 850  0105 a10c          	cp	a,#12
 851  0107 25e3          	jrult	L552
 852                     ; 128 }
 855  0109 5b03          	addw	sp,#3
 856  010b 81            	ret
 859                     	bsct
 860  0000               L562_colour:
 861  0000 00            	dc.b	0
 862  0001 00            	dc.b	0
 863  0002 32            	dc.b	50
 915                     ; 133 int main(void) {
 916                     	switch	.text
 917  010c               _main:
 919  010c 89            	pushw	x
 920       00000002      OFST:	set	2
 923                     ; 135     CLK_DeInit();
 925  010d cd0000        	call	_CLK_DeInit
 927                     ; 136     CLK_HSECmd(DISABLE);
 929  0110 4f            	clr	a
 930  0111 cd0000        	call	_CLK_HSECmd
 932                     ; 137     CLK_HSICmd(ENABLE);
 934  0114 a601          	ld	a,#1
 935  0116 cd0000        	call	_CLK_HSICmd
 937                     ; 138     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 939  0119 4f            	clr	a
 940  011a cd0000        	call	_CLK_HSIPrescalerConfig
 942                     ; 139     CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 944  011d a680          	ld	a,#128
 945  011f cd0000        	call	_CLK_SYSCLKConfig
 947                     ; 142     GPIO_DeInit(GPIOA);
 949  0122 ae5000        	ldw	x,#20480
 950  0125 cd0000        	call	_GPIO_DeInit
 952                     ; 143     GPIO_Init(GPIOA, GPIO_PIN_1, GPIO_MODE_OUT_PP_LOW_FAST);
 954  0128 4be0          	push	#224
 955  012a 4b02          	push	#2
 956  012c ae5000        	ldw	x,#20480
 957  012f cd0000        	call	_GPIO_Init
 959  0132 85            	popw	x
 960                     ; 144 		GPIO_Init(GPIOA, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 962  0133 4be0          	push	#224
 963  0135 4b04          	push	#4
 964  0137 ae5000        	ldw	x,#20480
 965  013a cd0000        	call	_GPIO_Init
 967  013d 85            	popw	x
 968                     ; 147     memset(lights, 0, sizeof(lights));
 970  013e ae0018        	ldw	x,#24
 971  0141               L42:
 972  0141 6fff          	clr	(L362_lights-1,x)
 973  0143 5a            	decw	x
 974  0144 26fb          	jrne	L42
 975  0146               L113:
 976                     ; 152 			for (j = 0; j < NUM_COLOURS; ++j) {
 978  0146 0f02          	clr	(OFST+0,sp)
 980  0148               L513:
 981                     ; 154 				for (i = 0; i < NUM_LEDS; ++i) {
 983  0148 0f01          	clr	(OFST-1,sp)
 985  014a               L323:
 986                     ; 155 					memset(lights, 0, sizeof(lights));
 988  014a ae0018        	ldw	x,#24
 989  014d               L62:
 990  014d 6fff          	clr	(L362_lights-1,x)
 991  014f 5a            	decw	x
 992  0150 26fb          	jrne	L62
 993                     ; 156 					lights[i][j] = 20;
 995  0152 7b01          	ld	a,(OFST-1,sp)
 996  0154 97            	ld	xl,a
 997  0155 a603          	ld	a,#3
 998  0157 42            	mul	x,a
 999  0158 01            	rrwa	x,a
1000  0159 1b02          	add	a,(OFST+0,sp)
1001  015b 2401          	jrnc	L03
1002  015d 5c            	incw	x
1003  015e               L03:
1004  015e 02            	rlwa	x,a
1005  015f a614          	ld	a,#20
1006  0161 e700          	ld	(L362_lights,x),a
1007                     ; 157 					write_display(lights);
1009  0163 ae0000        	ldw	x,#L362_lights
1010  0166 cd00d3        	call	_write_display
1012                     ; 158 					delay_ms(100);
1014  0169 ae0064        	ldw	x,#100
1015  016c cd0000        	call	_delay_ms
1017                     ; 159 					lights[i][j] = 0;
1019  016f 7b01          	ld	a,(OFST-1,sp)
1020  0171 97            	ld	xl,a
1021  0172 a603          	ld	a,#3
1022  0174 42            	mul	x,a
1023  0175 01            	rrwa	x,a
1024  0176 1b02          	add	a,(OFST+0,sp)
1025  0178 2401          	jrnc	L23
1026  017a 5c            	incw	x
1027  017b               L23:
1028  017b 02            	rlwa	x,a
1029  017c 6f00          	clr	(L362_lights,x)
1030                     ; 154 				for (i = 0; i < NUM_LEDS; ++i) {
1032  017e 0c01          	inc	(OFST-1,sp)
1036  0180 7b01          	ld	a,(OFST-1,sp)
1037  0182 a108          	cp	a,#8
1038  0184 25c4          	jrult	L323
1039                     ; 152 			for (j = 0; j < NUM_COLOURS; ++j) {
1041  0186 0c02          	inc	(OFST+0,sp)
1045  0188 7b02          	ld	a,(OFST+0,sp)
1046  018a a103          	cp	a,#3
1047  018c 25ba          	jrult	L513
1049  018e 20b6          	jra	L113
1085                     	xdef	_main
1086                     	switch	.ubsct
1087  0000               L362_lights:
1088  0000 000000000000  	ds.b	24
1089                     	xdef	_write_display
1090                     	xdef	_ws_write_grb_bot
1091                     	xdef	_ws_write_grb_top
1092                     	xdef	_ws_write_byte_bot
1093                     	xdef	_ws_write_byte_top
1094                     	xdef	_delay_ms
1095                     	xref	_GPIO_Init
1096                     	xref	_GPIO_DeInit
1097                     	xref	_CLK_SYSCLKConfig
1098                     	xref	_CLK_HSIPrescalerConfig
1099                     	xref	_CLK_HSICmd
1100                     	xref	_CLK_HSECmd
1101                     	xref	_CLK_DeInit
1102                     	xref.b	c_x
1122                     	xref	c_bmulx
1123                     	end
