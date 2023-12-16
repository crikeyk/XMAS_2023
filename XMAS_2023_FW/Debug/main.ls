   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  14                     	bsct
  15  0000               _dir:
  16  0000 01            	dc.b	1
  17  0001               _change:
  18  0001 00            	dc.b	0
  19  0002               _colour:
  20  0002 00            	dc.b	0
  21  0003 00            	dc.b	0
  22  0004 00            	dc.b	0
  81                     ; 20 void delay_ms_HS(uint16_t ms)
  81                     ; 21 {
  83                     	switch	.text
  84  0000               _delay_ms_HS:
  86  0000 89            	pushw	x
  87  0001 5204          	subw	sp,#4
  88       00000004      OFST:	set	4
  91                     ; 23 	for (ms_count = 0; ms_count < ms; ++ms_count) {
  93  0003 5f            	clrw	x
  94  0004 1f03          	ldw	(OFST-1,sp),x
  97  0006 2019          	jra	L34
  98  0008               L73:
  99                     ; 25 		for (ticks = 0; ticks < 1074; ++ticks) {
 101  0008 5f            	clrw	x
 102  0009 1f01          	ldw	(OFST-3,sp),x
 104  000b               L74:
 105                     ; 26 			nop();
 108  000b 9d            nop
 110                     ; 25 		for (ticks = 0; ticks < 1074; ++ticks) {
 113  000c 1e01          	ldw	x,(OFST-3,sp)
 114  000e 1c0001        	addw	x,#1
 115  0011 1f01          	ldw	(OFST-3,sp),x
 119  0013 1e01          	ldw	x,(OFST-3,sp)
 120  0015 a30432        	cpw	x,#1074
 121  0018 25f1          	jrult	L74
 122                     ; 23 	for (ms_count = 0; ms_count < ms; ++ms_count) {
 124  001a 1e03          	ldw	x,(OFST-1,sp)
 125  001c 1c0001        	addw	x,#1
 126  001f 1f03          	ldw	(OFST-1,sp),x
 128  0021               L34:
 131  0021 1e03          	ldw	x,(OFST-1,sp)
 132  0023 1305          	cpw	x,(OFST+1,sp)
 133  0025 25e1          	jrult	L73
 134                     ; 29 }
 137  0027 5b06          	addw	sp,#6
 138  0029 81            	ret
 191                     ; 31 void delay_ms(uint16_t ms)
 191                     ; 32 {
 192                     	switch	.text
 193  002a               _delay_ms:
 195  002a 5204          	subw	sp,#4
 196       00000004      OFST:	set	4
 199                     ; 35 	uint16_t targ = ms * 0.4;
 201  002c cd0000        	call	c_uitof
 203  002f ae0004        	ldw	x,#L701
 204  0032 cd0000        	call	c_fmul
 206  0035 cd0000        	call	c_ftoi
 208  0038 1f01          	ldw	(OFST-3,sp),x
 210                     ; 37 	for (ms_count = 0; ms_count < targ; ++ms_count) {
 212  003a 5f            	clrw	x
 213  003b 1f03          	ldw	(OFST-1,sp),x
 216  003d 2008          	jra	L711
 217  003f               L311:
 218                     ; 38 		nop();
 221  003f 9d            nop
 223                     ; 37 	for (ms_count = 0; ms_count < targ; ++ms_count) {
 226  0040 1e03          	ldw	x,(OFST-1,sp)
 227  0042 1c0001        	addw	x,#1
 228  0045 1f03          	ldw	(OFST-1,sp),x
 230  0047               L711:
 233  0047 1e03          	ldw	x,(OFST-1,sp)
 234  0049 1301          	cpw	x,(OFST-3,sp)
 235  004b 25f2          	jrult	L311
 236                     ; 40 }
 239  004d 5b04          	addw	sp,#4
 240  004f 81            	ret
 285                     ; 45 void ws_write_byte_top(uint8_t byte)
 285                     ; 46 {
 286                     	switch	.text
 287  0050               _ws_write_byte_top:
 289  0050 88            	push	a
 290  0051 88            	push	a
 291       00000001      OFST:	set	1
 294                     ; 48     for (mask = 0x80; mask != 0; mask >>= 1) {
 296  0052 a680          	ld	a,#128
 297  0054 6b01          	ld	(OFST+0,sp),a
 299  0056               L541:
 300                     ; 49         if ((byte & mask) != 0) {
 302  0056 7b02          	ld	a,(OFST+1,sp)
 303  0058 1501          	bcp	a,(OFST+0,sp)
 304  005a 2716          	jreq	L351
 305                     ; 51             _asm("bset 20480, #1");
 308  005c 72125000      bset 20480, #1
 310                     ; 54             nop(); nop(); nop(); nop();
 313  0060 9d            nop
 319  0061 9d            nop
 325  0062 9d            nop
 331  0063 9d            nop
 333                     ; 55             nop(); nop(); nop(); nop();
 337  0064 9d            nop
 343  0065 9d            nop
 349  0066 9d            nop
 355  0067 9d            nop
 357                     ; 56 						nop(); nop(); nop(); nop();
 361  0068 9d            nop
 367  0069 9d            nop
 373  006a 9d            nop
 379  006b 9d            nop
 381                     ; 59             _asm("bres 20480, #1");
 385  006c 72135000      bres 20480, #1
 388  0070 2011          	jra	L551
 389  0072               L351:
 390                     ; 66             _asm("bset 20480, #1");
 393  0072 72125000      bset 20480, #1
 395                     ; 69             nop(); nop(); nop(); nop();
 398  0076 9d            nop
 404  0077 9d            nop
 410  0078 9d            nop
 416  0079 9d            nop
 418                     ; 70 						nop(); nop();
 422  007a 9d            nop
 428  007b 9d            nop
 430                     ; 73             _asm("bres 20480, #1");
 434  007c 72135000      bres 20480, #1
 436                     ; 76             nop(); nop(); nop();
 439  0080 9d            nop
 445  0081 9d            nop
 451  0082 9d            nop
 453  0083               L551:
 454                     ; 48     for (mask = 0x80; mask != 0; mask >>= 1) {
 456  0083 0401          	srl	(OFST+0,sp)
 460  0085 0d01          	tnz	(OFST+0,sp)
 461  0087 26cd          	jrne	L541
 462                     ; 80 }
 465  0089 85            	popw	x
 466  008a 81            	ret
 511                     ; 81 void ws_write_byte_bot(uint8_t byte)
 511                     ; 82 {
 512                     	switch	.text
 513  008b               _ws_write_byte_bot:
 515  008b 88            	push	a
 516  008c 88            	push	a
 517       00000001      OFST:	set	1
 520                     ; 84     for (mask = 0x80; mask != 0; mask >>= 1) {
 522  008d a680          	ld	a,#128
 523  008f 6b01          	ld	(OFST+0,sp),a
 525  0091               L102:
 526                     ; 85         if ((byte & mask) != 0) {
 528  0091 7b02          	ld	a,(OFST+1,sp)
 529  0093 1501          	bcp	a,(OFST+0,sp)
 530  0095 2716          	jreq	L702
 531                     ; 87             _asm("bset 20480, #2");
 534  0097 72145000      bset 20480, #2
 536                     ; 90             nop(); nop(); nop(); nop();
 539  009b 9d            nop
 545  009c 9d            nop
 551  009d 9d            nop
 557  009e 9d            nop
 559                     ; 91             nop(); nop(); nop(); nop();
 563  009f 9d            nop
 569  00a0 9d            nop
 575  00a1 9d            nop
 581  00a2 9d            nop
 583                     ; 92 						nop(); nop(); nop(); nop();
 587  00a3 9d            nop
 593  00a4 9d            nop
 599  00a5 9d            nop
 605  00a6 9d            nop
 607                     ; 95             _asm("bres 20480, #2");
 611  00a7 72155000      bres 20480, #2
 614  00ab 2011          	jra	L112
 615  00ad               L702:
 616                     ; 102             _asm("bset 20480, #2");
 619  00ad 72145000      bset 20480, #2
 621                     ; 105             nop(); nop(); nop(); nop();
 624  00b1 9d            nop
 630  00b2 9d            nop
 636  00b3 9d            nop
 642  00b4 9d            nop
 644                     ; 106 						nop(); nop();
 648  00b5 9d            nop
 654  00b6 9d            nop
 656                     ; 109             _asm("bres 20480, #2");
 660  00b7 72155000      bres 20480, #2
 662                     ; 112             nop(); nop(); nop();
 665  00bb 9d            nop
 671  00bc 9d            nop
 677  00bd 9d            nop
 679  00be               L112:
 680                     ; 84     for (mask = 0x80; mask != 0; mask >>= 1) {
 682  00be 0401          	srl	(OFST+0,sp)
 686  00c0 0d01          	tnz	(OFST+0,sp)
 687  00c2 26cd          	jrne	L102
 688                     ; 116 }
 691  00c4 85            	popw	x
 692  00c5 81            	ret
 737                     ; 118 void ws_write_grb_top(uint8_t* colour)
 737                     ; 119 {
 738                     	switch	.text
 739  00c6               _ws_write_grb_top:
 741  00c6 89            	pushw	x
 742  00c7 88            	push	a
 743       00000001      OFST:	set	1
 746                     ; 121     for (i = 0; i < 3; ++i) {
 748  00c8 0f01          	clr	(OFST+0,sp)
 750  00ca               L532:
 751                     ; 122         ws_write_byte_top(colour[i]);
 753  00ca 7b01          	ld	a,(OFST+0,sp)
 754  00cc 5f            	clrw	x
 755  00cd 97            	ld	xl,a
 756  00ce 72fb02        	addw	x,(OFST+1,sp)
 757  00d1 f6            	ld	a,(x)
 758  00d2 cd0050        	call	_ws_write_byte_top
 760                     ; 121     for (i = 0; i < 3; ++i) {
 762  00d5 0c01          	inc	(OFST+0,sp)
 766  00d7 7b01          	ld	a,(OFST+0,sp)
 767  00d9 a103          	cp	a,#3
 768  00db 25ed          	jrult	L532
 769                     ; 124 }
 772  00dd 5b03          	addw	sp,#3
 773  00df 81            	ret
 818                     ; 126 void ws_write_grb_bot(uint8_t* colour)
 818                     ; 127 {
 819                     	switch	.text
 820  00e0               _ws_write_grb_bot:
 822  00e0 89            	pushw	x
 823  00e1 88            	push	a
 824       00000001      OFST:	set	1
 827                     ; 129     for (i = 0; i < 3; ++i) {
 829  00e2 0f01          	clr	(OFST+0,sp)
 831  00e4               L562:
 832                     ; 130         ws_write_byte_bot(colour[i]);
 834  00e4 7b01          	ld	a,(OFST+0,sp)
 835  00e6 5f            	clrw	x
 836  00e7 97            	ld	xl,a
 837  00e8 72fb02        	addw	x,(OFST+1,sp)
 838  00eb f6            	ld	a,(x)
 839  00ec ad9d          	call	_ws_write_byte_bot
 841                     ; 129     for (i = 0; i < 3; ++i) {
 843  00ee 0c01          	inc	(OFST+0,sp)
 847  00f0 7b01          	ld	a,(OFST+0,sp)
 848  00f2 a103          	cp	a,#3
 849  00f4 25ee          	jrult	L562
 850                     ; 132 }
 853  00f6 5b03          	addw	sp,#3
 854  00f8 81            	ret
 903                     ; 134 void write_display(uint8_t (*lights)[3])
 903                     ; 135 {
 904                     	switch	.text
 905  00f9               _write_display:
 907  00f9 89            	pushw	x
 908  00fa 88            	push	a
 909       00000001      OFST:	set	1
 912                     ; 137 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); //2MHz
 914  00fb 4f            	clr	a
 915  00fc cd0000        	call	_CLK_HSIPrescalerConfig
 917                     ; 138 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); // 15.625kHz
 919  00ff a680          	ld	a,#128
 920  0101 cd0000        	call	_CLK_SYSCLKConfig
 922                     ; 140 	for (i = 0; i < 3*NUM_LEDS_HALF; ++i) {
 924  0104 0f01          	clr	(OFST+0,sp)
 926  0106               L513:
 927                     ; 141 		ws_write_grb_top(lights[i]);
 929  0106 7b01          	ld	a,(OFST+0,sp)
 930  0108 97            	ld	xl,a
 931  0109 a603          	ld	a,#3
 932  010b 42            	mul	x,a
 933  010c 72fb02        	addw	x,(OFST+1,sp)
 934  010f adb5          	call	_ws_write_grb_top
 936                     ; 140 	for (i = 0; i < 3*NUM_LEDS_HALF; ++i) {
 938  0111 0c01          	inc	(OFST+0,sp)
 942  0113 7b01          	ld	a,(OFST+0,sp)
 943  0115 a10c          	cp	a,#12
 944  0117 25ed          	jrult	L513
 945                     ; 144 	for (i = 0; i < 3*NUM_LEDS_HALF; ++i) {
 947  0119 0f01          	clr	(OFST+0,sp)
 949  011b               L323:
 950                     ; 145 		ws_write_grb_bot(lights[NUM_LEDS-i-1]);
 952  011b a600          	ld	a,#0
 953  011d 97            	ld	xl,a
 954  011e a607          	ld	a,#7
 955  0120 1001          	sub	a,(OFST+0,sp)
 956  0122 2401          	jrnc	L22
 957  0124 5a            	decw	x
 958  0125               L22:
 959  0125 02            	rlwa	x,a
 960  0126 a603          	ld	a,#3
 961  0128 cd0000        	call	c_bmulx
 963  012b 72fb02        	addw	x,(OFST+1,sp)
 964  012e adb0          	call	_ws_write_grb_bot
 966                     ; 144 	for (i = 0; i < 3*NUM_LEDS_HALF; ++i) {
 968  0130 0c01          	inc	(OFST+0,sp)
 972  0132 7b01          	ld	a,(OFST+0,sp)
 973  0134 a10c          	cp	a,#12
 974  0136 25e3          	jrult	L323
 975                     ; 147 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8); //2MHz
 977  0138 a618          	ld	a,#24
 978  013a cd0000        	call	_CLK_HSIPrescalerConfig
 980                     ; 148 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV128); // 15.625kHz
 982  013d a687          	ld	a,#135
 983  013f cd0000        	call	_CLK_SYSCLKConfig
 985                     ; 149 }
 988  0142 5b03          	addw	sp,#3
 989  0144 81            	ret
1033                     ; 151 void clear_lights(void)
1033                     ; 152 {
1034                     	switch	.text
1035  0145               _clear_lights:
1037  0145 89            	pushw	x
1038       00000002      OFST:	set	2
1041                     ; 154 		for (j = 0; j < NUM_COLOURS; ++j) {
1043  0146 0f02          	clr	(OFST+0,sp)
1045  0148               L353:
1046                     ; 156 			for (i = 0; i < NUM_LEDS; ++i) {
1048  0148 0f01          	clr	(OFST-1,sp)
1050  014a               L163:
1051                     ; 157 				lights[i][j] = 0;
1053  014a 7b01          	ld	a,(OFST-1,sp)
1054  014c 97            	ld	xl,a
1055  014d a603          	ld	a,#3
1056  014f 42            	mul	x,a
1057  0150 01            	rrwa	x,a
1058  0151 1b02          	add	a,(OFST+0,sp)
1059  0153 2401          	jrnc	L62
1060  0155 5c            	incw	x
1061  0156               L62:
1062  0156 02            	rlwa	x,a
1063  0157 6f00          	clr	(_lights,x)
1064                     ; 156 			for (i = 0; i < NUM_LEDS; ++i) {
1066  0159 0c01          	inc	(OFST-1,sp)
1070  015b 7b01          	ld	a,(OFST-1,sp)
1071  015d a108          	cp	a,#8
1072  015f 25e9          	jrult	L163
1073                     ; 154 		for (j = 0; j < NUM_COLOURS; ++j) {
1075  0161 0c02          	inc	(OFST+0,sp)
1079  0163 7b02          	ld	a,(OFST+0,sp)
1080  0165 a103          	cp	a,#3
1081  0167 25df          	jrult	L353
1082                     ; 160 }
1085  0169 85            	popw	x
1086  016a 81            	ret
1140                     ; 162 void setAllSameColour(uint8_t* colour){
1141                     	switch	.text
1142  016b               _setAllSameColour:
1144  016b 89            	pushw	x
1145  016c 89            	pushw	x
1146       00000002      OFST:	set	2
1149                     ; 164 		for (i = 0; i < NUM_LEDS; ++i) {
1151  016d 0f02          	clr	(OFST+0,sp)
1153  016f               L514:
1154                     ; 166 			for (j = 0; j < NUM_COLOURS; ++j) {
1156  016f 0f01          	clr	(OFST-1,sp)
1158  0171               L324:
1159                     ; 167 				lights[i][j] = colour[j];
1161  0171 7b02          	ld	a,(OFST+0,sp)
1162  0173 97            	ld	xl,a
1163  0174 a603          	ld	a,#3
1164  0176 42            	mul	x,a
1165  0177 01            	rrwa	x,a
1166  0178 1b01          	add	a,(OFST-1,sp)
1167  017a 2401          	jrnc	L23
1168  017c 5c            	incw	x
1169  017d               L23:
1170  017d 02            	rlwa	x,a
1171  017e 7b01          	ld	a,(OFST-1,sp)
1172  0180 905f          	clrw	y
1173  0182 9097          	ld	yl,a
1174  0184 72f903        	addw	y,(OFST+1,sp)
1175  0187 90f6          	ld	a,(y)
1176  0189 e700          	ld	(_lights,x),a
1177                     ; 166 			for (j = 0; j < NUM_COLOURS; ++j) {
1179  018b 0c01          	inc	(OFST-1,sp)
1183  018d 7b01          	ld	a,(OFST-1,sp)
1184  018f a103          	cp	a,#3
1185  0191 25de          	jrult	L324
1186                     ; 164 		for (i = 0; i < NUM_LEDS; ++i) {
1188  0193 0c02          	inc	(OFST+0,sp)
1192  0195 7b02          	ld	a,(OFST+0,sp)
1193  0197 a108          	cp	a,#8
1194  0199 25d4          	jrult	L514
1195                     ; 170 }
1198  019b 5b04          	addw	sp,#4
1199  019d 81            	ret
1257                     ; 172 void RGBSpin(void)
1257                     ; 173 {
1258                     	switch	.text
1259  019e               _RGBSpin:
1261  019e 5205          	subw	sp,#5
1262       00000005      OFST:	set	5
1265                     ; 175 	int8_t j = 0;
1267  01a0 0f04          	clr	(OFST-1,sp)
1269                     ; 176 	int8_t i = 0;
1271  01a2 0f05          	clr	(OFST+0,sp)
1273                     ; 177 	uint8_t press = 0;
1275                     ; 179 	change = FALSE;
1277  01a4 3f01          	clr	_change
1278                     ; 180 	clear_lights();
1280  01a6 ad9d          	call	_clear_lights
1283  01a8 206c          	jra	L164
1284  01aa               L754:
1285                     ; 183 		clear_lights();
1287  01aa ad99          	call	_clear_lights
1289                     ; 184 		lights[i][j] = MAX_BRIGHTNESS/2;
1291  01ac 7b04          	ld	a,(OFST-1,sp)
1292  01ae 5f            	clrw	x
1293  01af 4d            	tnz	a
1294  01b0 2a01          	jrpl	L63
1295  01b2 53            	cplw	x
1296  01b3               L63:
1297  01b3 97            	ld	xl,a
1298  01b4 1f01          	ldw	(OFST-4,sp),x
1300  01b6 7b05          	ld	a,(OFST+0,sp)
1301  01b8 5f            	clrw	x
1302  01b9 4d            	tnz	a
1303  01ba 2a01          	jrpl	L04
1304  01bc 53            	cplw	x
1305  01bd               L04:
1306  01bd 97            	ld	xl,a
1307  01be a603          	ld	a,#3
1308  01c0 cd0000        	call	c_bmulx
1310  01c3 72fb01        	addw	x,(OFST-4,sp)
1311  01c6 a60f          	ld	a,#15
1312  01c8 e700          	ld	(_lights,x),a
1313                     ; 185 		write_display(lights);
1315  01ca ae0000        	ldw	x,#_lights
1316  01cd cd00f9        	call	_write_display
1318                     ; 187 		i += dir;
1320  01d0 7b05          	ld	a,(OFST+0,sp)
1321  01d2 bb00          	add	a,_dir
1322  01d4 6b05          	ld	(OFST+0,sp),a
1324                     ; 188 		i = (i==-1) ? NUM_LEDS-1 : i;
1326  01d6 7b05          	ld	a,(OFST+0,sp)
1327  01d8 a1ff          	cp	a,#255
1328  01da 2604          	jrne	L24
1329  01dc a607          	ld	a,#7
1330  01de 2002          	jra	L44
1331  01e0               L24:
1332  01e0 7b05          	ld	a,(OFST+0,sp)
1333  01e2               L44:
1334  01e2 6b05          	ld	(OFST+0,sp),a
1336                     ; 189 		i %= NUM_LEDS;
1338  01e4 7b05          	ld	a,(OFST+0,sp)
1339  01e6 ae0008        	ldw	x,#8
1340  01e9 51            	exgw	x,y
1341  01ea 5f            	clrw	x
1342  01eb 4d            	tnz	a
1343  01ec 2a01          	jrpl	L64
1344  01ee 5a            	decw	x
1345  01ef               L64:
1346  01ef 02            	rlwa	x,a
1347  01f0 cd0000        	call	c_idiv
1349  01f3 909f          	ld	a,yl
1350  01f5 6b05          	ld	(OFST+0,sp),a
1352                     ; 191 		if(i==0){
1354  01f7 0d05          	tnz	(OFST+0,sp)
1355  01f9 2615          	jrne	L564
1356                     ; 192 			j += 1;
1358  01fb 0c04          	inc	(OFST-1,sp)
1360                     ; 193 			j %= NUM_COLOURS;
1362  01fd 7b04          	ld	a,(OFST-1,sp)
1363  01ff ae0003        	ldw	x,#3
1364  0202 51            	exgw	x,y
1365  0203 5f            	clrw	x
1366  0204 4d            	tnz	a
1367  0205 2a01          	jrpl	L05
1368  0207 5a            	decw	x
1369  0208               L05:
1370  0208 02            	rlwa	x,a
1371  0209 cd0000        	call	c_idiv
1373  020c 909f          	ld	a,yl
1374  020e 6b04          	ld	(OFST-1,sp),a
1376  0210               L564:
1377                     ; 195 		delay_ms(125);
1379  0210 ae007d        	ldw	x,#125
1380  0213 cd002a        	call	_delay_ms
1382  0216               L164:
1383                     ; 182 	while (!change) {
1385  0216 3d01          	tnz	_change
1386  0218 2790          	jreq	L754
1387                     ; 197 }
1390  021a 5b05          	addw	sp,#5
1391  021c 81            	ret
1425                     ; 200 uint8_t linearSine(uint8_t val){
1426                     	switch	.text
1427  021d               _linearSine:
1429  021d 88            	push	a
1430       00000000      OFST:	set	0
1433                     ; 201 	val %= 256;
1435  021e 7b01          	ld	a,(OFST+1,sp)
1436  0220 a4ff          	and	a,#255
1437  0222 6b01          	ld	(OFST+1,sp),a
1438                     ; 202 	if(val < 128){
1440  0224 7b01          	ld	a,(OFST+1,sp)
1441  0226 a180          	cp	a,#128
1442  0228 2405          	jruge	L505
1443                     ; 203 		return(val);
1445  022a 7b01          	ld	a,(OFST+1,sp)
1448  022c 5b01          	addw	sp,#1
1449  022e 81            	ret
1450  022f               L505:
1451                     ; 204 	} else if (val > 128){
1453  022f 7b01          	ld	a,(OFST+1,sp)
1454  0231 a181          	cp	a,#129
1455  0233 2507          	jrult	L705
1456                     ; 205 		return(256 - val);
1458  0235 a600          	ld	a,#0
1459  0237 1001          	sub	a,(OFST+1,sp)
1462  0239 5b01          	addw	sp,#1
1463  023b 81            	ret
1464  023c               L705:
1465                     ; 207 }	
1468  023c 5b01          	addw	sp,#1
1469  023e 81            	ret
1546                     ; 209 void rainbowFade(void)
1546                     ; 210 {
1547                     	switch	.text
1548  023f               _rainbowFade:
1550  023f 520c          	subw	sp,#12
1551       0000000c      OFST:	set	12
1554                     ; 211 	uint8_t hue = 0;
1556  0241 0f0c          	clr	(OFST+0,sp)
1558                     ; 212 	uint8_t red = 0;
1560                     ; 213 	uint8_t green = 0;
1562                     ; 214 	uint8_t blue = 0;
1564                     ; 215 	float scale = MAX_BRIGHTNESS*1.0/256;
1566  0243 ce0002        	ldw	x,L555+2
1567  0246 1f0a          	ldw	(OFST-2,sp),x
1568  0248 ce0000        	ldw	x,L555
1569  024b 1f08          	ldw	(OFST-4,sp),x
1571                     ; 217 	change = FALSE;
1573  024d 3f01          	clr	_change
1574                     ; 218 	clear_lights();	
1576  024f cd0145        	call	_clear_lights
1579  0252 acdf02df      	jpf	L365
1580  0256               L165:
1581                     ; 222 		colour[0] = linearSine(hue)*scale;
1583  0256 7b0c          	ld	a,(OFST+0,sp)
1584  0258 adc3          	call	_linearSine
1586  025a 5f            	clrw	x
1587  025b 97            	ld	xl,a
1588  025c cd0000        	call	c_itof
1590  025f 96            	ldw	x,sp
1591  0260 1c0001        	addw	x,#OFST-11
1592  0263 cd0000        	call	c_rtol
1595  0266 96            	ldw	x,sp
1596  0267 1c0008        	addw	x,#OFST-4
1597  026a cd0000        	call	c_ltor
1599  026d 96            	ldw	x,sp
1600  026e 1c0001        	addw	x,#OFST-11
1601  0271 cd0000        	call	c_fmul
1603  0274 cd0000        	call	c_ftol
1605  0277 b603          	ld	a,c_lreg+3
1606  0279 b702          	ld	_colour,a
1607                     ; 223 		colour[1] = linearSine(hue-128)*scale;
1609  027b 7b0c          	ld	a,(OFST+0,sp)
1610  027d a080          	sub	a,#128
1611  027f ad9c          	call	_linearSine
1613  0281 5f            	clrw	x
1614  0282 97            	ld	xl,a
1615  0283 cd0000        	call	c_itof
1617  0286 96            	ldw	x,sp
1618  0287 1c0001        	addw	x,#OFST-11
1619  028a cd0000        	call	c_rtol
1622  028d 96            	ldw	x,sp
1623  028e 1c0008        	addw	x,#OFST-4
1624  0291 cd0000        	call	c_ltor
1626  0294 96            	ldw	x,sp
1627  0295 1c0001        	addw	x,#OFST-11
1628  0298 cd0000        	call	c_fmul
1630  029b cd0000        	call	c_ftol
1632  029e b603          	ld	a,c_lreg+3
1633  02a0 b703          	ld	_colour+1,a
1634                     ; 224 		colour[2] = linearSine(hue+128)*scale;
1636  02a2 7b0c          	ld	a,(OFST+0,sp)
1637  02a4 ab80          	add	a,#128
1638  02a6 cd021d        	call	_linearSine
1640  02a9 5f            	clrw	x
1641  02aa 97            	ld	xl,a
1642  02ab cd0000        	call	c_itof
1644  02ae 96            	ldw	x,sp
1645  02af 1c0001        	addw	x,#OFST-11
1646  02b2 cd0000        	call	c_rtol
1649  02b5 96            	ldw	x,sp
1650  02b6 1c0008        	addw	x,#OFST-4
1651  02b9 cd0000        	call	c_ltor
1653  02bc 96            	ldw	x,sp
1654  02bd 1c0001        	addw	x,#OFST-11
1655  02c0 cd0000        	call	c_fmul
1657  02c3 cd0000        	call	c_ftol
1659  02c6 b603          	ld	a,c_lreg+3
1660  02c8 b704          	ld	_colour+2,a
1661                     ; 226 		clear_lights();
1663  02ca cd0145        	call	_clear_lights
1665                     ; 227 		setAllSameColour(colour); 
1667  02cd ae0002        	ldw	x,#_colour
1668  02d0 cd016b        	call	_setAllSameColour
1670                     ; 228 		write_display(lights);
1672  02d3 ae0000        	ldw	x,#_lights
1673  02d6 cd00f9        	call	_write_display
1675                     ; 230 		hue += 10;
1677  02d9 7b0c          	ld	a,(OFST+0,sp)
1678  02db ab0a          	add	a,#10
1679  02dd 6b0c          	ld	(OFST+0,sp),a
1681  02df               L365:
1682                     ; 220 	while(!change){
1684  02df 3d01          	tnz	_change
1685  02e1 2603          	jrne	L65
1686  02e3 cc0256        	jp	L165
1687  02e6               L65:
1688                     ; 234 }
1691  02e6 5b0c          	addw	sp,#12
1692  02e8 81            	ret
1778                     ; 236 void RGBPulse(void)
1778                     ; 237 {
1779                     	switch	.text
1780  02e9               _RGBPulse:
1782  02e9 520d          	subw	sp,#13
1783       0000000d      OFST:	set	13
1786                     ; 239 	uint8_t hue = 0;
1788                     ; 240 	uint8_t red = 0;
1790                     ; 241 	uint8_t green = 0;
1792                     ; 242 	uint8_t blue = 0;
1794                     ; 243 	uint8_t colour_int = 0;
1796                     ; 244 	float scale = MAX_BRIGHTNESS*1.0/256;
1798  02eb ce0002        	ldw	x,L555+2
1799  02ee 1f0a          	ldw	(OFST-3,sp),x
1800  02f0 ce0000        	ldw	x,L555
1801  02f3 1f08          	ldw	(OFST-5,sp),x
1803                     ; 246 	change = FALSE;
1805  02f5 3f01          	clr	_change
1806                     ; 247 	clear_lights();
1808  02f7 cd0145        	call	_clear_lights
1810                     ; 248 	write_display(lights);
1812  02fa ae0000        	ldw	x,#_lights
1813  02fd cd00f9        	call	_write_display
1815                     ; 249 	colour[0] = 0;
1817  0300 3f02          	clr	_colour
1818                     ; 250 	colour[1] = 0;
1820  0302 3f03          	clr	_colour+1
1821                     ; 251 	colour[2] = 0;
1823  0304 3f04          	clr	_colour+2
1824                     ; 253 	change = FALSE;
1826  0306 3f01          	clr	_change
1827  0308               L136:
1828                     ; 255 		for(colour_int = 0;colour_int<3;colour_int+=1){
1830  0308 0f0c          	clr	(OFST-1,sp)
1832  030a               L536:
1833                     ; 256 			for(hue = 0;hue<250;hue+=10){
1835  030a 0f0d          	clr	(OFST+0,sp)
1837  030c               L346:
1838                     ; 258 				colour[colour_int] = linearSine(hue)*scale;
1840  030c 7b0c          	ld	a,(OFST-1,sp)
1841  030e 5f            	clrw	x
1842  030f 97            	ld	xl,a
1843  0310 89            	pushw	x
1844  0311 7b0f          	ld	a,(OFST+2,sp)
1845  0313 cd021d        	call	_linearSine
1847  0316 5f            	clrw	x
1848  0317 97            	ld	xl,a
1849  0318 cd0000        	call	c_itof
1851  031b 96            	ldw	x,sp
1852  031c 1c0003        	addw	x,#OFST-10
1853  031f cd0000        	call	c_rtol
1856  0322 96            	ldw	x,sp
1857  0323 1c000a        	addw	x,#OFST-3
1858  0326 cd0000        	call	c_ltor
1860  0329 96            	ldw	x,sp
1861  032a 1c0003        	addw	x,#OFST-10
1862  032d cd0000        	call	c_fmul
1864  0330 cd0000        	call	c_ftol
1866  0333 b603          	ld	a,c_lreg+3
1867  0335 85            	popw	x
1868  0336 e702          	ld	(_colour,x),a
1869                     ; 260 				clear_lights();
1871  0338 cd0145        	call	_clear_lights
1873                     ; 261 				setAllSameColour(colour); 
1875  033b ae0002        	ldw	x,#_colour
1876  033e cd016b        	call	_setAllSameColour
1878                     ; 262 				write_display(lights);
1880  0341 ae0000        	ldw	x,#_lights
1881  0344 cd00f9        	call	_write_display
1883                     ; 266 				if(change){
1885  0347 3d01          	tnz	_change
1886  0349 2703          	jreq	L156
1887                     ; 267 					return;
1890  034b 5b0d          	addw	sp,#13
1891  034d 81            	ret
1892  034e               L156:
1893                     ; 256 			for(hue = 0;hue<250;hue+=10){
1895  034e 7b0d          	ld	a,(OFST+0,sp)
1896  0350 ab0a          	add	a,#10
1897  0352 6b0d          	ld	(OFST+0,sp),a
1901  0354 7b0d          	ld	a,(OFST+0,sp)
1902  0356 a1fa          	cp	a,#250
1903  0358 25b2          	jrult	L346
1904                     ; 270 			colour[colour_int] = 0;
1906  035a 7b0c          	ld	a,(OFST-1,sp)
1907  035c 5f            	clrw	x
1908  035d 97            	ld	xl,a
1909  035e 6f02          	clr	(_colour,x)
1910                     ; 255 		for(colour_int = 0;colour_int<3;colour_int+=1){
1912  0360 0c0c          	inc	(OFST-1,sp)
1916  0362 7b0c          	ld	a,(OFST-1,sp)
1917  0364 a103          	cp	a,#3
1918  0366 25a2          	jrult	L536
1920  0368 209e          	jra	L136
1960                     ; 276 void random(void){
1961                     	switch	.text
1962  036a               _random:
1964  036a 88            	push	a
1965       00000001      OFST:	set	1
1968                     ; 278 	uint8_t rand_led = 0;
1970                     ; 280 	change = FALSE;
1972  036b 3f01          	clr	_change
1973                     ; 281 	clear_lights();
1975  036d cd0145        	call	_clear_lights
1978  0370 206c          	jra	L376
1979  0372               L176:
1980                     ; 285 		clear_lights();
1982  0372 cd0145        	call	_clear_lights
1984                     ; 287 		rand_led = rand() % 8;
1986  0375 cd0000        	call	_rand
1988  0378 a608          	ld	a,#8
1989  037a cd0000        	call	c_smodx
1991  037d 01            	rrwa	x,a
1992  037e 6b01          	ld	(OFST+0,sp),a
1993  0380 02            	rlwa	x,a
1995                     ; 289 		lights[rand_led][0] = rand() % MAX_BRIGHTNESS/2;
1997  0381 7b01          	ld	a,(OFST+0,sp)
1998  0383 97            	ld	xl,a
1999  0384 a603          	ld	a,#3
2000  0386 42            	mul	x,a
2001  0387 89            	pushw	x
2002  0388 cd0000        	call	_rand
2004  038b a61e          	ld	a,#30
2005  038d cd0000        	call	c_smodx
2007  0390 a602          	ld	a,#2
2008  0392 cd0000        	call	c_sdivx
2010  0395 9085          	popw	y
2011  0397 01            	rrwa	x,a
2012  0398 90e700        	ld	(_lights,y),a
2013  039b 02            	rlwa	x,a
2014                     ; 290 		lights[rand_led][1] = rand() % MAX_BRIGHTNESS/2;
2016  039c 7b01          	ld	a,(OFST+0,sp)
2017  039e 97            	ld	xl,a
2018  039f a603          	ld	a,#3
2019  03a1 42            	mul	x,a
2020  03a2 89            	pushw	x
2021  03a3 cd0000        	call	_rand
2023  03a6 a61e          	ld	a,#30
2024  03a8 cd0000        	call	c_smodx
2026  03ab a602          	ld	a,#2
2027  03ad cd0000        	call	c_sdivx
2029  03b0 9085          	popw	y
2030  03b2 01            	rrwa	x,a
2031  03b3 90e701        	ld	(_lights+1,y),a
2032  03b6 02            	rlwa	x,a
2033                     ; 291 		lights[rand_led][2] = rand() % MAX_BRIGHTNESS/2;
2035  03b7 7b01          	ld	a,(OFST+0,sp)
2036  03b9 97            	ld	xl,a
2037  03ba a603          	ld	a,#3
2038  03bc 42            	mul	x,a
2039  03bd 89            	pushw	x
2040  03be cd0000        	call	_rand
2042  03c1 a61e          	ld	a,#30
2043  03c3 cd0000        	call	c_smodx
2045  03c6 a602          	ld	a,#2
2046  03c8 cd0000        	call	c_sdivx
2048  03cb 9085          	popw	y
2049  03cd 01            	rrwa	x,a
2050  03ce 90e702        	ld	(_lights+2,y),a
2051  03d1 02            	rlwa	x,a
2052                     ; 293 		write_display(lights);
2054  03d2 ae0000        	ldw	x,#_lights
2055  03d5 cd00f9        	call	_write_display
2057                     ; 295 		delay_ms(100);
2059  03d8 ae0064        	ldw	x,#100
2060  03db cd002a        	call	_delay_ms
2062  03de               L376:
2063                     ; 283 	while(!change){
2065  03de 3d01          	tnz	_change
2066  03e0 2790          	jreq	L176
2067                     ; 298 }
2070  03e2 84            	pop	a
2071  03e3 81            	ret
2094                     ; 300 void init_tim2(void){
2095                     	switch	.text
2096  03e4               _init_tim2:
2100                     ; 302 	TIM2->PSCR |= 0x0E; // set prescaler to 16384 ~ 1kHz
2102  03e4 c6530e        	ld	a,21262
2103  03e7 aa0e          	or	a,#14
2104  03e9 c7530e        	ld	21262,a
2105                     ; 303 	TIM2->ARRH = 0x0B;
2107  03ec 350b530f      	mov	21263,#11
2108                     ; 304 	TIM2->ARRL = 0xB8; 
2110  03f0 35b85310      	mov	21264,#184
2111                     ; 305 	TIM2->IER |= 0x1; // generate interrupt
2113  03f4 72105303      	bset	21251,#0
2114                     ; 307 }
2117  03f8 81            	ret
2156                     ; 309 int main(void) {
2157                     	switch	.text
2158  03f9               _main:
2162                     ; 312 	sim();
2165  03f9 9b            sim
2167                     ; 313 	CLK_DeInit();
2170  03fa cd0000        	call	_CLK_DeInit
2172                     ; 314 	CLK_HSECmd(DISABLE);
2174  03fd 4f            	clr	a
2175  03fe cd0000        	call	_CLK_HSECmd
2177                     ; 315 	CLK_HSICmd(ENABLE);
2179  0401 a601          	ld	a,#1
2180  0403 cd0000        	call	_CLK_HSICmd
2182                     ; 319 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8); //2MHz
2184  0406 a618          	ld	a,#24
2185  0408 cd0000        	call	_CLK_HSIPrescalerConfig
2187                     ; 320 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV128); // 15.625kHz
2189  040b a687          	ld	a,#135
2190  040d cd0000        	call	_CLK_SYSCLKConfig
2192                     ; 323 	GPIO_DeInit(GPIOA);
2194  0410 ae5000        	ldw	x,#20480
2195  0413 cd0000        	call	_GPIO_DeInit
2197                     ; 324 	GPIO_Init(GPIOA, GPIO_PIN_1, GPIO_MODE_OUT_PP_LOW_FAST);
2199  0416 4be0          	push	#224
2200  0418 4b02          	push	#2
2201  041a ae5000        	ldw	x,#20480
2202  041d cd0000        	call	_GPIO_Init
2204  0420 85            	popw	x
2205                     ; 325 	GPIO_Init(GPIOA, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
2207  0421 4be0          	push	#224
2208  0423 4b04          	push	#4
2209  0425 ae5000        	ldw	x,#20480
2210  0428 cd0000        	call	_GPIO_Init
2212  042b 85            	popw	x
2213                     ; 327 	GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_IN_FL_IT);
2215  042c 4b20          	push	#32
2216  042e 4b10          	push	#16
2217  0430 ae5005        	ldw	x,#20485
2218  0433 cd0000        	call	_GPIO_Init
2220  0436 85            	popw	x
2221                     ; 328 	EXTI->CR1 &= ~(1 << 3);
2223  0437 721750a0      	bres	20640,#3
2224                     ; 329 	EXTI->CR1 |= (1 << 2);
2226  043b 721450a0      	bset	20640,#2
2227                     ; 332 	clear_lights();
2229  043f cd0145        	call	_clear_lights
2231                     ; 334 	init_tim2();
2233  0442 ada0          	call	_init_tim2
2235                     ; 336 	TIM2->CR1 |= 0x1; // enable counter
2237  0444 72105300      	bset	21248,#0
2238                     ; 338 	rim();
2241  0448 9a            rim
2243  0449               L717:
2244                     ; 342 		rainbowFade();
2246  0449 cd023f        	call	_rainbowFade
2248                     ; 344 		random();
2250  044c cd036a        	call	_random
2252                     ; 346 		RGBPulse();
2254  044f cd02e9        	call	_RGBPulse
2256                     ; 348 		dir = CW;
2258  0452 35010000      	mov	_dir,#1
2259                     ; 349 		RGBSpin();
2261  0456 cd019e        	call	_RGBSpin
2263                     ; 351 		dir = CCW;
2265  0459 35ff0000      	mov	_dir,#255
2266                     ; 352 		RGBSpin();
2268  045d cd019e        	call	_RGBSpin
2271  0460 20e7          	jra	L717
2295                     ; 359 @far @interrupt void buttonHandler(void)
2295                     ; 360 {
2297                     	switch	.text
2298  0462               f_buttonHandler:
2302                     ; 363 	change = TRUE;
2304  0462 35010001      	mov	_change,#1
2305                     ; 365 }
2308  0466 80            	iret
2331                     ; 367 @far @interrupt void tim2Handler(void)
2331                     ; 368 {
2332                     	switch	.text
2333  0467               f_tim2Handler:
2337                     ; 369 	TIM2->SR1 &= ~0x01; // clear status register
2339  0467 72115304      	bres	21252,#0
2340                     ; 372 	change = TRUE;
2342  046b 35010001      	mov	_change,#1
2343                     ; 378 }
2346  046f 80            	iret
2420                     	xdef	f_tim2Handler
2421                     	xdef	f_buttonHandler
2422                     	xdef	_main
2423                     	xdef	_init_tim2
2424                     	xdef	_random
2425                     	xdef	_RGBPulse
2426                     	xdef	_rainbowFade
2427                     	xdef	_linearSine
2428                     	xdef	_RGBSpin
2429                     	xdef	_setAllSameColour
2430                     	xdef	_clear_lights
2431                     	xdef	_write_display
2432                     	xdef	_ws_write_grb_bot
2433                     	xdef	_ws_write_grb_top
2434                     	xdef	_ws_write_byte_bot
2435                     	xdef	_ws_write_byte_top
2436                     	xdef	_delay_ms
2437                     	xdef	_delay_ms_HS
2438                     	xdef	_colour
2439                     	switch	.ubsct
2440  0000               _lights:
2441  0000 000000000000  	ds.b	24
2442                     	xdef	_lights
2443                     	xdef	_change
2444                     	xdef	_dir
2445                     	xref	_rand
2446                     	xref	_GPIO_Init
2447                     	xref	_GPIO_DeInit
2448                     	xref	_CLK_SYSCLKConfig
2449                     	xref	_CLK_HSIPrescalerConfig
2450                     	xref	_CLK_HSICmd
2451                     	xref	_CLK_HSECmd
2452                     	xref	_CLK_DeInit
2453                     .const:	section	.text
2454  0000               L555:
2455  0000 3df00000      	dc.w	15856,0
2456  0004               L701:
2457  0004 3ecccccc      	dc.w	16076,-13108
2458                     	xref.b	c_lreg
2459                     	xref.b	c_x
2479                     	xref	c_sdivx
2480                     	xref	c_smodx
2481                     	xref	c_ftol
2482                     	xref	c_rtol
2483                     	xref	c_itof
2484                     	xref	c_ltor
2485                     	xref	c_idiv
2486                     	xref	c_bmulx
2487                     	xref	c_ftoi
2488                     	xref	c_fmul
2489                     	xref	c_uitof
2490                     	end
