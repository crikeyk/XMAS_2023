   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  72                     ; 15 void delay_ms(uint16_t ms)
  72                     ; 16 {
  74                     	switch	.text
  75  0000               _delay_ms:
  77  0000 89            	pushw	x
  78  0001 5204          	subw	sp,#4
  79       00000004      OFST:	set	4
  82                     ; 18 	for (ms_count = 0; ms_count < ms; ++ms_count) {
  84  0003 5f            	clrw	x
  85  0004 1f03          	ldw	(OFST-1,sp),x
  88  0006 2019          	jra	L34
  89  0008               L73:
  90                     ; 20 		for (ticks = 0; ticks < 1074; ++ticks) {
  92  0008 5f            	clrw	x
  93  0009 1f01          	ldw	(OFST-3,sp),x
  95  000b               L74:
  96                     ; 21 			nop();
  99  000b 9d            nop
 101                     ; 20 		for (ticks = 0; ticks < 1074; ++ticks) {
 104  000c 1e01          	ldw	x,(OFST-3,sp)
 105  000e 1c0001        	addw	x,#1
 106  0011 1f01          	ldw	(OFST-3,sp),x
 110  0013 1e01          	ldw	x,(OFST-3,sp)
 111  0015 a30432        	cpw	x,#1074
 112  0018 25f1          	jrult	L74
 113                     ; 18 	for (ms_count = 0; ms_count < ms; ++ms_count) {
 115  001a 1e03          	ldw	x,(OFST-1,sp)
 116  001c 1c0001        	addw	x,#1
 117  001f 1f03          	ldw	(OFST-1,sp),x
 119  0021               L34:
 122  0021 1e03          	ldw	x,(OFST-1,sp)
 123  0023 1305          	cpw	x,(OFST+1,sp)
 124  0025 25e1          	jrult	L73
 125                     ; 24 }
 128  0027 5b06          	addw	sp,#6
 129  0029 81            	ret
 132                     	bsct
 133  0000               L75_colour:
 134  0000 00            	dc.b	0
 135  0001 00            	dc.b	0
 136  0002 00            	dc.b	0
 179                     ; 31 void ws_write_byte_top(uint8_t byte)
 179                     ; 32 {
 180                     	switch	.text
 181  002a               _ws_write_byte_top:
 183  002a 88            	push	a
 184  002b 88            	push	a
 185       00000001      OFST:	set	1
 188                     ; 34     for (mask = 0x80; mask != 0; mask >>= 1) {
 190  002c a680          	ld	a,#128
 191  002e 6b01          	ld	(OFST+0,sp),a
 193  0030               L301:
 194                     ; 35         if ((byte & mask) != 0) {
 196  0030 7b02          	ld	a,(OFST+1,sp)
 197  0032 1501          	bcp	a,(OFST+0,sp)
 198  0034 2716          	jreq	L111
 199                     ; 37             _asm("bset 20480, #1");
 202  0036 72125000      bset 20480, #1
 204                     ; 40             nop(); nop(); nop(); nop();
 207  003a 9d            nop
 213  003b 9d            nop
 219  003c 9d            nop
 225  003d 9d            nop
 227                     ; 41             nop(); nop(); nop(); nop();
 231  003e 9d            nop
 237  003f 9d            nop
 243  0040 9d            nop
 249  0041 9d            nop
 251                     ; 42 						nop(); nop(); nop(); nop();
 255  0042 9d            nop
 261  0043 9d            nop
 267  0044 9d            nop
 273  0045 9d            nop
 275                     ; 45             _asm("bres 20480, #1");
 279  0046 72135000      bres 20480, #1
 282  004a 2011          	jra	L311
 283  004c               L111:
 284                     ; 52             _asm("bset 20480, #1");
 287  004c 72125000      bset 20480, #1
 289                     ; 55             nop(); nop(); nop(); nop();
 292  0050 9d            nop
 298  0051 9d            nop
 304  0052 9d            nop
 310  0053 9d            nop
 312                     ; 56 						nop(); nop();
 316  0054 9d            nop
 322  0055 9d            nop
 324                     ; 59             _asm("bres 20480, #1");
 328  0056 72135000      bres 20480, #1
 330                     ; 62             nop(); nop(); nop();
 333  005a 9d            nop
 339  005b 9d            nop
 345  005c 9d            nop
 347  005d               L311:
 348                     ; 34     for (mask = 0x80; mask != 0; mask >>= 1) {
 350  005d 0401          	srl	(OFST+0,sp)
 354  005f 0d01          	tnz	(OFST+0,sp)
 355  0061 26cd          	jrne	L301
 356                     ; 66 }
 359  0063 85            	popw	x
 360  0064 81            	ret
 405                     ; 67 void ws_write_byte_bot(uint8_t byte)
 405                     ; 68 {
 406                     	switch	.text
 407  0065               _ws_write_byte_bot:
 409  0065 88            	push	a
 410  0066 88            	push	a
 411       00000001      OFST:	set	1
 414                     ; 70     for (mask = 0x80; mask != 0; mask >>= 1) {
 416  0067 a680          	ld	a,#128
 417  0069 6b01          	ld	(OFST+0,sp),a
 419  006b               L731:
 420                     ; 71         if ((byte & mask) != 0) {
 422  006b 7b02          	ld	a,(OFST+1,sp)
 423  006d 1501          	bcp	a,(OFST+0,sp)
 424  006f 2716          	jreq	L541
 425                     ; 73             _asm("bset 20480, #2");
 428  0071 72145000      bset 20480, #2
 430                     ; 76             nop(); nop(); nop(); nop();
 433  0075 9d            nop
 439  0076 9d            nop
 445  0077 9d            nop
 451  0078 9d            nop
 453                     ; 77             nop(); nop(); nop(); nop();
 457  0079 9d            nop
 463  007a 9d            nop
 469  007b 9d            nop
 475  007c 9d            nop
 477                     ; 78 						nop(); nop(); nop(); nop();
 481  007d 9d            nop
 487  007e 9d            nop
 493  007f 9d            nop
 499  0080 9d            nop
 501                     ; 81             _asm("bres 20480, #2");
 505  0081 72155000      bres 20480, #2
 508  0085 2011          	jra	L741
 509  0087               L541:
 510                     ; 88             _asm("bset 20480, #2");
 513  0087 72145000      bset 20480, #2
 515                     ; 91             nop(); nop(); nop(); nop();
 518  008b 9d            nop
 524  008c 9d            nop
 530  008d 9d            nop
 536  008e 9d            nop
 538                     ; 92 						nop(); nop();
 542  008f 9d            nop
 548  0090 9d            nop
 550                     ; 95             _asm("bres 20480, #2");
 554  0091 72155000      bres 20480, #2
 556                     ; 98             nop(); nop(); nop();
 559  0095 9d            nop
 565  0096 9d            nop
 571  0097 9d            nop
 573  0098               L741:
 574                     ; 70     for (mask = 0x80; mask != 0; mask >>= 1) {
 576  0098 0401          	srl	(OFST+0,sp)
 580  009a 0d01          	tnz	(OFST+0,sp)
 581  009c 26cd          	jrne	L731
 582                     ; 102 }
 585  009e 85            	popw	x
 586  009f 81            	ret
 631                     ; 104 void ws_write_grb_top(uint8_t* colour)
 631                     ; 105 {
 632                     	switch	.text
 633  00a0               _ws_write_grb_top:
 635  00a0 89            	pushw	x
 636  00a1 88            	push	a
 637       00000001      OFST:	set	1
 640                     ; 107     for (i = 0; i < 3; ++i) {
 642  00a2 0f01          	clr	(OFST+0,sp)
 644  00a4               L371:
 645                     ; 108         ws_write_byte_top(colour[i]);
 647  00a4 7b01          	ld	a,(OFST+0,sp)
 648  00a6 5f            	clrw	x
 649  00a7 97            	ld	xl,a
 650  00a8 72fb02        	addw	x,(OFST+1,sp)
 651  00ab f6            	ld	a,(x)
 652  00ac cd002a        	call	_ws_write_byte_top
 654                     ; 107     for (i = 0; i < 3; ++i) {
 656  00af 0c01          	inc	(OFST+0,sp)
 660  00b1 7b01          	ld	a,(OFST+0,sp)
 661  00b3 a103          	cp	a,#3
 662  00b5 25ed          	jrult	L371
 663                     ; 110 }
 666  00b7 5b03          	addw	sp,#3
 667  00b9 81            	ret
 712                     ; 112 void ws_write_grb_bot(uint8_t* colour)
 712                     ; 113 {
 713                     	switch	.text
 714  00ba               _ws_write_grb_bot:
 716  00ba 89            	pushw	x
 717  00bb 88            	push	a
 718       00000001      OFST:	set	1
 721                     ; 115     for (i = 0; i < 3; ++i) {
 723  00bc 0f01          	clr	(OFST+0,sp)
 725  00be               L322:
 726                     ; 116         ws_write_byte_bot(colour[i]);
 728  00be 7b01          	ld	a,(OFST+0,sp)
 729  00c0 5f            	clrw	x
 730  00c1 97            	ld	xl,a
 731  00c2 72fb02        	addw	x,(OFST+1,sp)
 732  00c5 f6            	ld	a,(x)
 733  00c6 ad9d          	call	_ws_write_byte_bot
 735                     ; 115     for (i = 0; i < 3; ++i) {
 737  00c8 0c01          	inc	(OFST+0,sp)
 741  00ca 7b01          	ld	a,(OFST+0,sp)
 742  00cc a103          	cp	a,#3
 743  00ce 25ee          	jrult	L322
 744                     ; 118 }
 747  00d0 5b03          	addw	sp,#3
 748  00d2 81            	ret
 795                     ; 120 void write_display(uint8_t (*lights)[3])
 795                     ; 121 {
 796                     	switch	.text
 797  00d3               _write_display:
 799  00d3 89            	pushw	x
 800  00d4 88            	push	a
 801       00000001      OFST:	set	1
 804                     ; 123 	for (i = 0; i < 3*NUM_LEDS_HALF; ++i) {
 806  00d5 0f01          	clr	(OFST+0,sp)
 808  00d7               L352:
 809                     ; 124 		ws_write_grb_top(lights[i]);
 811  00d7 7b01          	ld	a,(OFST+0,sp)
 812  00d9 97            	ld	xl,a
 813  00da a603          	ld	a,#3
 814  00dc 42            	mul	x,a
 815  00dd 72fb02        	addw	x,(OFST+1,sp)
 816  00e0 adbe          	call	_ws_write_grb_top
 818                     ; 123 	for (i = 0; i < 3*NUM_LEDS_HALF; ++i) {
 820  00e2 0c01          	inc	(OFST+0,sp)
 824  00e4 7b01          	ld	a,(OFST+0,sp)
 825  00e6 a10c          	cp	a,#12
 826  00e8 25ed          	jrult	L352
 827                     ; 127 	for (i = 0; i < 3*NUM_LEDS_HALF; ++i) {
 829  00ea 0f01          	clr	(OFST+0,sp)
 831  00ec               L162:
 832                     ; 128 		ws_write_grb_bot(lights[NUM_LEDS-i-1]);
 834  00ec a600          	ld	a,#0
 835  00ee 97            	ld	xl,a
 836  00ef a607          	ld	a,#7
 837  00f1 1001          	sub	a,(OFST+0,sp)
 838  00f3 2401          	jrnc	L02
 839  00f5 5a            	decw	x
 840  00f6               L02:
 841  00f6 02            	rlwa	x,a
 842  00f7 a603          	ld	a,#3
 843  00f9 cd0000        	call	c_bmulx
 845  00fc 72fb02        	addw	x,(OFST+1,sp)
 846  00ff adb9          	call	_ws_write_grb_bot
 848                     ; 127 	for (i = 0; i < 3*NUM_LEDS_HALF; ++i) {
 850  0101 0c01          	inc	(OFST+0,sp)
 854  0103 7b01          	ld	a,(OFST+0,sp)
 855  0105 a10c          	cp	a,#12
 856  0107 25e3          	jrult	L162
 857                     ; 130 }
 860  0109 5b03          	addw	sp,#3
 861  010b 81            	ret
 905                     ; 132 void clear_lights(void)
 905                     ; 133 {
 906                     	switch	.text
 907  010c               _clear_lights:
 909  010c 89            	pushw	x
 910       00000002      OFST:	set	2
 913                     ; 135 		for (j = 0; j < NUM_COLOURS; ++j) {
 915  010d 0f02          	clr	(OFST+0,sp)
 917  010f               L113:
 918                     ; 137 			for (i = 0; i < NUM_LEDS; ++i) {
 920  010f 0f01          	clr	(OFST-1,sp)
 922  0111               L713:
 923                     ; 138 				lights[i][j] = 0;
 925  0111 7b01          	ld	a,(OFST-1,sp)
 926  0113 97            	ld	xl,a
 927  0114 a603          	ld	a,#3
 928  0116 42            	mul	x,a
 929  0117 01            	rrwa	x,a
 930  0118 1b02          	add	a,(OFST+0,sp)
 931  011a 2401          	jrnc	L42
 932  011c 5c            	incw	x
 933  011d               L42:
 934  011d 02            	rlwa	x,a
 935  011e 6f00          	clr	(L55_lights,x)
 936                     ; 137 			for (i = 0; i < NUM_LEDS; ++i) {
 938  0120 0c01          	inc	(OFST-1,sp)
 942  0122 7b01          	ld	a,(OFST-1,sp)
 943  0124 a108          	cp	a,#8
 944  0126 25e9          	jrult	L713
 945                     ; 135 		for (j = 0; j < NUM_COLOURS; ++j) {
 947  0128 0c02          	inc	(OFST+0,sp)
 951  012a 7b02          	ld	a,(OFST+0,sp)
 952  012c a103          	cp	a,#3
 953  012e 25df          	jrult	L113
 954                     ; 141 }
 957  0130 85            	popw	x
 958  0131 81            	ret
1012                     ; 143 void setAllSameColour(uint8_t* colour){
1013                     	switch	.text
1014  0132               _setAllSameColour:
1016  0132 89            	pushw	x
1017  0133 89            	pushw	x
1018       00000002      OFST:	set	2
1021                     ; 145 		for (i = 0; i < NUM_LEDS; ++i) {
1023  0134 0f02          	clr	(OFST+0,sp)
1025  0136               L353:
1026                     ; 147 			for (j = 0; j < NUM_COLOURS; ++j) {
1028  0136 0f01          	clr	(OFST-1,sp)
1030  0138               L163:
1031                     ; 148 				lights[i][j] = colour[j];
1033  0138 7b02          	ld	a,(OFST+0,sp)
1034  013a 97            	ld	xl,a
1035  013b a603          	ld	a,#3
1036  013d 42            	mul	x,a
1037  013e 01            	rrwa	x,a
1038  013f 1b01          	add	a,(OFST-1,sp)
1039  0141 2401          	jrnc	L03
1040  0143 5c            	incw	x
1041  0144               L03:
1042  0144 02            	rlwa	x,a
1043  0145 7b01          	ld	a,(OFST-1,sp)
1044  0147 905f          	clrw	y
1045  0149 9097          	ld	yl,a
1046  014b 72f903        	addw	y,(OFST+1,sp)
1047  014e 90f6          	ld	a,(y)
1048  0150 e700          	ld	(L55_lights,x),a
1049                     ; 147 			for (j = 0; j < NUM_COLOURS; ++j) {
1051  0152 0c01          	inc	(OFST-1,sp)
1055  0154 7b01          	ld	a,(OFST-1,sp)
1056  0156 a103          	cp	a,#3
1057  0158 25de          	jrult	L163
1058                     ; 145 		for (i = 0; i < NUM_LEDS; ++i) {
1060  015a 0c02          	inc	(OFST+0,sp)
1064  015c 7b02          	ld	a,(OFST+0,sp)
1065  015e a108          	cp	a,#8
1066  0160 25d4          	jrult	L353
1067                     ; 151 }
1070  0162 5b04          	addw	sp,#4
1071  0164 81            	ret
1137                     ; 153 void RGBSpin(void)
1137                     ; 154 {
1138                     	switch	.text
1139  0165               _RGBSpin:
1141  0165 5206          	subw	sp,#6
1142       00000006      OFST:	set	6
1145                     ; 156 	int8_t j = 0;
1147  0167 0f03          	clr	(OFST-3,sp)
1149                     ; 157 	int8_t i = 0;
1151  0169 0f06          	clr	(OFST+0,sp)
1153                     ; 158 	int8_t dir = CW;
1155  016b a601          	ld	a,#1
1156  016d 6b04          	ld	(OFST-2,sp),a
1158                     ; 159 	uint8_t press = 0;
1160  016f               L124:
1161                     ; 162 		clear_lights();
1163  016f ad9b          	call	_clear_lights
1165                     ; 163 		lights[i][j] = MAX_BRIGHTNESS;
1167  0171 7b03          	ld	a,(OFST-3,sp)
1168  0173 5f            	clrw	x
1169  0174 4d            	tnz	a
1170  0175 2a01          	jrpl	L43
1171  0177 53            	cplw	x
1172  0178               L43:
1173  0178 97            	ld	xl,a
1174  0179 1f01          	ldw	(OFST-5,sp),x
1176  017b 7b06          	ld	a,(OFST+0,sp)
1177  017d 5f            	clrw	x
1178  017e 4d            	tnz	a
1179  017f 2a01          	jrpl	L63
1180  0181 53            	cplw	x
1181  0182               L63:
1182  0182 97            	ld	xl,a
1183  0183 a603          	ld	a,#3
1184  0185 cd0000        	call	c_bmulx
1186  0188 72fb01        	addw	x,(OFST-5,sp)
1187  018b a614          	ld	a,#20
1188  018d e700          	ld	(L55_lights,x),a
1189                     ; 164 		write_display(lights);
1191  018f ae0000        	ldw	x,#L55_lights
1192  0192 cd00d3        	call	_write_display
1194                     ; 166 		i += dir;
1196  0195 7b06          	ld	a,(OFST+0,sp)
1197  0197 1b04          	add	a,(OFST-2,sp)
1198  0199 6b06          	ld	(OFST+0,sp),a
1200                     ; 167 		i = (i==-1) ? NUM_LEDS-1 : i;
1202  019b 7b06          	ld	a,(OFST+0,sp)
1203  019d a1ff          	cp	a,#255
1204  019f 2604          	jrne	L04
1205  01a1 a607          	ld	a,#7
1206  01a3 2002          	jra	L24
1207  01a5               L04:
1208  01a5 7b06          	ld	a,(OFST+0,sp)
1209  01a7               L24:
1210  01a7 6b06          	ld	(OFST+0,sp),a
1212                     ; 168 		i %= NUM_LEDS;
1214  01a9 7b06          	ld	a,(OFST+0,sp)
1215  01ab ae0008        	ldw	x,#8
1216  01ae 51            	exgw	x,y
1217  01af 5f            	clrw	x
1218  01b0 4d            	tnz	a
1219  01b1 2a01          	jrpl	L44
1220  01b3 5a            	decw	x
1221  01b4               L44:
1222  01b4 02            	rlwa	x,a
1223  01b5 cd0000        	call	c_idiv
1225  01b8 909f          	ld	a,yl
1226  01ba 6b06          	ld	(OFST+0,sp),a
1228                     ; 170 		if(i==0){
1230  01bc 0d06          	tnz	(OFST+0,sp)
1231  01be 2615          	jrne	L524
1232                     ; 171 			j += 1;
1234  01c0 0c03          	inc	(OFST-3,sp)
1236                     ; 172 			j %= NUM_COLOURS;
1238  01c2 7b03          	ld	a,(OFST-3,sp)
1239  01c4 ae0003        	ldw	x,#3
1240  01c7 51            	exgw	x,y
1241  01c8 5f            	clrw	x
1242  01c9 4d            	tnz	a
1243  01ca 2a01          	jrpl	L64
1244  01cc 5a            	decw	x
1245  01cd               L64:
1246  01cd 02            	rlwa	x,a
1247  01ce cd0000        	call	c_idiv
1249  01d1 909f          	ld	a,yl
1250  01d3 6b03          	ld	(OFST-3,sp),a
1252  01d5               L524:
1253                     ; 175 		delay_ms(50);
1255  01d5 ae0032        	ldw	x,#50
1256  01d8 cd0000        	call	_delay_ms
1258                     ; 176 		press = GPIO_ReadInputPin(GPIOB, GPIO_PIN_4);
1260  01db 4b10          	push	#16
1261  01dd ae5005        	ldw	x,#20485
1262  01e0 cd0000        	call	_GPIO_ReadInputPin
1264  01e3 5b01          	addw	sp,#1
1265  01e5 6b05          	ld	(OFST-1,sp),a
1267                     ; 177 		delay_ms(50);
1269  01e7 ae0032        	ldw	x,#50
1270  01ea cd0000        	call	_delay_ms
1272                     ; 178 		if(GPIO_ReadInputPin(GPIOB, GPIO_PIN_4) && press){
1274  01ed 4b10          	push	#16
1275  01ef ae5005        	ldw	x,#20485
1276  01f2 cd0000        	call	_GPIO_ReadInputPin
1278  01f5 5b01          	addw	sp,#1
1279  01f7 4d            	tnz	a
1280  01f8 2712          	jreq	L724
1282  01fa 0d05          	tnz	(OFST-1,sp)
1283  01fc 270e          	jreq	L724
1284                     ; 179 			dir = (dir==CW) ? CCW : CW;
1286  01fe 7b04          	ld	a,(OFST-2,sp)
1287  0200 a101          	cp	a,#1
1288  0202 2604          	jrne	L05
1289  0204 a6ff          	ld	a,#255
1290  0206 2002          	jra	L25
1291  0208               L05:
1292  0208 a601          	ld	a,#1
1293  020a               L25:
1294  020a 6b04          	ld	(OFST-2,sp),a
1296  020c               L724:
1297                     ; 181 		press = 0;
1300  020c ac6f016f      	jpf	L124
1334                     ; 185 uint8_t linearSine(uint8_t val){
1335                     	switch	.text
1336  0210               _linearSine:
1338  0210 88            	push	a
1339       00000000      OFST:	set	0
1342                     ; 186 	val %= 256;
1344  0211 7b01          	ld	a,(OFST+1,sp)
1345  0213 a4ff          	and	a,#255
1346  0215 6b01          	ld	(OFST+1,sp),a
1347                     ; 187 	if(val < 128){
1349  0217 7b01          	ld	a,(OFST+1,sp)
1350  0219 a180          	cp	a,#128
1351  021b 2405          	jruge	L744
1352                     ; 188 		return(val);
1354  021d 7b01          	ld	a,(OFST+1,sp)
1357  021f 5b01          	addw	sp,#1
1358  0221 81            	ret
1359  0222               L744:
1360                     ; 189 	} else if (val > 128){
1362  0222 7b01          	ld	a,(OFST+1,sp)
1363  0224 a181          	cp	a,#129
1364  0226 2507          	jrult	L154
1365                     ; 190 		return(256 - val);
1367  0228 a600          	ld	a,#0
1368  022a 1001          	sub	a,(OFST+1,sp)
1371  022c 5b01          	addw	sp,#1
1372  022e 81            	ret
1373  022f               L154:
1374                     ; 192 }	
1377  022f 5b01          	addw	sp,#1
1378  0231 81            	ret
1455                     ; 194 void rainbowFade(void)
1455                     ; 195 {
1456                     	switch	.text
1457  0232               _rainbowFade:
1459  0232 520c          	subw	sp,#12
1460       0000000c      OFST:	set	12
1463                     ; 196 	uint8_t hue = 0;
1465  0234 0f0c          	clr	(OFST+0,sp)
1467                     ; 197 	uint8_t red = 0;
1469                     ; 198 	uint8_t green = 0;
1471                     ; 199 	uint8_t blue = 0;
1473                     ; 200 	float scale = MAX_BRIGHTNESS*1.0/256;
1475  0236 ce0002        	ldw	x,L715+2
1476  0239 1f0a          	ldw	(OFST-2,sp),x
1477  023b ce0000        	ldw	x,L715
1478  023e 1f08          	ldw	(OFST-4,sp),x
1480  0240               L325:
1481                     ; 203 		colour[0] = linearSine(hue)*scale;
1483  0240 7b0c          	ld	a,(OFST+0,sp)
1484  0242 adcc          	call	_linearSine
1486  0244 5f            	clrw	x
1487  0245 97            	ld	xl,a
1488  0246 cd0000        	call	c_itof
1490  0249 96            	ldw	x,sp
1491  024a 1c0001        	addw	x,#OFST-11
1492  024d cd0000        	call	c_rtol
1495  0250 96            	ldw	x,sp
1496  0251 1c0008        	addw	x,#OFST-4
1497  0254 cd0000        	call	c_ltor
1499  0257 96            	ldw	x,sp
1500  0258 1c0001        	addw	x,#OFST-11
1501  025b cd0000        	call	c_fmul
1503  025e cd0000        	call	c_ftol
1505  0261 b603          	ld	a,c_lreg+3
1506  0263 b700          	ld	L75_colour,a
1507                     ; 204 		colour[1] = linearSine(hue-128)*scale;
1509  0265 7b0c          	ld	a,(OFST+0,sp)
1510  0267 a080          	sub	a,#128
1511  0269 ada5          	call	_linearSine
1513  026b 5f            	clrw	x
1514  026c 97            	ld	xl,a
1515  026d cd0000        	call	c_itof
1517  0270 96            	ldw	x,sp
1518  0271 1c0001        	addw	x,#OFST-11
1519  0274 cd0000        	call	c_rtol
1522  0277 96            	ldw	x,sp
1523  0278 1c0008        	addw	x,#OFST-4
1524  027b cd0000        	call	c_ltor
1526  027e 96            	ldw	x,sp
1527  027f 1c0001        	addw	x,#OFST-11
1528  0282 cd0000        	call	c_fmul
1530  0285 cd0000        	call	c_ftol
1532  0288 b603          	ld	a,c_lreg+3
1533  028a b701          	ld	L75_colour+1,a
1534                     ; 205 		colour[2] = linearSine(hue+128)*scale;
1536  028c 7b0c          	ld	a,(OFST+0,sp)
1537  028e ab80          	add	a,#128
1538  0290 cd0210        	call	_linearSine
1540  0293 5f            	clrw	x
1541  0294 97            	ld	xl,a
1542  0295 cd0000        	call	c_itof
1544  0298 96            	ldw	x,sp
1545  0299 1c0001        	addw	x,#OFST-11
1546  029c cd0000        	call	c_rtol
1549  029f 96            	ldw	x,sp
1550  02a0 1c0008        	addw	x,#OFST-4
1551  02a3 cd0000        	call	c_ltor
1553  02a6 96            	ldw	x,sp
1554  02a7 1c0001        	addw	x,#OFST-11
1555  02aa cd0000        	call	c_fmul
1557  02ad cd0000        	call	c_ftol
1559  02b0 b603          	ld	a,c_lreg+3
1560  02b2 b702          	ld	L75_colour+2,a
1561                     ; 207 		clear_lights();
1563  02b4 cd010c        	call	_clear_lights
1565                     ; 208 		setAllSameColour(colour); 
1567  02b7 ae0000        	ldw	x,#L75_colour
1568  02ba cd0132        	call	_setAllSameColour
1570                     ; 209 		write_display(lights);
1572  02bd ae0000        	ldw	x,#L55_lights
1573  02c0 cd00d3        	call	_write_display
1575                     ; 211 		hue++;
1577  02c3 0c0c          	inc	(OFST+0,sp)
1579                     ; 213 		delay_ms(50);
1581  02c5 ae0032        	ldw	x,#50
1582  02c8 cd0000        	call	_delay_ms
1585  02cb ac400240      	jpf	L325
1617                     ; 221 int main(void) {
1618                     	switch	.text
1619  02cf               _main:
1623                     ; 223 	CLK_DeInit();
1625  02cf cd0000        	call	_CLK_DeInit
1627                     ; 224 	CLK_HSECmd(DISABLE);
1629  02d2 4f            	clr	a
1630  02d3 cd0000        	call	_CLK_HSECmd
1632                     ; 225 	CLK_HSICmd(ENABLE);
1634  02d6 a601          	ld	a,#1
1635  02d8 cd0000        	call	_CLK_HSICmd
1637                     ; 226 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
1639  02db 4f            	clr	a
1640  02dc cd0000        	call	_CLK_HSIPrescalerConfig
1642                     ; 227 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
1644  02df a680          	ld	a,#128
1645  02e1 cd0000        	call	_CLK_SYSCLKConfig
1647                     ; 230 	GPIO_DeInit(GPIOA);
1649  02e4 ae5000        	ldw	x,#20480
1650  02e7 cd0000        	call	_GPIO_DeInit
1652                     ; 231 	GPIO_Init(GPIOA, GPIO_PIN_1, GPIO_MODE_OUT_PP_LOW_FAST);
1654  02ea 4be0          	push	#224
1655  02ec 4b02          	push	#2
1656  02ee ae5000        	ldw	x,#20480
1657  02f1 cd0000        	call	_GPIO_Init
1659  02f4 85            	popw	x
1660                     ; 232 	GPIO_Init(GPIOA, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
1662  02f5 4be0          	push	#224
1663  02f7 4b04          	push	#4
1664  02f9 ae5000        	ldw	x,#20480
1665  02fc cd0000        	call	_GPIO_Init
1667  02ff 85            	popw	x
1668                     ; 234 	GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT);
1670  0300 4b00          	push	#0
1671  0302 4b10          	push	#16
1672  0304 ae5005        	ldw	x,#20485
1673  0307 cd0000        	call	_GPIO_Init
1675  030a 85            	popw	x
1676                     ; 237 	clear_lights();
1678  030b cd010c        	call	_clear_lights
1680  030e               L735:
1681                     ; 240 		rainbowFade();
1683  030e cd0232        	call	_rainbowFade
1686  0311 20fb          	jra	L735
1722                     	xdef	_main
1723                     	xdef	_rainbowFade
1724                     	xdef	_linearSine
1725                     	xdef	_RGBSpin
1726                     	xdef	_setAllSameColour
1727                     	xdef	_clear_lights
1728                     	xdef	_write_display
1729                     	xdef	_ws_write_grb_bot
1730                     	xdef	_ws_write_grb_top
1731                     	xdef	_ws_write_byte_bot
1732                     	xdef	_ws_write_byte_top
1733                     	switch	.ubsct
1734  0000               L55_lights:
1735  0000 000000000000  	ds.b	24
1736                     	xdef	_delay_ms
1737                     	xref	_GPIO_ReadInputPin
1738                     	xref	_GPIO_Init
1739                     	xref	_GPIO_DeInit
1740                     	xref	_CLK_SYSCLKConfig
1741                     	xref	_CLK_HSIPrescalerConfig
1742                     	xref	_CLK_HSICmd
1743                     	xref	_CLK_HSECmd
1744                     	xref	_CLK_DeInit
1745                     .const:	section	.text
1746  0000               L715:
1747  0000 3da00000      	dc.w	15776,0
1748                     	xref.b	c_lreg
1749                     	xref.b	c_x
1769                     	xref	c_ftol
1770                     	xref	c_fmul
1771                     	xref	c_rtol
1772                     	xref	c_itof
1773                     	xref	c_ltor
1774                     	xref	c_idiv
1775                     	xref	c_bmulx
1776                     	end
