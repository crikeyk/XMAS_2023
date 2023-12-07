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
1074                     	bsct
1075  0003               _dir:
1076  0003 01            	dc.b	1
1131                     ; 155 void RGBSpin(void)
1131                     ; 156 {
1132                     	switch	.text
1133  0165               _RGBSpin:
1135  0165 5205          	subw	sp,#5
1136       00000005      OFST:	set	5
1139                     ; 158 	int8_t j = 0;
1141  0167 0f04          	clr	(OFST-1,sp)
1143                     ; 159 	int8_t i = 0;
1145  0169 0f05          	clr	(OFST+0,sp)
1147                     ; 160 	uint8_t press = 0;
1149  016b               L514:
1150                     ; 163 		clear_lights();
1152  016b ad9f          	call	_clear_lights
1154                     ; 164 		lights[i][j] = MAX_BRIGHTNESS;
1156  016d 7b04          	ld	a,(OFST-1,sp)
1157  016f 5f            	clrw	x
1158  0170 4d            	tnz	a
1159  0171 2a01          	jrpl	L43
1160  0173 53            	cplw	x
1161  0174               L43:
1162  0174 97            	ld	xl,a
1163  0175 1f01          	ldw	(OFST-4,sp),x
1165  0177 7b05          	ld	a,(OFST+0,sp)
1166  0179 5f            	clrw	x
1167  017a 4d            	tnz	a
1168  017b 2a01          	jrpl	L63
1169  017d 53            	cplw	x
1170  017e               L63:
1171  017e 97            	ld	xl,a
1172  017f a603          	ld	a,#3
1173  0181 cd0000        	call	c_bmulx
1175  0184 72fb01        	addw	x,(OFST-4,sp)
1176  0187 a614          	ld	a,#20
1177  0189 e700          	ld	(L55_lights,x),a
1178                     ; 165 		write_display(lights);
1180  018b ae0000        	ldw	x,#L55_lights
1181  018e cd00d3        	call	_write_display
1183                     ; 167 		i += dir;
1185  0191 7b05          	ld	a,(OFST+0,sp)
1186  0193 bb03          	add	a,_dir
1187  0195 6b05          	ld	(OFST+0,sp),a
1189                     ; 168 		i = (i==-1) ? NUM_LEDS-1 : i;
1191  0197 7b05          	ld	a,(OFST+0,sp)
1192  0199 a1ff          	cp	a,#255
1193  019b 2604          	jrne	L04
1194  019d a607          	ld	a,#7
1195  019f 2002          	jra	L24
1196  01a1               L04:
1197  01a1 7b05          	ld	a,(OFST+0,sp)
1198  01a3               L24:
1199  01a3 6b05          	ld	(OFST+0,sp),a
1201                     ; 169 		i %= NUM_LEDS;
1203  01a5 7b05          	ld	a,(OFST+0,sp)
1204  01a7 ae0008        	ldw	x,#8
1205  01aa 51            	exgw	x,y
1206  01ab 5f            	clrw	x
1207  01ac 4d            	tnz	a
1208  01ad 2a01          	jrpl	L44
1209  01af 5a            	decw	x
1210  01b0               L44:
1211  01b0 02            	rlwa	x,a
1212  01b1 cd0000        	call	c_idiv
1214  01b4 909f          	ld	a,yl
1215  01b6 6b05          	ld	(OFST+0,sp),a
1217                     ; 171 		if(i==0){
1219  01b8 0d05          	tnz	(OFST+0,sp)
1220  01ba 2615          	jrne	L124
1221                     ; 172 			j += 1;
1223  01bc 0c04          	inc	(OFST-1,sp)
1225                     ; 173 			j %= NUM_COLOURS;
1227  01be 7b04          	ld	a,(OFST-1,sp)
1228  01c0 ae0003        	ldw	x,#3
1229  01c3 51            	exgw	x,y
1230  01c4 5f            	clrw	x
1231  01c5 4d            	tnz	a
1232  01c6 2a01          	jrpl	L64
1233  01c8 5a            	decw	x
1234  01c9               L64:
1235  01c9 02            	rlwa	x,a
1236  01ca cd0000        	call	c_idiv
1238  01cd 909f          	ld	a,yl
1239  01cf 6b04          	ld	(OFST-1,sp),a
1241  01d1               L124:
1242                     ; 176 		delay_ms(100);
1244  01d1 ae0064        	ldw	x,#100
1245  01d4 cd0000        	call	_delay_ms
1248  01d7 2092          	jra	L514
1304                     ; 186 void RGBSpin_no_button(void)
1304                     ; 187 {
1305                     	switch	.text
1306  01d9               _RGBSpin_no_button:
1308  01d9 5205          	subw	sp,#5
1309       00000005      OFST:	set	5
1312                     ; 189 	int8_t j = 0;
1314  01db 0f04          	clr	(OFST-1,sp)
1316                     ; 190 	int8_t i = 0;
1318  01dd 0f05          	clr	(OFST+0,sp)
1320                     ; 191 	int8_t dir = CW;
1322  01df a601          	ld	a,#1
1323  01e1 6b03          	ld	(OFST-2,sp),a
1325  01e3               L154:
1326                     ; 194 		clear_lights();
1328  01e3 cd010c        	call	_clear_lights
1330                     ; 195 		lights[i][j] = MAX_BRIGHTNESS;
1332  01e6 7b04          	ld	a,(OFST-1,sp)
1333  01e8 5f            	clrw	x
1334  01e9 4d            	tnz	a
1335  01ea 2a01          	jrpl	L25
1336  01ec 53            	cplw	x
1337  01ed               L25:
1338  01ed 97            	ld	xl,a
1339  01ee 1f01          	ldw	(OFST-4,sp),x
1341  01f0 7b05          	ld	a,(OFST+0,sp)
1342  01f2 5f            	clrw	x
1343  01f3 4d            	tnz	a
1344  01f4 2a01          	jrpl	L45
1345  01f6 53            	cplw	x
1346  01f7               L45:
1347  01f7 97            	ld	xl,a
1348  01f8 a603          	ld	a,#3
1349  01fa cd0000        	call	c_bmulx
1351  01fd 72fb01        	addw	x,(OFST-4,sp)
1352  0200 a614          	ld	a,#20
1353  0202 e700          	ld	(L55_lights,x),a
1354                     ; 196 		write_display(lights);
1356  0204 ae0000        	ldw	x,#L55_lights
1357  0207 cd00d3        	call	_write_display
1359                     ; 198 		i += dir;
1361  020a 7b05          	ld	a,(OFST+0,sp)
1362  020c 1b03          	add	a,(OFST-2,sp)
1363  020e 6b05          	ld	(OFST+0,sp),a
1365                     ; 199 		i = (i==-1) ? NUM_LEDS-1 : i;
1367  0210 7b05          	ld	a,(OFST+0,sp)
1368  0212 a1ff          	cp	a,#255
1369  0214 2604          	jrne	L65
1370  0216 a607          	ld	a,#7
1371  0218 2002          	jra	L06
1372  021a               L65:
1373  021a 7b05          	ld	a,(OFST+0,sp)
1374  021c               L06:
1375  021c 6b05          	ld	(OFST+0,sp),a
1377                     ; 200 		i %= NUM_LEDS;
1379  021e 7b05          	ld	a,(OFST+0,sp)
1380  0220 ae0008        	ldw	x,#8
1381  0223 51            	exgw	x,y
1382  0224 5f            	clrw	x
1383  0225 4d            	tnz	a
1384  0226 2a01          	jrpl	L26
1385  0228 5a            	decw	x
1386  0229               L26:
1387  0229 02            	rlwa	x,a
1388  022a cd0000        	call	c_idiv
1390  022d 909f          	ld	a,yl
1391  022f 6b05          	ld	(OFST+0,sp),a
1393                     ; 202 		if(i==0){
1395  0231 0d05          	tnz	(OFST+0,sp)
1396  0233 2615          	jrne	L554
1397                     ; 203 			j += 1;
1399  0235 0c04          	inc	(OFST-1,sp)
1401                     ; 204 			j %= NUM_COLOURS;
1403  0237 7b04          	ld	a,(OFST-1,sp)
1404  0239 ae0003        	ldw	x,#3
1405  023c 51            	exgw	x,y
1406  023d 5f            	clrw	x
1407  023e 4d            	tnz	a
1408  023f 2a01          	jrpl	L46
1409  0241 5a            	decw	x
1410  0242               L46:
1411  0242 02            	rlwa	x,a
1412  0243 cd0000        	call	c_idiv
1414  0246 909f          	ld	a,yl
1415  0248 6b04          	ld	(OFST-1,sp),a
1417  024a               L554:
1418                     ; 207 		delay_ms(100);
1420  024a ae0064        	ldw	x,#100
1421  024d cd0000        	call	_delay_ms
1424  0250 2091          	jra	L154
1458                     ; 211 uint8_t linearSine(uint8_t val){
1459                     	switch	.text
1460  0252               _linearSine:
1462  0252 88            	push	a
1463       00000000      OFST:	set	0
1466                     ; 212 	val %= 256;
1468  0253 7b01          	ld	a,(OFST+1,sp)
1469  0255 a4ff          	and	a,#255
1470  0257 6b01          	ld	(OFST+1,sp),a
1471                     ; 213 	if(val < 128){
1473  0259 7b01          	ld	a,(OFST+1,sp)
1474  025b a180          	cp	a,#128
1475  025d 2405          	jruge	L574
1476                     ; 214 		return(val);
1478  025f 7b01          	ld	a,(OFST+1,sp)
1481  0261 5b01          	addw	sp,#1
1482  0263 81            	ret
1483  0264               L574:
1484                     ; 215 	} else if (val > 128){
1486  0264 7b01          	ld	a,(OFST+1,sp)
1487  0266 a181          	cp	a,#129
1488  0268 2507          	jrult	L774
1489                     ; 216 		return(256 - val);
1491  026a a600          	ld	a,#0
1492  026c 1001          	sub	a,(OFST+1,sp)
1495  026e 5b01          	addw	sp,#1
1496  0270 81            	ret
1497  0271               L774:
1498                     ; 218 }	
1501  0271 5b01          	addw	sp,#1
1502  0273 81            	ret
1579                     ; 222 void rainbowFade(void)
1579                     ; 223 {
1580                     	switch	.text
1581  0274               _rainbowFade:
1583  0274 520c          	subw	sp,#12
1584       0000000c      OFST:	set	12
1587                     ; 224 	uint8_t hue = 0;
1589  0276 0f0c          	clr	(OFST+0,sp)
1591                     ; 225 	uint8_t red = 0;
1593                     ; 226 	uint8_t green = 0;
1595                     ; 227 	uint8_t blue = 0;
1597                     ; 228 	float scale = MAX_BRIGHTNESS*1.0/256;
1599  0278 ce0002        	ldw	x,L545+2
1600  027b 1f0a          	ldw	(OFST-2,sp),x
1601  027d ce0000        	ldw	x,L545
1602  0280 1f08          	ldw	(OFST-4,sp),x
1604  0282               L155:
1605                     ; 231 		colour[0] = linearSine(hue)*scale;
1607  0282 7b0c          	ld	a,(OFST+0,sp)
1608  0284 adcc          	call	_linearSine
1610  0286 5f            	clrw	x
1611  0287 97            	ld	xl,a
1612  0288 cd0000        	call	c_itof
1614  028b 96            	ldw	x,sp
1615  028c 1c0001        	addw	x,#OFST-11
1616  028f cd0000        	call	c_rtol
1619  0292 96            	ldw	x,sp
1620  0293 1c0008        	addw	x,#OFST-4
1621  0296 cd0000        	call	c_ltor
1623  0299 96            	ldw	x,sp
1624  029a 1c0001        	addw	x,#OFST-11
1625  029d cd0000        	call	c_fmul
1627  02a0 cd0000        	call	c_ftol
1629  02a3 b603          	ld	a,c_lreg+3
1630  02a5 b700          	ld	L75_colour,a
1631                     ; 232 		colour[1] = linearSine(hue-128)*scale;
1633  02a7 7b0c          	ld	a,(OFST+0,sp)
1634  02a9 a080          	sub	a,#128
1635  02ab ada5          	call	_linearSine
1637  02ad 5f            	clrw	x
1638  02ae 97            	ld	xl,a
1639  02af cd0000        	call	c_itof
1641  02b2 96            	ldw	x,sp
1642  02b3 1c0001        	addw	x,#OFST-11
1643  02b6 cd0000        	call	c_rtol
1646  02b9 96            	ldw	x,sp
1647  02ba 1c0008        	addw	x,#OFST-4
1648  02bd cd0000        	call	c_ltor
1650  02c0 96            	ldw	x,sp
1651  02c1 1c0001        	addw	x,#OFST-11
1652  02c4 cd0000        	call	c_fmul
1654  02c7 cd0000        	call	c_ftol
1656  02ca b603          	ld	a,c_lreg+3
1657  02cc b701          	ld	L75_colour+1,a
1658                     ; 233 		colour[2] = linearSine(hue+128)*scale;
1660  02ce 7b0c          	ld	a,(OFST+0,sp)
1661  02d0 ab80          	add	a,#128
1662  02d2 cd0252        	call	_linearSine
1664  02d5 5f            	clrw	x
1665  02d6 97            	ld	xl,a
1666  02d7 cd0000        	call	c_itof
1668  02da 96            	ldw	x,sp
1669  02db 1c0001        	addw	x,#OFST-11
1670  02de cd0000        	call	c_rtol
1673  02e1 96            	ldw	x,sp
1674  02e2 1c0008        	addw	x,#OFST-4
1675  02e5 cd0000        	call	c_ltor
1677  02e8 96            	ldw	x,sp
1678  02e9 1c0001        	addw	x,#OFST-11
1679  02ec cd0000        	call	c_fmul
1681  02ef cd0000        	call	c_ftol
1683  02f2 b603          	ld	a,c_lreg+3
1684  02f4 b702          	ld	L75_colour+2,a
1685                     ; 235 		clear_lights();
1687  02f6 cd010c        	call	_clear_lights
1689                     ; 236 		setAllSameColour(colour); 
1691  02f9 ae0000        	ldw	x,#L75_colour
1692  02fc cd0132        	call	_setAllSameColour
1694                     ; 237 		write_display(lights);
1696  02ff ae0000        	ldw	x,#L55_lights
1697  0302 cd00d3        	call	_write_display
1699                     ; 239 		hue++;
1701  0305 0c0c          	inc	(OFST+0,sp)
1703                     ; 241 		delay_ms(50);
1705  0307 ae0032        	ldw	x,#50
1706  030a cd0000        	call	_delay_ms
1709  030d ac820282      	jpf	L155
1743                     ; 249 int main(void) {
1744                     	switch	.text
1745  0311               _main:
1749                     ; 252 	sim();
1752  0311 9b            sim
1754                     ; 253 	CLK_DeInit();
1757  0312 cd0000        	call	_CLK_DeInit
1759                     ; 254 	CLK_HSECmd(DISABLE);
1761  0315 4f            	clr	a
1762  0316 cd0000        	call	_CLK_HSECmd
1764                     ; 255 	CLK_HSICmd(ENABLE);
1766  0319 a601          	ld	a,#1
1767  031b cd0000        	call	_CLK_HSICmd
1769                     ; 256 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
1771  031e 4f            	clr	a
1772  031f cd0000        	call	_CLK_HSIPrescalerConfig
1774                     ; 257 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
1776  0322 a680          	ld	a,#128
1777  0324 cd0000        	call	_CLK_SYSCLKConfig
1779                     ; 260 	GPIO_DeInit(GPIOA);
1781  0327 ae5000        	ldw	x,#20480
1782  032a cd0000        	call	_GPIO_DeInit
1784                     ; 261 	GPIO_Init(GPIOA, GPIO_PIN_1, GPIO_MODE_OUT_PP_LOW_FAST);
1786  032d 4be0          	push	#224
1787  032f 4b02          	push	#2
1788  0331 ae5000        	ldw	x,#20480
1789  0334 cd0000        	call	_GPIO_Init
1791  0337 85            	popw	x
1792                     ; 262 	GPIO_Init(GPIOA, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
1794  0338 4be0          	push	#224
1795  033a 4b04          	push	#4
1796  033c ae5000        	ldw	x,#20480
1797  033f cd0000        	call	_GPIO_Init
1799  0342 85            	popw	x
1800                     ; 264 	GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_IN_FL_IT);
1802  0343 4b20          	push	#32
1803  0345 4b10          	push	#16
1804  0347 ae5005        	ldw	x,#20485
1805  034a cd0000        	call	_GPIO_Init
1807  034d 85            	popw	x
1808                     ; 265 	EXTI->CR1 &= ~(1 << 3);
1810  034e 721750a0      	bres	20640,#3
1811                     ; 266 	EXTI->CR1 |= (1 << 2);
1813  0352 721450a0      	bset	20640,#2
1814                     ; 269 	clear_lights();
1816  0356 cd010c        	call	_clear_lights
1818                     ; 271 	rim();
1821  0359 9a            rim
1823  035a               L565:
1824                     ; 274 		RGBSpin();
1826  035a cd0165        	call	_RGBSpin
1829  035d 20fb          	jra	L565
1853                     ; 280 @far @interrupt void buttonHandler(void)
1853                     ; 281 {
1855                     	switch	.text
1856  035f               f_buttonHandler:
1860                     ; 282 	dir = (dir==CW) ? CCW : CW;
1862  035f b603          	ld	a,_dir
1863  0361 a101          	cp	a,#1
1864  0363 2604          	jrne	L67
1865  0365 a6ff          	ld	a,#255
1866  0367 2002          	jra	L001
1867  0369               L67:
1868  0369 a601          	ld	a,#1
1869  036b               L001:
1870  036b b703          	ld	_dir,a
1871                     ; 285 }
1874  036d 80            	iret
1918                     	xdef	f_buttonHandler
1919                     	xdef	_main
1920                     	xdef	_rainbowFade
1921                     	xdef	_linearSine
1922                     	xdef	_RGBSpin_no_button
1923                     	xdef	_RGBSpin
1924                     	xdef	_dir
1925                     	xdef	_setAllSameColour
1926                     	xdef	_clear_lights
1927                     	xdef	_write_display
1928                     	xdef	_ws_write_grb_bot
1929                     	xdef	_ws_write_grb_top
1930                     	xdef	_ws_write_byte_bot
1931                     	xdef	_ws_write_byte_top
1932                     	switch	.ubsct
1933  0000               L55_lights:
1934  0000 000000000000  	ds.b	24
1935                     	xdef	_delay_ms
1936                     	xref	_GPIO_Init
1937                     	xref	_GPIO_DeInit
1938                     	xref	_CLK_SYSCLKConfig
1939                     	xref	_CLK_HSIPrescalerConfig
1940                     	xref	_CLK_HSICmd
1941                     	xref	_CLK_HSECmd
1942                     	xref	_CLK_DeInit
1943                     .const:	section	.text
1944  0000               L545:
1945  0000 3da00000      	dc.w	15776,0
1946                     	xref.b	c_lreg
1947                     	xref.b	c_x
1967                     	xref	c_ftol
1968                     	xref	c_fmul
1969                     	xref	c_rtol
1970                     	xref	c_itof
1971                     	xref	c_ltor
1972                     	xref	c_idiv
1973                     	xref	c_bmulx
1974                     	end
