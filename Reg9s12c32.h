
;HC12 I/O register locations (MC9s12C32)

REGBASE	        equ	$0
RAMBASE	        equ	$3800

porta		equ	$0000		;porta
portb		equ	$0001		;portb
ddra		equ	$0002		;porta - data direction register
ddrb		equ	$0003		;portb - data direction register

porte		equ	$0008		;porte
ddre		equ	$0009		;porte - data direction register
pear		equ	$000a		;pear - porte assignment register
mode		equ	$000b		;mode - mode register
pucr		equ	$000c		;pucr - pull up control register
rdriv		equ	$000d		;rdriv - reduced drive of i/o lines
ebictl		equ	$000e		;ebitctl - estr

initrm		equ	$0010		;initrm - initialization of internal ram position register
initrg		equ	$0011		;initrg - initialization of internal register position register
initee		equ	$0012		;initee - initialization of internal eeprom position register
misc		equ	$0013		;misc - miscellaneous mapping control register

itcr		equ	$0015
itest		equ	$0016

vregctrl		equ	$19

partidh		equ	$001a
partidl		equ	$001b
memsiz0		equ	$001c
memsiz1		equ	$001d

intcr		equ	$001e           ;intcr - interrupt control register
hprio		equ	$001f           ;hprio - highest priority i interrrupt

;debug12
dbgc1		equ	$20
dbgsc		equ	$21
dbgtbh		equ	$22
dbgtbl		equ	$23
dbgcnt		equ	$24
dbgccx		equ	$25
dbgcch		equ	$26
dbgccl		equ	$27
dbgc2		equ	$28
bkpct0		equ	$28
dbgc3		equ	$29		
bkpct1		equ	$29
dbgcax		equ	$2a
bkp0x		equ	$2a
dbgcah		equ	$2b
bkp0h		equ	$2b
dbgcal		equ	$2c
bkp0l		equ	$2c
dbgcbx		equ	$2d
bkp1x		equ	$2d

dbgcbh		equ	$2e
bkp1h		equ	$2e
dbgcbl		equ	$2f
bkp1l		equ	$2f

ppage		equ	$0030

portk		equ	$0032
ddrk		equ	$0033

;crg - clock and reset generator
synr		equ	$0034           ;crg synthesizer register
refdv		equ	$0035           ;crg reference divider register
ctflg		equ	$0036		;test only
crgflg		equ	$0037		;crg flags register
crgint		equ	$0038
clksel		equ	$0039		;crg clock select register
pllctl		equ	$003a		;crg pll control register
rtictl		equ	$003b
coptctl		equ	$003c
COPCTL	        equ	$003c           ; an alias for the above
forbyp		equ	$003d
ctctl		equ	$003e
armcop		equ	$003f

;tim - timer 16 bit 8 channels
tios		equ	$0040		;tios - timer input capture/output compare select
cforc		equ	$0041		;cforc - timer compare force register
oc7m		equ	$0042		;oc7m - output compare 7 mask register
oc7d		equ	$0043		;oc7d - output compare 7 data register

tcnt		equ	$0044
tcnth		equ	$0044
tcntl		equ	$0045

tscr		equ	$0046		;tscr - timer system control register
ttov		equ	$0047
tctl1		equ	$0048		;tctl1 - timer control register 1
tctl2		equ	$0049		;tctl2 - timer control register 3
tctl3		equ	$004a		;tctl3 - timer control register 3
tctl4		equ	$004b		;tctl4 - timer control register 3
tie		equ	$004c

tmsk1		equ	$004c		; label from DP256
tscr2		equ	$004d
tflg1		equ	$004e		;tflg1 - timer interrupt flag 1
tflg2		equ	$004f		;tflg2 - timer interrupt flag2

tc0		equ	$0050		;tc0 - timer input/capture compare high register0
tc1		equ	$0052		;tc1 - timer input/capture compare high register0
tc2		equ	$0054		;tc2 - timer input/capture compare high register0
tc3		equ	$0056		;tc3 - timer input/capture compare high register0
tc4		equ	$0058		;tc4 - timer input/capture compare high register0
tc5		equ	$005a		;tc5 - timer input/capture compare high register0
tc6		equ	$005c		;tc6 - timer input/capture compare high register0
tc7		equ	$005e		;tc7 - timer input/capture compare high register0


pactl		equ	$0060		;patcl - pulse accumulator control register
paflg		equ	$0061		;paflg - pulse accumulator flag register
pacnt		equ	$0062		;pacn3 - hi byte
pacnth		equ	$0062		;pacn3 - hi byte
pacntl		equ	$0063		;pacn2 - lo byte

;atd - analog to digital converter 10 bit 8 channel
atdctl0		equ	$0080		;atdctl0 - reserved
atdctl1		equ	$0081		;atdctl1 - reserved
atdctl2		equ	$0082		;atdctl2 - atd control register
atdctl3		equ	$0083		;atdctl3 - atd control register
atdctl4		equ	$0084		;atdctl4 - atd control register
atdctl5		equ	$0085		;atdctl5 - atd control register
atdstat0 	equ	$0086	

atdtest0	equ	$0088	;atdtest
atdtest1	equ	$0089	;atdtest

atdstat1	equ	$8b
atddien1	equ	$8d
atd0dien	equ	$8d			; Label from DP256

portad0		equ	$008f		;portad - port ad data input register

atddr0h		equ	$0090
atddr0l		equ	$0091
atddr1h		equ	$0092
atddr1l		equ	$0093
atddr2h		equ	$0094
atddr2l		equ	$0095
atddr3h		equ	$0096
atddr3l		equ	$0097
atddr4h		equ	$0098
atddr4l		equ	$0099
atddr5h		equ	$009a
atddr5l		equ	$009b
atddr6h		equ	$009c
atddr6l		equ	$009d
atddr7h		equ	$009e
atddr7l		equ	$009f

;sci - asynchronous serial interface
scibdh		equ	$00c8		;sci0bdh - sci baud rate control register
scibdl		equ	$00c9		;sci0bdl - sci baud rate control register
scicr1		equ	$00ca		;sci0cr1 - sci control register
scicr2		equ	$00cb		;sci0cr2 - sci control register
scisr1		equ	$00cc		;sci0sr1 - sci status register
scisr2		equ	$00cd		;sci0sr2 - sci status register
scidrh		equ	$00ce		;sci0drh - sci data register
scidrl		equ	$00cf		;sci0drl - sci data register

;spi - serial peripheral interface
spicr1		equ	$00d8		;spi0cr1 - spi control register
spicr2		equ	$00d9		;spi0cr2 - spi control register
spibr		equ	$00da		;spi0br - spi baud rate register
spisr		equ	$00db		;spi0sr - spi status register
spidr		equ	$00dd		;spi0dr - spi data register

;pwm (pulse width modulator)
pwme		equ	$e0	
pwmpol		equ	$e1
pwmclk		equ	$e2
pwmprclk	equ	$e3
pwmcae		equ	$e4
pwmctl		equ	$e5
pwmtst		equ	$e6
pwmprsc		equ	$e7
pwmscla		equ	$e8
pwmsclb		equ	$e9
pwmscnta	equ	$ea
pwmscntb	equ	$eb

pwmcnt0		equ	$ec
pwmcnt1		equ	$ed
pwmcnt2		equ	$ee
pwmcnt3		equ	$ef
pwmcnt4		equ	$f0
pwmcnt5		equ	$f1

pwmper0		equ	$f2
pwmper1		equ	$f3
pwmper2		equ	$f4
pwmper3		equ	$f5
pwmper4		equ	$f6
pwmper5		equ	$f7

pwmdty0		equ	$f8
pwmdty1		equ	$f9
pwmdty2		equ	$fa
pwmdty3		equ	$fb
pwmdty4		equ	$fc
pwmdty5		equ	$fd
;reserve	equ	$fe

;flash control register
fclkdiv		equ	$100
fsec		equ	$101
fcnfg		equ	$103
fprot		equ	$104
fstat		equ	$105
fcmd		equ	$106

;can (motorola scalable can - mscan)
canctl0		equ	$0140
canctl1		equ	$0141
canbtr0		equ	$0142
canbtr1		equ	$0143
canrflg		equ	$0144
canrier		equ	$0145
cantflg		equ	$0146
cantier		equ	$0147
cantarq		equ	$0148
cantaak		equ	$0149
cantbsel	equ	$014a
canidac		equ	$014b
canrxerr	equ	$014e
cantxerr	equ	$014f
canidar0	equ	$0150
canidar1	equ	$0151
canidar2	equ	$0152
canidar3	equ	$0153
canidmr0	equ	$0154
canidmr1	equ	$0155
canidmr2	equ	$0156
canidmr3	equ	$0157
canidar4	equ	$0158
canidar5	equ	$0159
canidar6	equ	$015a
canidar7	equ	$015b
canidmr4	equ	$015c
canidmr5	equ	$015d
canidmr6	equ	$015e
canidmr7	equ	$015f
canrxfg		equ	$0160		;receive buffer = $0160-$016f
cantxfg		equ	$0170		;transmit buffer = $0170-$017f

;
portt:		equ	$0240	; port t data register (alternate name).
ptt:		equ	$0240	; port t data register.
ptit:		equ	$0241	; port t input pin register.
ddrt:		equ	$0242	; port t data direction register.
rdrt:		equ	$0243	; port t reduced drive enable register.
pert:		equ	$0244	; port t pull up/down enable register.
ppst:		equ	$0245	; port t pull up/down select (polarity) register.
;
modrr		equ	$247
;
ports		equ	$0248	; port s data register (alternate name).
pts		equ	$0248	; port s data register.
ptis		equ	$0249	; port s input pin register.
ddrs		equ	$024a	; port s data direction register.
rdrs		equ	$024b	; port s reduced drive enable register.
pers		equ	$024c	; port s pull up/down enable register.
ppss		equ	$024d	; port s pull up/down select (polarity) register.
woms		equ	$024e	; port s wired-or (open drain) select register.
;
portm:		equ	$0250	; port m data register (alternate name).
ptm:		equ	$0250	; port m data register.
ptim:		equ	$0251	; port m input pin register.
ddrm:		equ	$0252	; port m data direction register.
rdrm:		equ	$0253	; port m reduced drive enable register.
perm:		equ	$0254	; port m pull up/down enable register.
ppsm:		equ	$0255	; port m pull up/down select (polarity) register.
womm:		equ	$0256	; port m wired-or (open drain) select register.
;
portp:		equ	$0258	; port p data register (alternate name).
ptp:		equ	$0258	; port p data register.
ptip:		equ	$0259	; port p input pin register.
ddrp:		equ	$025a	; port p data direction register.
rdrp:		equ	$025b	; port p reduced drive enable register.
perp:		equ	$025c	; port p pull up/down enable register.
ppsp:		equ	$025d	; port p pull up/down select (polarity) register.
piep		equ	$25e
pifp		equ	$25f
;
portj:		equ	$0268	; port j data register (alternate name).
ptj:		equ	$0268	; port j data register.
ptij:		equ	$0269	; port j input pin register.
ddrj:		equ	$026a	; port j data direction register.
rdrj:		equ	$026b	; port j reduced drive enable register.
perj:		equ	$026c	; port j pull up/down enable register.
ppsj:		equ	$026d	; port j pull up/down select (polarity) register.
peij		equ	$026e	; port j interrupt enable register.
pifj		equ	$26f	; port j
;
portad		equ	$270
ptad		equ	$270	
ptiad		equ	$271	; port ad
ddrad		equ	$272	; port ad
rdrad		equ	$273	; port ad
perad		equ	$274	; port ad
ppsad		equ	$275	; port ad


