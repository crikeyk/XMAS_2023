   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  14                     	bsct
  15  0000               _dir:
  16  0000 01            	dc.b	1
  17  0001               _change:
  18  0001 00            	dc.b	0
  77                     ; 18 void delay_ms_HS(uint16_t ms)
  77                     ; 19 {
  79                     	switch	.text
  80  0000               _delay_ms_HS:
  82  0000 89            	pushw	x
  83  0001 5204          	subw	sp,#4
  84       00000004      OFST:	set	4
  87                     ; 21 	for (ms_count = 0; ms_count < ms; ++ms_count) {
  89  0003 5f            	clrw	x
  90  0004 1f03          	ldw	(OFST-1,sp),x
  93  0006 2019          	jra	L34
  94  0008               L73:
  95                     ; 23 		for (ticks = 0; ticks < 1074; ++ticks) {
  97  0008 5f            	clrw	x
  98  0009 1f01          	ldw	(OFST-3,sp),x
 100  000b               L74:
 101                     ; 24 			nop();
 104  000b 9d            nop
 106                     ; 23 		for (ticks = 0; ticks < 1074; ++ticks) {
 109  000c 1e01          	ldw	x,(OFST-3,sp)
 110  000e 1c0001        	addw	x,#1
 111  0011 1f01          	ldw	(OFST-3,sp),x
 115  0013 1e01          	ldw	x,(OFST-3,sp)
 116  0015 a30432        	cpw	x,#1074
 117  0018 25f1          	jrult	L74
 118                     ; 21 	for (ms_count = 0; ms_count < ms; ++ms_count) {
 120  001a 1e03          	ldw	x,(OFST-1,sp)
 121  001c 1c0001        	addw	x,#1
 122  001f 1f03          	ldw	(OFST-1,sp),x
 124  0021               L34:
 127  0021 1e03          	ldw	x,(OFST-1,sp)
 128  0023 1305          	cpw	x,(OFST+1,sp)
 129  0025 25e1          	jrult	L73
 130                     ; 27 }
 133  0027 5b06          	addw	sp,#6
 134  0029 81            	ret
 187                     ; 29 void delay_ms(uint16_t ms)
 187                     ; 30 {
 188                     	switch	.text
 189  002a               _delay_ms:
 191  002a 5204          	subw	sp,#4
 192       00000004      OFST:	set	4
 195                     ; 33 	uint16_t targ = ms * 0.4;
 197  002c cd0000        	call	c_uitof
 199  002f ae0004        	ldw	x,#L701
 200  0032 cd0000        	call	c_fmul
 202  0035 cd0000        	call	c_ftoi
 204  0038 1f01          	ldw	(OFST-3,sp),x
 206                     ; 35 	for (ms_count = 0; ms_count < targ; ++ms_count) {
 208  003a 5f            	clrw	x
 209  003b 1f03          	ldw	(OFST-1,sp),x
 212  003d 2008          	jra	L711
 213  003f               L311:
 214                     ; 36 		nop();
 217  003f 9d            nop
 219                     ; 35 	for (ms_count = 0; ms_count < targ; ++ms_count) {
 222  0040 1e03          	ldw	x,(OFST-1,sp)
 223  0042 1c0001        	addw	x,#1
 224  0045 1f03          	ldw	(OFST-1,sp),x
 226  0047               L711:
 229  0047 1e03          	ldw	x,(OFST-1,sp)
 230  0049 1301          	cpw	x,(OFST-3,sp)
 231  004b 25f2          	jrult	L311
 232                     ; 38 }
 235  004d 5b04          	addw	sp,#4
 236  004f 81            	ret
 239                     	bsct
 240  0002               L521_colour:
 241  0002 00            	dc.b	0
 242  0003 00            	dc.b	0
 243  0004 00            	dc.b	0
 286                     ; 45 void ws_write_byte_top(uint8_t byte)
 286                     ; 46 {
 287                     	switch	.text
 288  0050               _ws_write_byte_top:
 290  0050 88            	push	a
 291  0051 88            	push	a
 292       00000001      OFST:	set	1
 295                     ; 48     for (mask = 0x80; mask != 0; mask >>= 1) {
 297  0052 a680          	ld	a,#128
 298  0054 6b01          	ld	(OFST+0,sp),a
 300  0056               L151:
 301                     ; 49         if ((byte & mask) != 0) {
 303  0056 7b02          	ld	a,(OFST+1,sp)
 304  0058 1501          	bcp	a,(OFST+0,sp)
 305  005a 2716          	jreq	L751
 306                     ; 51             _asm("bset 20480, #1");
 309  005c 72125000      bset 20480, #1
 311                     ; 54             nop(); nop(); nop(); nop();
 314  0060 9d            nop
 320  0061 9d            nop
 326  0062 9d            nop
 332  0063 9d            nop
 334                     ; 55             nop(); nop(); nop(); nop();
 338  0064 9d            nop
 344  0065 9d            nop
 350  0066 9d            nop
 356  0067 9d            nop
 358                     ; 56 						nop(); nop(); nop(); nop();
 362  0068 9d            nop
 368  0069 9d            nop
 374  006a 9d            nop
 380  006b 9d            nop
 382                     ; 59             _asm("bres 20480, #1");
 386  006c 72135000      bres 20480, #1
 389  0070 2011          	jra	L161
 390  0072               L751:
 391                     ; 66             _asm("bset 20480, #1");
 394  0072 72125000      bset 20480, #1
 396                     ; 69             nop(); nop(); nop(); nop();
 399  0076 9d            nop
 405  0077 9d            nop
 411  0078 9d            nop
 417  0079 9d            nop
 419                     ; 70 						nop(); nop();
 423  007a 9d            nop
 429  007b 9d            nop
 431                     ; 73             _asm("bres 20480, #1");
 435  007c 72135000      bres 20480, #1
 437                     ; 76             nop(); nop(); nop();
 440  0080 9d            nop
 446  0081 9d            nop
 452  0082 9d            nop
 454  0083               L161:
 455                     ; 48     for (mask = 0x80; mask != 0; mask >>= 1) {
 457  0083 0401          	srl	(OFST+0,sp)
 461  0085 0d01          	tnz	(OFST+0,sp)
 462  0087 26cd          	jrne	L151
 463                     ; 80 }
 466  0089 85            	popw	x
 467  008a 81            	ret
 512                     ; 81 void ws_write_byte_bot(uint8_t byte)
 512                     ; 82 {
 513                     	switch	.text
 514  008b               _ws_write_byte_bot:
 516  008b 88            	push	a
 517  008c 88            	push	a
 518       00000001      OFST:	set	1
 521                     ; 84     for (mask = 0x80; mask != 0; mask >>= 1) {
 523  008d a680          	ld	a,#128
 524  008f 6b01          	ld	(OFST+0,sp),a
 526  0091               L502:
 527                     ; 85         if ((byte & mask) != 0) {
 529  0091 7b02          	ld	a,(OFST+1,sp)
 530  0093 1501          	bcp	a,(OFST+0,sp)
 531  0095 2716          	jreq	L312
 532                     ; 87             _asm("bset 20480, #2");
 535  0097 72145000      bset 20480, #2
 537                     ; 90             nop(); nop(); nop(); nop();
 540  009b 9d            nop
 546  009c 9d            nop
 552  009d 9d            nop
 558  009e 9d            nop
 560                     ; 91             nop(); nop(); nop(); nop();
 564  009f 9d            nop
 570  00a0 9d            nop
 576  00a1 9d            nop
 582  00a2 9d            nop
 584                     ; 92 						nop(); nop(); nop(); nop();
 588  00a3 9d            nop
 594  00a4 9d            nop
 600  00a5 9d            nop
 606  00a6 9d            nop
 608                     ; 95             _asm("bres 20480, #2");
 612  00a7 72155000      bres 20480, #2
 615  00ab 2011          	jra	L512
 616  00ad               L312:
 617                     ; 102             _asm("bset 20480, #2");
 620  00ad 72145000      bset 20480, #2
 622                     ; 105             nop(); nop(); nop(); nop();
 625  00b1 9d            nop
 631  00b2 9d            nop
 637  00b3 9d            nop
 643  00b4 9d            nop
 645                     ; 106 						nop(); nop();
 649  00b5 9d            nop
 655  00b6 9d            nop
 657                     ; 109             _asm("bres 20480, #2");
 661  00b7 72155000      bres 20480, #2
 663                     ; 112             nop(); nop(); nop();
 666  00bb 9d            nop
 672  00bc 9d            nop
 678  00bd 9d            nop
 680  00be               L512:
 681                     ; 84     for (mask = 0x80; mask != 0; mask >>= 1) {
 683  00be 0401          	srl	(OFST+0,sp)
 687  00c0 0d01          	tnz	(OFST+0,sp)
 688  00c2 26cd          	jrne	L502
 689                     ; 116 }
 692  00c4 85            	popw	x
 693  00c5 81            	ret
 738                     ; 118 void ws_write_grb_top(uint8_t* colour)
 738                     ; 119 {
 739                     	switch	.text
 740  00c6               _ws_write_grb_top:
 742  00c6 89            	pushw	x
 743  00c7 88            	push	a
 744       00000001      OFST:	set	1
 747                     ; 121     for (i = 0; i < 3; ++i) {
 749  00c8 0f01          	clr	(OFST+0,sp)
 751  00ca               L142:
 752                     ; 122         ws_write_byte_top(colour[i]);
 754  00ca 7b01          	ld	a,(OFST+0,sp)
 755  00cc 5f            	clrw	x
 756  00cd 97            	ld	xl,a
 757  00ce 72fb02        	addw	x,(OFST+1,sp)
 758  00d1 f6            	ld	a,(x)
 759  00d2 cd0050        	call	_ws_write_byte_top
 761                     ; 121     for (i = 0; i < 3; ++i) {
 763  00d5 0c01          	inc	(OFST+0,sp)
 767  00d7 7b01          	ld	a,(OFST+0,sp)
 768  00d9 a103          	cp	a,#3
 769  00db 25ed          	jrult	L142
 770                     ; 124 }
 773  00dd 5b03          	addw	sp,#3
 774  00df 81            	ret
 819                     ; 126 void ws_write_grb_bot(uint8_t* colour)
 819                     ; 127 {
 820                     	switch	.text
 821  00e0               _ws_write_grb_bot:
 823  00e0 89            	pushw	x
 824  00e1 88            	push	a
 825       00000001      OFST:	set	1
 828                     ; 129     for (i = 0; i < 3; ++i) {
 830  00e2 0f01          	clr	(OFST+0,sp)
 832  00e4               L172:
 833                     ; 130         ws_write_byte_bot(colour[i]);
 835  00e4 7b01          	ld	a,(OFST+0,sp)
 836  00e6 5f            	clrw	x
 837  00e7 97            	ld	xl,a
 838  00e8 72fb02        	addw	x,(OFST+1,sp)
 839  00eb f6            	ld	a,(x)
 840  00ec ad9d          	call	_ws_write_byte_bot
 842                     ; 129     for (i = 0; i < 3; ++i) {
 844  00ee 0c01          	inc	(OFST+0,sp)
 848  00f0 7b01          	ld	a,(OFST+0,sp)
 849  00f2 a103          	cp	a,#3
 850  00f4 25ee          	jrult	L172
 851                     ; 132 }
 854  00f6 5b03          	addw	sp,#3
 855  00f8 81            	ret
 904                     ; 134 void write_display(uint8_t (*lights)[3])
 904                     ; 135 {
 905                     	switch	.text
 906  00f9               _write_display:
 908  00f9 89            	pushw	x
 909  00fa 88            	push	a
 910       00000001      OFST:	set	1
 913                     ; 137 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); //2MHz
 915  00fb 4f            	clr	a
 916  00fc cd0000        	call	_CLK_HSIPrescalerConfig
 918                     ; 138 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); // 15.625kHz
 920  00ff a680          	ld	a,#128
 921  0101 cd0000        	call	_CLK_SYSCLKConfig
 923                     ; 140 	for (i = 0; i < 3*NUM_LEDS_HALF; ++i) {
 925  0104 0f01          	clr	(OFST+0,sp)
 927  0106               L123:
 928                     ; 141 		ws_write_grb_top(lights[i]);
 930  0106 7b01          	ld	a,(OFST+0,sp)
 931  0108 97            	ld	xl,a
 932  0109 a603          	ld	a,#3
 933  010b 42            	mul	x,a
 934  010c 72fb02        	addw	x,(OFST+1,sp)
 935  010f adb5          	call	_ws_write_grb_top
 937                     ; 140 	for (i = 0; i < 3*NUM_LEDS_HALF; ++i) {
 939  0111 0c01          	inc	(OFST+0,sp)
 943  0113 7b01          	ld	a,(OFST+0,sp)
 944  0115 a10c          	cp	a,#12
 945  0117 25ed          	jrult	L123
 946                     ; 144 	for (i = 0; i < 3*NUM_LEDS_HALF; ++i) {
 948  0119 0f01          	clr	(OFST+0,sp)
 950  011b               L723:
 951                     ; 145 		ws_write_grb_bot(lights[NUM_LEDS-i-1]);
 953  011b a600          	ld	a,#0
 954  011d 97            	ld	xl,a
 955  011e a607          	ld	a,#7
 956  0120 1001          	sub	a,(OFST+0,sp)
 957  0122 2401          	jrnc	L22
 958  0124 5a            	decw	x
 959  0125               L22:
 960  0125 02            	rlwa	x,a
 961  0126 a603          	ld	a,#3
 962  0128 cd0000        	call	c_bmulx
 964  012b 72fb02        	addw	x,(OFST+1,sp)
 965  012e adb0          	call	_ws_write_grb_bot
 967                     ; 144 	for (i = 0; i < 3*NUM_LEDS_HALF; ++i) {
 969  0130 0c01          	inc	(OFST+0,sp)
 973  0132 7b01          	ld	a,(OFST+0,sp)
 974  0134 a10c          	cp	a,#12
 975  0136 25e3          	jrult	L723
 976                     ; 147 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8); //2MHz
 978  0138 a618          	ld	a,#24
 979  013a cd0000        	call	_CLK_HSIPrescalerConfig
 981                     ; 148 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV128); // 15.625kHz
 983  013d a687          	ld	a,#135
 984  013f cd0000        	call	_CLK_SYSCLKConfig
 986                     ; 149 }
 989  0142 5b03          	addw	sp,#3
 990  0144 81            	ret
1034                     ; 151 void clear_lights(void)
1034                     ; 152 {
1035                     	switch	.text
1036  0145               _clear_lights:
1038  0145 89            	pushw	x
1039       00000002      OFST:	set	2
1042                     ; 154 		for (j = 0; j < NUM_COLOURS; ++j) {
1044  0146 0f02          	clr	(OFST+0,sp)
1046  0148               L753:
1047                     ; 156 			for (i = 0; i < NUM_LEDS; ++i) {
1049  0148 0f01          	clr	(OFST-1,sp)
1051  014a               L563:
1052                     ; 157 				lights[i][j] = 0;
1054  014a 7b01          	ld	a,(OFST-1,sp)
1055  014c 97            	ld	xl,a
1056  014d a603          	ld	a,#3
1057  014f 42            	mul	x,a
1058  0150 01            	rrwa	x,a
1059  0151 1b02          	add	a,(OFST+0,sp)
1060  0153 2401          	jrnc	L62
1061  0155 5c            	incw	x
1062  0156               L62:
1063  0156 02            	rlwa	x,a
1064  0157 6f00          	clr	(L321_lights,x)
1065                     ; 156 			for (i = 0; i < NUM_LEDS; ++i) {
1067  0159 0c01          	inc	(OFST-1,sp)
1071  015b 7b01          	ld	a,(OFST-1,sp)
1072  015d a108          	cp	a,#8
1073  015f 25e9          	jrult	L563
1074                     ; 154 		for (j = 0; j < NUM_COLOURS; ++j) {
1076  0161 0c02          	inc	(OFST+0,sp)
1080  0163 7b02          	ld	a,(OFST+0,sp)
1081  0165 a103          	cp	a,#3
1082  0167 25df          	jrult	L753
1083                     ; 160 }
1086  0169 85            	popw	x
1087  016a 81            	ret
1141                     ; 162 void setAllSameColour(uint8_t* colour){
1142                     	switch	.text
1143  016b               _setAllSameColour:
1145  016b 89            	pushw	x
1146  016c 89            	pushw	x
1147       00000002      OFST:	set	2
1150                     ; 164 		for (i = 0; i < NUM_LEDS; ++i) {
1152  016d 0f02          	clr	(OFST+0,sp)
1154  016f               L124:
1155                     ; 166 			for (j = 0; j < NUM_COLOURS; ++j) {
1157  016f 0f01          	clr	(OFST-1,sp)
1159  0171               L724:
1160                     ; 167 				lights[i][j] = colour[j];
1162  0171 7b02          	ld	a,(OFST+0,sp)
1163  0173 97            	ld	xl,a
1164  0174 a603          	ld	a,#3
1165  0176 42            	mul	x,a
1166  0177 01            	rrwa	x,a
1167  0178 1b01          	add	a,(OFST-1,sp)
1168  017a 2401          	jrnc	L23
1169  017c 5c            	incw	x
1170  017d               L23:
1171  017d 02            	rlwa	x,a
1172  017e 7b01          	ld	a,(OFST-1,sp)
1173  0180 905f          	clrw	y
1174  0182 9097          	ld	yl,a
1175  0184 72f903        	addw	y,(OFST+1,sp)
1176  0187 90f6          	ld	a,(y)
1177  0189 e700          	ld	(L321_lights,x),a
1178                     ; 166 			for (j = 0; j < NUM_COLOURS; ++j) {
1180  018b 0c01          	inc	(OFST-1,sp)
1184  018d 7b01          	ld	a,(OFST-1,sp)
1185  018f a103          	cp	a,#3
1186  0191 25de          	jrult	L724
1187                     ; 164 		for (i = 0; i < NUM_LEDS; ++i) {
1189  0193 0c02          	inc	(OFST+0,sp)
1193  0195 7b02          	ld	a,(OFST+0,sp)
1194  0197 a108          	cp	a,#8
1195  0199 25d4          	jrult	L124
1196                     ; 170 }
1199  019b 5b04          	addw	sp,#4
1200  019d 81            	ret
1258                     ; 172 void RGBSpin(void)
1258                     ; 173 {
1259                     	switch	.text
1260  019e               _RGBSpin:
1262  019e 5205          	subw	sp,#5
1263       00000005      OFST:	set	5
1266                     ; 175 	int8_t j = 0;
1268  01a0 0f04          	clr	(OFST-1,sp)
1270                     ; 176 	int8_t i = 0;
1272  01a2 0f05          	clr	(OFST+0,sp)
1274                     ; 177 	uint8_t press = 0;
1276                     ; 179 	change = FALSE;
1278  01a4 3f01          	clr	_change
1280  01a6 206c          	jra	L764
1281  01a8               L364:
1282                     ; 181 		clear_lights();
1284  01a8 ad9b          	call	_clear_lights
1286                     ; 182 		lights[i][j] = MAX_BRIGHTNESS;
1288  01aa 7b04          	ld	a,(OFST-1,sp)
1289  01ac 5f            	clrw	x
1290  01ad 4d            	tnz	a
1291  01ae 2a01          	jrpl	L63
1292  01b0 53            	cplw	x
1293  01b1               L63:
1294  01b1 97            	ld	xl,a
1295  01b2 1f01          	ldw	(OFST-4,sp),x
1297  01b4 7b05          	ld	a,(OFST+0,sp)
1298  01b6 5f            	clrw	x
1299  01b7 4d            	tnz	a
1300  01b8 2a01          	jrpl	L04
1301  01ba 53            	cplw	x
1302  01bb               L04:
1303  01bb 97            	ld	xl,a
1304  01bc a603          	ld	a,#3
1305  01be cd0000        	call	c_bmulx
1307  01c1 72fb01        	addw	x,(OFST-4,sp)
1308  01c4 a61e          	ld	a,#30
1309  01c6 e700          	ld	(L321_lights,x),a
1310                     ; 183 		write_display(lights);
1312  01c8 ae0000        	ldw	x,#L321_lights
1313  01cb cd00f9        	call	_write_display
1315                     ; 185 		i += dir;
1317  01ce 7b05          	ld	a,(OFST+0,sp)
1318  01d0 bb00          	add	a,_dir
1319  01d2 6b05          	ld	(OFST+0,sp),a
1321                     ; 186 		i = (i==-1) ? NUM_LEDS-1 : i;
1323  01d4 7b05          	ld	a,(OFST+0,sp)
1324  01d6 a1ff          	cp	a,#255
1325  01d8 2604          	jrne	L24
1326  01da a607          	ld	a,#7
1327  01dc 2002          	jra	L44
1328  01de               L24:
1329  01de 7b05          	ld	a,(OFST+0,sp)
1330  01e0               L44:
1331  01e0 6b05          	ld	(OFST+0,sp),a
1333                     ; 187 		i %= NUM_LEDS;
1335  01e2 7b05          	ld	a,(OFST+0,sp)
1336  01e4 ae0008        	ldw	x,#8
1337  01e7 51            	exgw	x,y
1338  01e8 5f            	clrw	x
1339  01e9 4d            	tnz	a
1340  01ea 2a01          	jrpl	L64
1341  01ec 5a            	decw	x
1342  01ed               L64:
1343  01ed 02            	rlwa	x,a
1344  01ee cd0000        	call	c_idiv
1346  01f1 909f          	ld	a,yl
1347  01f3 6b05          	ld	(OFST+0,sp),a
1349                     ; 189 		if(i==0){
1351  01f5 0d05          	tnz	(OFST+0,sp)
1352  01f7 2615          	jrne	L374
1353                     ; 190 			j += 1;
1355  01f9 0c04          	inc	(OFST-1,sp)
1357                     ; 191 			j %= NUM_COLOURS;
1359  01fb 7b04          	ld	a,(OFST-1,sp)
1360  01fd ae0003        	ldw	x,#3
1361  0200 51            	exgw	x,y
1362  0201 5f            	clrw	x
1363  0202 4d            	tnz	a
1364  0203 2a01          	jrpl	L05
1365  0205 5a            	decw	x
1366  0206               L05:
1367  0206 02            	rlwa	x,a
1368  0207 cd0000        	call	c_idiv
1370  020a 909f          	ld	a,yl
1371  020c 6b04          	ld	(OFST-1,sp),a
1373  020e               L374:
1374                     ; 193 		delay_ms(125);
1376  020e ae007d        	ldw	x,#125
1377  0211 cd002a        	call	_delay_ms
1379  0214               L764:
1380                     ; 180 	while (!change) {
1382  0214 3d01          	tnz	_change
1383  0216 2790          	jreq	L364
1384                     ; 195 }
1387  0218 5b05          	addw	sp,#5
1388  021a 81            	ret
1422                     ; 197 uint8_t linearSine(uint8_t val){
1423                     	switch	.text
1424  021b               _linearSine:
1426  021b 88            	push	a
1427       00000000      OFST:	set	0
1430                     ; 198 	val %= 256;
1432  021c 7b01          	ld	a,(OFST+1,sp)
1433  021e a4ff          	and	a,#255
1434  0220 6b01          	ld	(OFST+1,sp),a
1435                     ; 199 	if(val < 128){
1437  0222 7b01          	ld	a,(OFST+1,sp)
1438  0224 a180          	cp	a,#128
1439  0226 2405          	jruge	L315
1440                     ; 200 		return(val);
1442  0228 7b01          	ld	a,(OFST+1,sp)
1445  022a 5b01          	addw	sp,#1
1446  022c 81            	ret
1447  022d               L315:
1448                     ; 201 	} else if (val > 128){
1450  022d 7b01          	ld	a,(OFST+1,sp)
1451  022f a181          	cp	a,#129
1452  0231 2507          	jrult	L515
1453                     ; 202 		return(256 - val);
1455  0233 a600          	ld	a,#0
1456  0235 1001          	sub	a,(OFST+1,sp)
1459  0237 5b01          	addw	sp,#1
1460  0239 81            	ret
1461  023a               L515:
1462                     ; 204 }	
1465  023a 5b01          	addw	sp,#1
1466  023c 81            	ret
1544                     ; 206 void rainbowFade(void)
1544                     ; 207 {
1545                     	switch	.text
1546  023d               _rainbowFade:
1548  023d 520c          	subw	sp,#12
1549       0000000c      OFST:	set	12
1552                     ; 208 	uint8_t hue = 0;
1554  023f 0f0c          	clr	(OFST+0,sp)
1556                     ; 209 	uint8_t red = 0;
1558                     ; 210 	uint8_t green = 0;
1560                     ; 211 	uint8_t blue = 0;
1562                     ; 212 	float scale = MAX_BRIGHTNESS*1.0/256;
1564  0241 ce0002        	ldw	x,L365+2
1565  0244 1f0a          	ldw	(OFST-2,sp),x
1566  0246 ce0000        	ldw	x,L365
1567  0249 1f08          	ldw	(OFST-4,sp),x
1569                     ; 215 	change = FALSE;
1571  024b 3f01          	clr	_change
1573  024d ace002e0      	jpf	L375
1574  0251               L765:
1575                     ; 218 		colour[0] = linearSine(hue)*scale;
1577  0251 7b0c          	ld	a,(OFST+0,sp)
1578  0253 adc6          	call	_linearSine
1580  0255 5f            	clrw	x
1581  0256 97            	ld	xl,a
1582  0257 cd0000        	call	c_itof
1584  025a 96            	ldw	x,sp
1585  025b 1c0001        	addw	x,#OFST-11
1586  025e cd0000        	call	c_rtol
1589  0261 96            	ldw	x,sp
1590  0262 1c0008        	addw	x,#OFST-4
1591  0265 cd0000        	call	c_ltor
1593  0268 96            	ldw	x,sp
1594  0269 1c0001        	addw	x,#OFST-11
1595  026c cd0000        	call	c_fmul
1597  026f cd0000        	call	c_ftol
1599  0272 b603          	ld	a,c_lreg+3
1600  0274 b702          	ld	L521_colour,a
1601                     ; 219 		colour[1] = linearSine(hue-128)*scale;
1603  0276 7b0c          	ld	a,(OFST+0,sp)
1604  0278 a080          	sub	a,#128
1605  027a ad9f          	call	_linearSine
1607  027c 5f            	clrw	x
1608  027d 97            	ld	xl,a
1609  027e cd0000        	call	c_itof
1611  0281 96            	ldw	x,sp
1612  0282 1c0001        	addw	x,#OFST-11
1613  0285 cd0000        	call	c_rtol
1616  0288 96            	ldw	x,sp
1617  0289 1c0008        	addw	x,#OFST-4
1618  028c cd0000        	call	c_ltor
1620  028f 96            	ldw	x,sp
1621  0290 1c0001        	addw	x,#OFST-11
1622  0293 cd0000        	call	c_fmul
1624  0296 cd0000        	call	c_ftol
1626  0299 b603          	ld	a,c_lreg+3
1627  029b b703          	ld	L521_colour+1,a
1628                     ; 220 		colour[2] = linearSine(hue+128)*scale;
1630  029d 7b0c          	ld	a,(OFST+0,sp)
1631  029f ab80          	add	a,#128
1632  02a1 cd021b        	call	_linearSine
1634  02a4 5f            	clrw	x
1635  02a5 97            	ld	xl,a
1636  02a6 cd0000        	call	c_itof
1638  02a9 96            	ldw	x,sp
1639  02aa 1c0001        	addw	x,#OFST-11
1640  02ad cd0000        	call	c_rtol
1643  02b0 96            	ldw	x,sp
1644  02b1 1c0008        	addw	x,#OFST-4
1645  02b4 cd0000        	call	c_ltor
1647  02b7 96            	ldw	x,sp
1648  02b8 1c0001        	addw	x,#OFST-11
1649  02bb cd0000        	call	c_fmul
1651  02be cd0000        	call	c_ftol
1653  02c1 b603          	ld	a,c_lreg+3
1654  02c3 b704          	ld	L521_colour+2,a
1655                     ; 222 		clear_lights();
1657  02c5 cd0145        	call	_clear_lights
1659                     ; 223 		setAllSameColour(colour); 
1661  02c8 ae0002        	ldw	x,#L521_colour
1662  02cb cd016b        	call	_setAllSameColour
1664                     ; 224 		write_display(lights);
1666  02ce ae0000        	ldw	x,#L321_lights
1667  02d1 cd00f9        	call	_write_display
1669                     ; 226 		hue += 5;
1671  02d4 7b0c          	ld	a,(OFST+0,sp)
1672  02d6 ab05          	add	a,#5
1673  02d8 6b0c          	ld	(OFST+0,sp),a
1675                     ; 228 		delay_ms(50);
1677  02da ae0032        	ldw	x,#50
1678  02dd cd002a        	call	_delay_ms
1680  02e0               L375:
1681                     ; 216 	while(!change){
1683  02e0 3d01          	tnz	_change
1684  02e2 2603          	jrne	L65
1685  02e4 cc0251        	jp	L765
1686  02e7               L65:
1687                     ; 230 }
1690  02e7 5b0c          	addw	sp,#12
1691  02e9 81            	ret
1714                     ; 232 void init_tim2(void){
1715                     	switch	.text
1716  02ea               _init_tim2:
1720                     ; 234 	TIM2->PSCR |= 0x0E; // set prescaler to 16384 ~ 1kHz
1722  02ea c6530e        	ld	a,21262
1723  02ed aa0e          	or	a,#14
1724  02ef c7530e        	ld	21262,a
1725                     ; 235 	TIM2->ARRH = 0x13;
1727  02f2 3513530f      	mov	21263,#19
1728                     ; 236 	TIM2->ARRL = 0x88; 
1730  02f6 35885310      	mov	21264,#136
1731                     ; 237 	TIM2->IER |= 0x1; // generate interrupt
1733  02fa 72105303      	bset	21251,#0
1734                     ; 239 }
1737  02fe 81            	ret
1774                     ; 243 int main(void) {
1775                     	switch	.text
1776  02ff               _main:
1780                     ; 246 	sim();
1783  02ff 9b            sim
1785                     ; 247 	CLK_DeInit();
1788  0300 cd0000        	call	_CLK_DeInit
1790                     ; 248 	CLK_HSECmd(DISABLE);
1792  0303 4f            	clr	a
1793  0304 cd0000        	call	_CLK_HSECmd
1795                     ; 249 	CLK_HSICmd(ENABLE);
1797  0307 a601          	ld	a,#1
1798  0309 cd0000        	call	_CLK_HSICmd
1800                     ; 253 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8); //2MHz
1802  030c a618          	ld	a,#24
1803  030e cd0000        	call	_CLK_HSIPrescalerConfig
1805                     ; 254 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV128); // 15.625kHz
1807  0311 a687          	ld	a,#135
1808  0313 cd0000        	call	_CLK_SYSCLKConfig
1810                     ; 257 	GPIO_DeInit(GPIOA);
1812  0316 ae5000        	ldw	x,#20480
1813  0319 cd0000        	call	_GPIO_DeInit
1815                     ; 258 	GPIO_Init(GPIOA, GPIO_PIN_1, GPIO_MODE_OUT_PP_LOW_FAST);
1817  031c 4be0          	push	#224
1818  031e 4b02          	push	#2
1819  0320 ae5000        	ldw	x,#20480
1820  0323 cd0000        	call	_GPIO_Init
1822  0326 85            	popw	x
1823                     ; 259 	GPIO_Init(GPIOA, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
1825  0327 4be0          	push	#224
1826  0329 4b04          	push	#4
1827  032b ae5000        	ldw	x,#20480
1828  032e cd0000        	call	_GPIO_Init
1830  0331 85            	popw	x
1831                     ; 261 	GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_IN_FL_IT);
1833  0332 4b20          	push	#32
1834  0334 4b10          	push	#16
1835  0336 ae5005        	ldw	x,#20485
1836  0339 cd0000        	call	_GPIO_Init
1838  033c 85            	popw	x
1839                     ; 262 	EXTI->CR1 &= ~(1 << 3);
1841  033d 721750a0      	bres	20640,#3
1842                     ; 263 	EXTI->CR1 |= (1 << 2);
1844  0341 721450a0      	bset	20640,#2
1845                     ; 266 	clear_lights();
1847  0345 cd0145        	call	_clear_lights
1849                     ; 268 	init_tim2();
1851  0348 ada0          	call	_init_tim2
1853                     ; 272 	rim();
1856  034a 9a            rim
1858  034b               L716:
1859                     ; 275 		dir = CW;
1861  034b 35010000      	mov	_dir,#1
1862                     ; 276 		RGBSpin();
1864  034f cd019e        	call	_RGBSpin
1866                     ; 278 		dir = CCW;
1868  0352 35ff0000      	mov	_dir,#255
1869                     ; 279 		RGBSpin();
1871  0356 cd019e        	call	_RGBSpin
1873                     ; 281 		rainbowFade();
1875  0359 cd023d        	call	_rainbowFade
1878  035c 20ed          	jra	L716
1902                     ; 287 @far @interrupt void buttonHandler(void)
1902                     ; 288 {
1904                     	switch	.text
1905  035e               f_buttonHandler:
1909                     ; 291 	change = TRUE;
1911  035e 35010001      	mov	_change,#1
1912                     ; 293 }
1915  0362 80            	iret
1941                     ; 295 @far @interrupt void tim2Handler(void)
1941                     ; 296 {
1942                     	switch	.text
1943  0363               f_tim2Handler:
1945  0363 8a            	push	cc
1946  0364 84            	pop	a
1947  0365 a4bf          	and	a,#191
1948  0367 88            	push	a
1949  0368 86            	pop	cc
1950  0369 3b0002        	push	c_x+2
1951  036c be00          	ldw	x,c_x
1952  036e 89            	pushw	x
1953  036f 3b0002        	push	c_y+2
1954  0372 be00          	ldw	x,c_y
1955  0374 89            	pushw	x
1958                     ; 297 	TIM2->SR1 &= ~0x01; // clear status register
1960  0375 72115304      	bres	21252,#0
1961                     ; 300 	clear_lights();
1963  0379 cd0145        	call	_clear_lights
1965                     ; 301 	write_display(lights);
1967  037c ae0000        	ldw	x,#L321_lights
1968  037f cd00f9        	call	_write_display
1970                     ; 303 	halt();
1973  0382 8e            halt
1975                     ; 305 }
1979  0383 85            	popw	x
1980  0384 bf00          	ldw	c_y,x
1981  0386 320002        	pop	c_y+2
1982  0389 85            	popw	x
1983  038a bf00          	ldw	c_x,x
1984  038c 320002        	pop	c_x+2
1985  038f 80            	iret
2059                     	xdef	f_tim2Handler
2060                     	xdef	f_buttonHandler
2061                     	xdef	_main
2062                     	xdef	_init_tim2
2063                     	xdef	_rainbowFade
2064                     	xdef	_linearSine
2065                     	xdef	_RGBSpin
2066                     	xdef	_setAllSameColour
2067                     	xdef	_clear_lights
2068                     	xdef	_write_display
2069                     	xdef	_ws_write_grb_bot
2070                     	xdef	_ws_write_grb_top
2071                     	xdef	_ws_write_byte_bot
2072                     	xdef	_ws_write_byte_top
2073                     	switch	.ubsct
2074  0000               L321_lights:
2075  0000 000000000000  	ds.b	24
2076                     	xdef	_delay_ms
2077                     	xdef	_delay_ms_HS
2078                     	xdef	_change
2079                     	xdef	_dir
2080                     	xref	_GPIO_Init
2081                     	xref	_GPIO_DeInit
2082                     	xref	_CLK_SYSCLKConfig
2083                     	xref	_CLK_HSIPrescalerConfig
2084                     	xref	_CLK_HSICmd
2085                     	xref	_CLK_HSECmd
2086                     	xref	_CLK_DeInit
2087                     .const:	section	.text
2088  0000               L365:
2089  0000 3df00000      	dc.w	15856,0
2090  0004               L701:
2091  0004 3ecccccc      	dc.w	16076,-13108
2092                     	xref.b	c_lreg
2093                     	xref.b	c_x
2094                     	xref.b	c_y
2114                     	xref	c_ftol
2115                     	xref	c_rtol
2116                     	xref	c_itof
2117                     	xref	c_ltor
2118                     	xref	c_idiv
2119                     	xref	c_bmulx
2120                     	xref	c_ftoi
2121                     	xref	c_fmul
2122                     	xref	c_uitof
2123                     	end
