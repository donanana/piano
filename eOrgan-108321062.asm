;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module eOrgan_108321062
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _tempo
	.globl _main
	.globl _timer_1
	.globl _timer_0
	.globl _LED_Display
	.globl _Keypad
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _record_start
	.globl _record_key
	.globl _record_tone
	.globl _tone
	.globl _sharp_flat
	.globl _tempo_counter
	.globl _time_counter
	.globl _record_counter
	.globl _key
	.globl _time
	.globl _okey
	.globl _fix
	.globl _press_value
	.globl _num
	.globl _display
	.globl _initial
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
	.area REG_BANK_1	(REL,OVR,DATA)
	.ds 8
	.area REG_BANK_2	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; overlayable bit register bank
;--------------------------------------------------------
	.area BIT_BANK	(REL,OVR,DATA)
bits:
	.ds 1
	b0 = bits[0]
	b1 = bits[1]
	b2 = bits[2]
	b3 = bits[3]
	b4 = bits[4]
	b5 = bits[5]
	b6 = bits[6]
	b7 = bits[7]
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_initial::
	.ds 2
_display::
	.ds 1
_num::
	.ds 1
_press_value::
	.ds 1
_fix::
	.ds 1
_okey::
	.ds 1
_time::
	.ds 1
_key::
	.ds 1
_record_counter::
	.ds 1
_time_counter::
	.ds 1
_tempo_counter::
	.ds 1
_sharp_flat::
	.ds 1
_tone::
	.ds 16
_record_tone::
	.ds 30
_record_key::
	.ds 30
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
_record_start::
	.ds 1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	reti
	.ds	7
	ljmp	_timer_0
	.ds	5
	reti
	.ds	7
	ljmp	_timer_1
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
;	eOrgan-108321062.c:9: unsigned char okey = 0xff, time = 0, key = 2; // okey:debounce, time:timer_1 interrupt, key = 升降八度, record_start = 允許記錄相關資訊
	mov	_okey,#0xff
;	eOrgan-108321062.c:9: __bit record_start = 0; 
	mov	_time,#0x00
;	eOrgan-108321062.c:9: unsigned char okey = 0xff, time = 0, key = 2; // okey:debounce, time:timer_1 interrupt, key = 升降八度, record_start = 允許記錄相關資訊
	mov	_key,#0x02
;	eOrgan-108321062.c:11: unsigned char record_counter = 0, time_counter = 0, tempo_counter = 5; // record_counter:數要存在record陣列的位置, time_counter:與fix相呼配合, tempo_counter:數讀的tempo陣列的位置
	mov	_record_counter,#0x00
;	eOrgan-108321062.c:11: unsigned char sharp_flat = 0;// shap_flat:0-> none, 1 -> #, 2 -> b 
	mov	_time_counter,#0x00
;	eOrgan-108321062.c:11: unsigned char record_counter = 0, time_counter = 0, tempo_counter = 5; // record_counter:數要存在record陣列的位置, time_counter:與fix相呼配合, tempo_counter:數讀的tempo陣列的位置
	mov	_tempo_counter,#0x05
;	eOrgan-108321062.c:12: unsigned char sharp_flat = 0;// shap_flat:0-> none, 1 -> #, 2 -> b 
	mov	_sharp_flat,#0x00
;	eOrgan-108321062.c:15: unsigned short tone[] =  
	clr	a
	mov	(_tone + 0),a
	mov	(_tone + 1),a
	mov	((_tone + 0x0002) + 0),#0x06
	mov	((_tone + 0x0002) + 1),#0x01
	mov	((_tone + 0x0004) + 0),#0x26
	mov	((_tone + 0x0004) + 1),#0x01
	mov	((_tone + 0x0006) + 0),#0x4a
	mov	((_tone + 0x0006) + 1),#0x01
	mov	((_tone + 0x0008) + 0),#0x5d
	mov	((_tone + 0x0008) + 1),#0x01
	mov	((_tone + 0x000a) + 0),#0x88
	mov	((_tone + 0x000a) + 1),#0x01
	mov	((_tone + 0x000c) + 0),#0xb8
	mov	((_tone + 0x000c) + 1),#0x01
	mov	((_tone + 0x000e) + 0),#0xee
	mov	((_tone + 0x000e) + 1),#0x01
;	eOrgan-108321062.c:32: unsigned char record_tone[]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
;	1-genFromRTrack replaced	mov	_record_tone,#0x00
	mov	_record_tone,a
;	1-genFromRTrack replaced	mov	(_record_tone + 0x0001),#0x00
	mov	(_record_tone + 0x0001),a
;	1-genFromRTrack replaced	mov	(_record_tone + 0x0002),#0x00
	mov	(_record_tone + 0x0002),a
;	1-genFromRTrack replaced	mov	(_record_tone + 0x0003),#0x00
	mov	(_record_tone + 0x0003),a
;	1-genFromRTrack replaced	mov	(_record_tone + 0x0004),#0x00
	mov	(_record_tone + 0x0004),a
;	1-genFromRTrack replaced	mov	(_record_tone + 0x0005),#0x00
	mov	(_record_tone + 0x0005),a
;	1-genFromRTrack replaced	mov	(_record_tone + 0x0006),#0x00
	mov	(_record_tone + 0x0006),a
;	1-genFromRTrack replaced	mov	(_record_tone + 0x0007),#0x00
	mov	(_record_tone + 0x0007),a
;	1-genFromRTrack replaced	mov	(_record_tone + 0x0008),#0x00
	mov	(_record_tone + 0x0008),a
;	1-genFromRTrack replaced	mov	(_record_tone + 0x0009),#0x00
	mov	(_record_tone + 0x0009),a
;	1-genFromRTrack replaced	mov	(_record_tone + 0x000a),#0x00
	mov	(_record_tone + 0x000a),a
;	1-genFromRTrack replaced	mov	(_record_tone + 0x000b),#0x00
	mov	(_record_tone + 0x000b),a
;	1-genFromRTrack replaced	mov	(_record_tone + 0x000c),#0x00
	mov	(_record_tone + 0x000c),a
;	1-genFromRTrack replaced	mov	(_record_tone + 0x000d),#0x00
	mov	(_record_tone + 0x000d),a
;	1-genFromRTrack replaced	mov	(_record_tone + 0x000e),#0x00
	mov	(_record_tone + 0x000e),a
;	1-genFromRTrack replaced	mov	(_record_tone + 0x000f),#0x00
	mov	(_record_tone + 0x000f),a
;	1-genFromRTrack replaced	mov	(_record_tone + 0x0010),#0x00
	mov	(_record_tone + 0x0010),a
;	1-genFromRTrack replaced	mov	(_record_tone + 0x0011),#0x00
	mov	(_record_tone + 0x0011),a
;	1-genFromRTrack replaced	mov	(_record_tone + 0x0012),#0x00
	mov	(_record_tone + 0x0012),a
;	1-genFromRTrack replaced	mov	(_record_tone + 0x0013),#0x00
	mov	(_record_tone + 0x0013),a
;	1-genFromRTrack replaced	mov	(_record_tone + 0x0014),#0x00
	mov	(_record_tone + 0x0014),a
;	1-genFromRTrack replaced	mov	(_record_tone + 0x0015),#0x00
	mov	(_record_tone + 0x0015),a
;	1-genFromRTrack replaced	mov	(_record_tone + 0x0016),#0x00
	mov	(_record_tone + 0x0016),a
;	1-genFromRTrack replaced	mov	(_record_tone + 0x0017),#0x00
	mov	(_record_tone + 0x0017),a
;	1-genFromRTrack replaced	mov	(_record_tone + 0x0018),#0x00
	mov	(_record_tone + 0x0018),a
;	1-genFromRTrack replaced	mov	(_record_tone + 0x0019),#0x00
	mov	(_record_tone + 0x0019),a
;	1-genFromRTrack replaced	mov	(_record_tone + 0x001a),#0x00
	mov	(_record_tone + 0x001a),a
;	1-genFromRTrack replaced	mov	(_record_tone + 0x001b),#0x00
	mov	(_record_tone + 0x001b),a
;	1-genFromRTrack replaced	mov	(_record_tone + 0x001c),#0x00
	mov	(_record_tone + 0x001c),a
;	1-genFromRTrack replaced	mov	(_record_tone + 0x001d),#0x00
	mov	(_record_tone + 0x001d),a
;	eOrgan-108321062.c:33: unsigned char record_key[]={2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2};
	mov	_record_key,#0x02
	mov	(_record_key + 0x0001),#0x02
	mov	(_record_key + 0x0002),#0x02
	mov	(_record_key + 0x0003),#0x02
	mov	(_record_key + 0x0004),#0x02
	mov	(_record_key + 0x0005),#0x02
	mov	(_record_key + 0x0006),#0x02
	mov	(_record_key + 0x0007),#0x02
	mov	(_record_key + 0x0008),#0x02
	mov	(_record_key + 0x0009),#0x02
	mov	(_record_key + 0x000a),#0x02
	mov	(_record_key + 0x000b),#0x02
	mov	(_record_key + 0x000c),#0x02
	mov	(_record_key + 0x000d),#0x02
	mov	(_record_key + 0x000e),#0x02
	mov	(_record_key + 0x000f),#0x02
	mov	(_record_key + 0x0010),#0x02
	mov	(_record_key + 0x0011),#0x02
	mov	(_record_key + 0x0012),#0x02
	mov	(_record_key + 0x0013),#0x02
	mov	(_record_key + 0x0014),#0x02
	mov	(_record_key + 0x0015),#0x02
	mov	(_record_key + 0x0016),#0x02
	mov	(_record_key + 0x0017),#0x02
	mov	(_record_key + 0x0018),#0x02
	mov	(_record_key + 0x0019),#0x02
	mov	(_record_key + 0x001a),#0x02
	mov	(_record_key + 0x001b),#0x02
	mov	(_record_key + 0x001c),#0x02
	mov	(_record_key + 0x001d),#0x02
;	eOrgan-108321062.c:10: __bit record_start = 0; 
;	assignBit
	clr	_record_start
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'timer_0'
;------------------------------------------------------------
;	eOrgan-108321062.c:52: void timer_0(void) __interrupt (1) __using (1)
;	-----------------------------------------
;	 function timer_0
;	-----------------------------------------
_timer_0:
	ar7 = 0x0f
	ar6 = 0x0e
	ar5 = 0x0d
	ar4 = 0x0c
	ar3 = 0x0b
	ar2 = 0x0a
	ar1 = 0x09
	ar0 = 0x08
	push	bits
	push	acc
	push	b
	push	dpl
	push	dph
	push	(0+7)
	push	(0+6)
	push	(0+5)
	push	(0+4)
	push	(0+3)
	push	(0+2)
	push	(0+1)
	push	(0+0)
	push	psw
	mov	psw,#0x08
;	eOrgan-108321062.c:54: if (P1 != 0xf0){ // 1~7 = C~A音階
	mov	a,#0xf0
	cjne	a,_P1,00186$
	ljmp	00132$
00186$:
;	eOrgan-108321062.c:55: if (press_value > 0 && press_value < 8) {
	mov	a,_press_value
	jnz	00187$
	ljmp	00127$
00187$:
	mov	a,#0x100 - 0x08
	add	a,_press_value
	jnc	00188$
	ljmp	00127$
00188$:
;	eOrgan-108321062.c:56: P0 = ~P0;
	mov	a,_P0
	cpl	a
	mov	_P0,a
;	eOrgan-108321062.c:57: if(sharp_flat == 0){ // 無升降單音
	mov	a,_sharp_flat
	jnz	00119$
;	eOrgan-108321062.c:58: initial = 65536 -(1000000 / (tone[press_value] * key));
	mov	a,_press_value
	add	a,_press_value
	add	a,#_tone
	mov	r1,a
	mov	dpl,@r1
	inc	r1
	mov	dph,@r1
	mov	__mulint_PARM_2,_key
	mov	(__mulint_PARM_2 + 1),#0x00
	mov	psw,#0x00
	lcall	__mulint
	mov	psw,#0x08
	mov	r6,dpl
	mov	r7,dph
	mov	__divslong_PARM_2,r6
	mov	(__divslong_PARM_2 + 1),r7
	mov	(__divslong_PARM_2 + 2),#0x00
	mov	(__divslong_PARM_2 + 3),#0x00
	mov	dptr,#0x4240
	mov	b,#0x0f
	clr	a
	mov	psw,#0x00
	lcall	__divslong
	mov	psw,#0x08
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	clr	c
	clr	a
	subb	a,r4
	mov	_initial,a
	clr	a
	subb	a,r5
	mov	(_initial + 1),a
	ljmp	00120$
00119$:
;	eOrgan-108321062.c:60: else if(sharp_flat == 1){ // 升單音
	mov	a,#0x01
	cjne	a,_sharp_flat,00190$
	sjmp	00191$
00190$:
	ljmp	00116$
00191$:
;	eOrgan-108321062.c:61: if(press_value == 3){ // E# = F
	mov	a,#0x03
	cjne	a,_press_value,00105$
;	eOrgan-108321062.c:62: initial = 65536 -(1000000 / (tone[press_value + 1] * key));
	mov	r7,_press_value
	inc	r7
	mov	a,r7
	add	a,r7
	add	a,#_tone
	mov	r1,a
	mov	dpl,@r1
	inc	r1
	mov	dph,@r1
	mov	__mulint_PARM_2,_key
	mov	(__mulint_PARM_2 + 1),#0x00
	mov	psw,#0x00
	lcall	__mulint
	mov	psw,#0x08
	mov	r6,dpl
	mov	r7,dph
	mov	__divslong_PARM_2,r6
	mov	(__divslong_PARM_2 + 1),r7
	mov	(__divslong_PARM_2 + 2),#0x00
	mov	(__divslong_PARM_2 + 3),#0x00
	mov	dptr,#0x4240
	mov	b,#0x0f
	clr	a
	mov	psw,#0x00
	lcall	__divslong
	mov	psw,#0x08
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	clr	c
	clr	a
	subb	a,r4
	mov	_initial,a
	clr	a
	subb	a,r5
	mov	(_initial + 1),a
	ljmp	00120$
00105$:
;	eOrgan-108321062.c:64: else if(press_value == 7){ // B# = high C
	mov	a,#0x07
	cjne	a,_press_value,00102$
;	eOrgan-108321062.c:65: initial = 65536 -(1000000 / (tone[press_value - 6] * 2 * key));
	mov	a,_press_value
	add	a,#0xfa
	add	a,acc
	add	a,#_tone
	mov	r1,a
	mov	ar6,@r1
	inc	r1
	mov	ar7,@r1
	mov	a,r6
	add	a,r6
	mov	dpl,a
	mov	a,r7
	rlc	a
	mov	dph,a
	mov	__mulint_PARM_2,_key
	mov	(__mulint_PARM_2 + 1),#0x00
	mov	psw,#0x00
	lcall	__mulint
	mov	psw,#0x08
	mov	r6,dpl
	mov	r7,dph
	mov	__divslong_PARM_2,r6
	mov	(__divslong_PARM_2 + 1),r7
	mov	(__divslong_PARM_2 + 2),#0x00
	mov	(__divslong_PARM_2 + 3),#0x00
	mov	dptr,#0x4240
	mov	b,#0x0f
	clr	a
	mov	psw,#0x00
	lcall	__divslong
	mov	psw,#0x08
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	clr	c
	clr	a
	subb	a,r4
	mov	_initial,a
	clr	a
	subb	a,r5
	mov	(_initial + 1),a
	ljmp	00120$
00102$:
;	eOrgan-108321062.c:68: initial = 65536 -(1000000 / ((tone[press_value] + tone[press_value + 1])/2 * key));
	mov	a,_press_value
	add	a,_press_value
	add	a,#_tone
	mov	r1,a
	mov	ar6,@r1
	inc	r1
	mov	ar7,@r1
	mov	r5,_press_value
	inc	r5
	mov	a,r5
	add	a,r5
	add	a,#_tone
	mov	r1,a
	mov	ar4,@r1
	inc	r1
	mov	ar5,@r1
	mov	a,r4
	add	a,r6
	mov	r6,a
	mov	a,r5
	addc	a,r7
	mov	dpl,r6
	clr	c
	rrc	a
	xch	a,dpl
	rrc	a
	xch	a,dpl
	mov	dph,a
	mov	__mulint_PARM_2,_key
	mov	(__mulint_PARM_2 + 1),#0x00
	mov	psw,#0x00
	lcall	__mulint
	mov	psw,#0x08
	mov	r6,dpl
	mov	r7,dph
	mov	__divslong_PARM_2,r6
	mov	(__divslong_PARM_2 + 1),r7
	mov	(__divslong_PARM_2 + 2),#0x00
	mov	(__divslong_PARM_2 + 3),#0x00
	mov	dptr,#0x4240
	mov	b,#0x0f
	clr	a
	mov	psw,#0x00
	lcall	__divslong
	mov	psw,#0x08
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	clr	c
	clr	a
	subb	a,r4
	mov	_initial,a
	clr	a
	subb	a,r5
	mov	(_initial + 1),a
	ljmp	00120$
00116$:
;	eOrgan-108321062.c:71: else if(sharp_flat == 2){ // 降單音
	mov	a,#0x02
	cjne	a,_sharp_flat,00196$
	sjmp	00197$
00196$:
	ljmp	00120$
00197$:
;	eOrgan-108321062.c:72: if(press_value == 1){ // Cb = low B 
	mov	a,#0x01
	cjne	a,_press_value,00111$
;	eOrgan-108321062.c:73: initial = 65536 -(1000000 / (tone[press_value + 1] / 2 * key));
	mov	r7,_press_value
	inc	r7
	mov	a,r7
	add	a,r7
	add	a,#_tone
	mov	r1,a
	mov	ar6,@r1
	inc	r1
	mov	ar7,@r1
	mov	dpl,r6
	mov	a,r7
	clr	c
	rrc	a
	xch	a,dpl
	rrc	a
	xch	a,dpl
	mov	dph,a
	mov	__mulint_PARM_2,_key
	mov	(__mulint_PARM_2 + 1),#0x00
	mov	psw,#0x00
	lcall	__mulint
	mov	psw,#0x08
	mov	r6,dpl
	mov	r7,dph
	mov	__divslong_PARM_2,r6
	mov	(__divslong_PARM_2 + 1),r7
	mov	(__divslong_PARM_2 + 2),#0x00
	mov	(__divslong_PARM_2 + 3),#0x00
	mov	dptr,#0x4240
	mov	b,#0x0f
	clr	a
	mov	psw,#0x00
	lcall	__divslong
	mov	psw,#0x08
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	clr	c
	clr	a
	subb	a,r4
	mov	_initial,a
	clr	a
	subb	a,r5
	mov	(_initial + 1),a
	ljmp	00120$
00111$:
;	eOrgan-108321062.c:75: else if(press_value == 4){ // Fb = E
	mov	a,#0x04
	cjne	a,_press_value,00108$
;	eOrgan-108321062.c:76: initial = 65536 -(1000000 / (tone[press_value - 1] * key));
	mov	r7,_press_value
	dec	r7
	mov	a,r7
	add	a,r7
	add	a,#_tone
	mov	r1,a
	mov	dpl,@r1
	inc	r1
	mov	dph,@r1
	mov	__mulint_PARM_2,_key
	mov	(__mulint_PARM_2 + 1),#0x00
	mov	psw,#0x00
	lcall	__mulint
	mov	psw,#0x08
	mov	r6,dpl
	mov	r7,dph
	mov	__divslong_PARM_2,r6
	mov	(__divslong_PARM_2 + 1),r7
	mov	(__divslong_PARM_2 + 2),#0x00
	mov	(__divslong_PARM_2 + 3),#0x00
	mov	dptr,#0x4240
	mov	b,#0x0f
	clr	a
	mov	psw,#0x00
	lcall	__divslong
	mov	psw,#0x08
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	clr	c
	clr	a
	subb	a,r4
	mov	_initial,a
	clr	a
	subb	a,r5
	mov	(_initial + 1),a
	sjmp	00120$
00108$:
;	eOrgan-108321062.c:78: initial = 65536 -(1000000 / ((tone[press_value-1] + tone[press_value])/2 * key));
	mov	r7,_press_value
	dec	r7
	mov	a,r7
	add	a,r7
	add	a,#_tone
	mov	r1,a
	mov	ar6,@r1
	inc	r1
	mov	ar7,@r1
	mov	a,_press_value
	add	a,_press_value
	add	a,#_tone
	mov	r1,a
	mov	ar4,@r1
	inc	r1
	mov	ar5,@r1
	mov	a,r4
	add	a,r6
	mov	r6,a
	mov	a,r5
	addc	a,r7
	mov	dpl,r6
	clr	c
	rrc	a
	xch	a,dpl
	rrc	a
	xch	a,dpl
	mov	dph,a
	mov	__mulint_PARM_2,_key
	mov	(__mulint_PARM_2 + 1),#0x00
	mov	psw,#0x00
	lcall	__mulint
	mov	psw,#0x08
	mov	r6,dpl
	mov	r7,dph
	mov	__divslong_PARM_2,r6
	mov	(__divslong_PARM_2 + 1),r7
	mov	(__divslong_PARM_2 + 2),#0x00
	mov	(__divslong_PARM_2 + 3),#0x00
	mov	dptr,#0x4240
	mov	b,#0x0f
	clr	a
	mov	psw,#0x00
	lcall	__divslong
	mov	psw,#0x08
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	clr	c
	clr	a
	subb	a,r4
	mov	_initial,a
	clr	a
	subb	a,r5
	mov	(_initial + 1),a
00120$:
;	eOrgan-108321062.c:81: TL0 = initial & 0xff; 
	mov	_TL0,_initial
;	eOrgan-108321062.c:82: TH0 = initial >> 8; 
	mov	_TH0,(_initial + 1)
;	eOrgan-108321062.c:83: if(record_counter < sizeof(record_tone) / sizeof(unsigned char) && record_start == 1){ // 紀錄談奏相關資訊
	mov	a,#0x100 - 0x1e
	add	a,_record_counter
	jc	00122$
	jnb	_record_start,00122$
;	eOrgan-108321062.c:84: record_tone[record_counter] = press_value;
	mov	a,_record_counter
	add	a,#_record_tone
	mov	r0,a
	mov	@r0,_press_value
;	eOrgan-108321062.c:85: record_key[record_counter] = key;
	mov	a,_record_counter
	add	a,#_record_key
	mov	r0,a
	mov	@r0,_key
;	eOrgan-108321062.c:87: record_counter ++;
	inc	_record_counter
00122$:
;	eOrgan-108321062.c:89: record_start = 0;
;	assignBit
	clr	_record_start
	sjmp	00132$
00127$:
;	eOrgan-108321062.c:91: else if(press_value == 12){ // C 放音樂
	mov	a,#0x0c
	cjne	a,_press_value,00132$
;	eOrgan-108321062.c:92: P0 = ~P0;
	mov	a,_P0
	cpl	a
	mov	_P0,a
;	eOrgan-108321062.c:93: initial = 65536 -(1000000 / (tone[record_tone[time]] * record_key[time]));
	mov	a,_time
	add	a,#_record_tone
	mov	r1,a
	mov	a,@r1
	add	a,@r1
	add	a,#_tone
	mov	r1,a
	mov	dpl,@r1
	inc	r1
	mov	dph,@r1
	mov	a,_time
	add	a,#_record_key
	mov	r1,a
	mov	ar7,@r1
	mov	__mulint_PARM_2,r7
	mov	(__mulint_PARM_2 + 1),#0x00
	mov	psw,#0x00
	lcall	__mulint
	mov	psw,#0x08
	mov	r6,dpl
	mov	r7,dph
	mov	__divslong_PARM_2,r6
	mov	(__divslong_PARM_2 + 1),r7
	mov	(__divslong_PARM_2 + 2),#0x00
	mov	(__divslong_PARM_2 + 3),#0x00
	mov	dptr,#0x4240
	mov	b,#0x0f
	clr	a
	mov	psw,#0x00
	lcall	__divslong
	mov	psw,#0x08
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	clr	c
	clr	a
	subb	a,r4
	mov	_initial,a
	clr	a
	subb	a,r5
	mov	(_initial + 1),a
;	eOrgan-108321062.c:94: TL0 = initial & 0xff;
	mov	_TL0,_initial
;	eOrgan-108321062.c:95: TH0 = initial >> 8;
	mov	_TH0,(_initial + 1)
00132$:
;	eOrgan-108321062.c:99: }
	pop	psw
	pop	(0+0)
	pop	(0+1)
	pop	(0+2)
	pop	(0+3)
	pop	(0+4)
	pop	(0+5)
	pop	(0+6)
	pop	(0+7)
	pop	dph
	pop	dpl
	pop	b
	pop	acc
	pop	bits
	reti
;------------------------------------------------------------
;Allocation info for local variables in function 'timer_1'
;------------------------------------------------------------
;	eOrgan-108321062.c:101: void timer_1(void) __interrupt (3) __using (2){
;	-----------------------------------------
;	 function timer_1
;	-----------------------------------------
_timer_1:
	ar7 = 0x17
	ar6 = 0x16
	ar5 = 0x15
	ar4 = 0x14
	ar3 = 0x13
	ar2 = 0x12
	ar1 = 0x11
	ar0 = 0x10
	push	acc
	push	psw
	mov	psw,#0x10
;	eOrgan-108321062.c:102: if (P1 != 0xf0){
	mov	a,#0xf0
	cjne	a,_P1,00135$
	sjmp	00113$
00135$:
;	eOrgan-108321062.c:103: if(press_value == 12){ // C 放音樂
	mov	a,#0x0c
	cjne	a,_press_value,00113$
;	eOrgan-108321062.c:104: time_counter += 1;
	mov	a,_time_counter
	mov	r7,a
	inc	a
	mov	_time_counter,a
;	eOrgan-108321062.c:106: if(tempo_counter > 3){
	mov	a,_tempo_counter
	add	a,#0xff - 0x03
	jnc	00102$
;	eOrgan-108321062.c:107: fix = 10;
	mov	_fix,#0x0a
	sjmp	00103$
00102$:
;	eOrgan-108321062.c:109: fix = 100;
	mov	_fix,#0x64
00103$:
;	eOrgan-108321062.c:111: if (time_counter >= fix){ // 為下次單音撥放做準備
	clr	c
	mov	a,_time_counter
	subb	a,_fix
	jc	00108$
;	eOrgan-108321062.c:112: time_counter = 0;
	mov	_time_counter,#0x00
;	eOrgan-108321062.c:113: time ++;
	inc	_time
;	eOrgan-108321062.c:115: if (time >= sizeof(record_tone) / sizeof(unsigned char) || record_tone[time] == 0){
	mov	a,#0x100 - 0x1e
	add	a,_time
	jc	00104$
	mov	a,_time
	add	a,#_record_tone
	mov	r1,a
	mov	a,@r1
	jnz	00108$
00104$:
;	eOrgan-108321062.c:116: time = 0;
	mov	_time,#0x00
00108$:
;	eOrgan-108321062.c:119: TL1 = TIMER_TEMPO & 0xff;
	mov	_TL1,#0xef
;	eOrgan-108321062.c:120: TH1 = TIMER_TEMPO >> 8;
	mov	_TH1,#0xd8
00113$:
;	eOrgan-108321062.c:123: }
	pop	psw
	pop	acc
	reti
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;i                         Allocated to registers r7 
;------------------------------------------------------------
;	eOrgan-108321062.c:125: void main() 
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	eOrgan-108321062.c:127: P0 = 0xf0;                                                  // speaker and 7-display location 
	mov	_P0,#0xf0
;	eOrgan-108321062.c:128: P1 = 0xf0;                                                  // 4*4keypad
	mov	_P1,#0xf0
;	eOrgan-108321062.c:129: P2 = 0xff;                                                  // LED number
	mov	_P2,#0xff
;	eOrgan-108321062.c:131: TMOD = 0x11; 
	mov	_TMOD,#0x11
;	eOrgan-108321062.c:132: TCON = 0x50;
	mov	_TCON,#0x50
;	eOrgan-108321062.c:133: IE = 0x8a;
	mov	_IE,#0x8a
;	eOrgan-108321062.c:135: while (1) {
	mov	r7,#0x00
00134$:
;	eOrgan-108321062.c:136: num = Keypad();
	push	ar7
	lcall	_Keypad
	mov	_num,dpl
	pop	ar7
;	eOrgan-108321062.c:137: if (num != okey && okey == 0xff) {
	mov	a,_okey
	cjne	a,_num,00213$
	ljmp	00131$
00213$:
	mov	a,#0xff
	cjne	a,_okey,00214$
	sjmp	00215$
00214$:
	ljmp	00131$
00215$:
;	eOrgan-108321062.c:138: display = num;
	mov	_display,_num
;	eOrgan-108321062.c:139: press_value = num;
	mov	_press_value,_num
;	eOrgan-108321062.c:140: record_start = 1;
;	assignBit
	setb	_record_start
;	eOrgan-108321062.c:142: if(press_value == 0){ // 0 重置
	mov	a,_press_value
	jnz	00110$
;	eOrgan-108321062.c:146: record_counter = 0;
	mov	ar6,r7
00137$:
;	eOrgan-108321062.c:143: for(char i; i <= sizeof(record_tone) / sizeof(unsigned char); i++){
	mov	a,r6
	add	a,#0xff - 0x1e
	jc	00158$
;	eOrgan-108321062.c:144: record_tone[i] = 0;
	mov	a,r6
	add	a,#_record_tone
	mov	r0,a
	mov	@r0,#0x00
;	eOrgan-108321062.c:143: for(char i; i <= sizeof(record_tone) / sizeof(unsigned char); i++){
	inc	r6
	sjmp	00137$
00158$:
	mov	ar7,r6
;	eOrgan-108321062.c:146: record_counter = 0;
	mov	_record_counter,#0x00
;	eOrgan-108321062.c:147: tempo_counter = 5;
	mov	_tempo_counter,#0x05
;	eOrgan-108321062.c:148: time_counter = 0;
	mov	_time_counter,#0x00
;	eOrgan-108321062.c:149: time = 0;
	mov	_time,#0x00
;	eOrgan-108321062.c:150: key = 2;
	mov	_key,#0x02
	sjmp	00111$
00110$:
;	eOrgan-108321062.c:152: else if (press_value == 8 && key > 1){ // 8 降key
	mov	a,#0x08
	cjne	a,_press_value,00106$
	mov	a,_key
	add	a,#0xff - 0x01
	jnc	00106$
;	eOrgan-108321062.c:153: key *= 0.5;
	mov	dpl,_key
	push	ar7
	lcall	___uchar2fs
	mov	r3,dpl
	mov	r4,dph
	mov	r5,b
	mov	r6,a
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	mov	dptr,#(0x00&0x00ff)
	clr	a
	mov	b,a
	mov	a,#0x3f
	lcall	___fsmul
	mov	r3,dpl
	mov	r4,dph
	mov	r5,b
	mov	r6,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	mov	a,r6
	lcall	___fs2uchar
	mov	_key,dpl
	pop	ar7
	sjmp	00111$
00106$:
;	eOrgan-108321062.c:155: else if (press_value == 9 && key < 128){ // 9 升key
	mov	a,#0x09
	cjne	a,_press_value,00111$
	mov	a,#0x100 - 0x80
	add	a,_key
	jc	00111$
;	eOrgan-108321062.c:156: key *= 2;
	mov	a,_key
	mov	r6,a
	add	a,acc
	mov	_key,a
00111$:
;	eOrgan-108321062.c:158: if(press_value == 10 && tempo_counter > 0){ // A 減速
	mov	a,#0x0a
	cjne	a,_press_value,00113$
	mov	a,_tempo_counter
	jz	00113$
;	eOrgan-108321062.c:159: tempo_counter --;
	dec	_tempo_counter
;	eOrgan-108321062.c:160: display = tempo_counter;
	mov	_display,_tempo_counter
00113$:
;	eOrgan-108321062.c:162: if(press_value == 11 && tempo_counter < 9){ // B 加速
	mov	a,#0x0b
	cjne	a,_press_value,00116$
	mov	a,#0x100 - 0x09
	add	a,_tempo_counter
	jc	00116$
;	eOrgan-108321062.c:163: tempo_counter ++;
	inc	_tempo_counter
;	eOrgan-108321062.c:164: display = tempo_counter;
	mov	_display,_tempo_counter
00116$:
;	eOrgan-108321062.c:166: if(press_value == 13){ // D 升單音
	mov	a,#0x0d
	cjne	a,_press_value,00123$
;	eOrgan-108321062.c:167: if(sharp_flat == 0 || sharp_flat == 2){ 
	mov	a,_sharp_flat
	jz	00118$
	mov	a,#0x02
	cjne	a,_sharp_flat,00119$
00118$:
;	eOrgan-108321062.c:168: sharp_flat = 1;
	mov	_sharp_flat,#0x01
	sjmp	00123$
00119$:
;	eOrgan-108321062.c:170: sharp_flat = 0; // 在按一次回復無升降音
	mov	_sharp_flat,#0x00
00123$:
;	eOrgan-108321062.c:173: if(press_value == 14){ // E 降單音
	mov	a,#0x0e
	cjne	a,_press_value,00131$
;	eOrgan-108321062.c:174: if(sharp_flat == 0 || sharp_flat == 1){
	mov	a,_sharp_flat
	jz	00124$
	mov	a,#0x01
	cjne	a,_sharp_flat,00125$
00124$:
;	eOrgan-108321062.c:175: sharp_flat = 2;
	mov	_sharp_flat,#0x02
	sjmp	00131$
00125$:
;	eOrgan-108321062.c:177: sharp_flat = 0; // 在按一次回復無升降音
	mov	_sharp_flat,#0x00
00131$:
;	eOrgan-108321062.c:181: LED_Display(display);
	mov	r4,_display
	mov	r5,#0x00
	mov	r6,#0x00
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	push	ar7
	lcall	_LED_Display
	pop	ar7
;	eOrgan-108321062.c:182: okey = num;
	mov	_okey,_num
;	eOrgan-108321062.c:184: }
	ljmp	00134$
	.area CSEG    (CODE)
	.area CONST   (CODE)
_tempo:
	.db #0xef	; 239
	.db #0x28	; 40
	.db #0x40	; 64
	.db #0x58	; 88	'X'
	.db #0x60	; 96
	.db #0x50	; 80	'P'
	.db #0x40	; 64
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x10	; 16
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
