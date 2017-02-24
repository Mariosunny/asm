;
; Blinkc32-fly.asm  -- Example program 2 for the DRAGONfly12 DIP40 module with the DOCK40 board
;		(c)2005, EVBplus.com, written by Wayne Chu
;               The PLL code is contributed by Eric Engler and Bill Cuono
;
;     Function:	Makes port T as a 2-bit binary counter (blinks the LEDs).
;

#include        reg9s12c32.h

REGBLK:		equ	$0000
SPEED:		equ	$FFFF	; change this number to change counting speed
;
STACK:	equ	$3fce	    	; init stack
;
        org     $c000

; program code
start: 	lds	#STACK
        movb #$00,INITRG	; set registers to $0000
	movb #$39, INITRM	; init RAM ($3800 - $3fff)

;       The internal PLL clock lets us set the speed of the processor.
;;      If you do not set the speed of the PLL as we are doing here, the
;;      default bus speed speed will be 4 Mhz (half the OscFreq).
;;
;;      The math used to set the PLL frequency:
;;        OscFreq = 8Mhz
;;        initSYNR = 2      PLL multiplier
;;        initREFDV = 0     PLL divider - 1
;;        PLLCLK = 2 * OscFreq * (initSYNR+1) / (initREFDV+1)
;;      Usually the OscFreq is 8Mhz, so we have PLLCLK = 2*8*3/1 = 48Mhz
;;      The bus clock runs at half of the PLL speed:
;;      Bus Clock = PLLCLK / 2 = 24 Mhz (for an OscFreq of 8 Mhz)
;;
;;      The effective cycle clock you should use for timing instructions is the
;;      bus clock of 24 Mhz. This is currently the fastest speed this device
;;      can safely use. Overclocking is not recommended.
;;
;;      If you set a slower speed, it will reduce power consumption. If low
;;      power consumption is important (like for battery-powered circuits), you
;;      should also put the processor to sleep as often as possible.
;;
;;      Set the PLL speed:
;;

;********PLL code for 24MHz bus speed from a 4/8/16 crystal
	sei
	ldx	#REGBLK
	bclr	clksel,x,%10000000	; clear bit 7, clock derived from oscclk
	bset	pllctl,x,%01000000   	; Turn PLL on, bit 6 =1 PLL on, bit 6=0 PLL off
	ldaa	#$05			; 5+1=6 multiplier
	staa	synr,x
;	ldaa	#$03		; 3+1=4 divisor, 6/4 * 16 = 24Mhz for 16 MHz crystal
	ldaa	#$01		; 1+1=2 divisor, 6/2 *  8 = 24Mhz for  8 MHz crystal
;	ldaa	#$00		; 0+1=1 divisor, 6/1 *  4 = 24Mhz for  4 MHz crystal
	staa	refdv,x
wait_b3:
	brclr	crgflg,x,%00001000,wait_b3    ; Wait until bit 3 = 1
	bset	clksel,x,%10000000
	cli
;**********

       	ldaa	#$ff
       	staa	ddrt,x		; make port T an output port
back:	inca
	staa 	portt,x
	jsr	d100ms
	jmp	back
*
d100ms:	ldab	#100		; delay 100 ms
	jmp	dly1

delay:	ldab	#1		; delay 1 ms
dly1:	ldy	#6000		; 6000 x 4 = 24,000 cycles = 1ms
dly:	dey			; 1 cycle
	bne	dly		; 3 cycles
	decb
	bne	dly1
	rts
	
BadInt:	rti			; handle UNexpected interrupts...
	
; ------------------ VECTOR TABLE --------------------
	org	$FF8A
	fdb	BadInt	;$FF8A: VREG LVI
	fdb	BadInt	;$FF8C: PWM emergency shutdown
	fdb	BadInt	;$FF8E: PortP
	fdb	BadInt	;$FF90: Reserved
	fdb	BadInt	;$FF92: Reserved
	fdb	BadInt	;$FF94: Reserved
	fdb	BadInt	;$FF96: Reserved
	fdb	BadInt	;$FF98: Reserved
	fdb	BadInt	;$FF9A: Reserved
	fdb	BadInt	;$FF9C: Reserved
	fdb	BadInt	;$FF9E: Reserved
	fdb	BadInt	;$FFA0: Reserved
	fdb	BadInt	;$FFA2: Reserved
	fdb	BadInt	;$FFA4: Reserved
	fdb	BadInt	;$FFA6: Reserved
	fdb	BadInt	;$FFA8: Reserved
	fdb	BadInt	;$FFAA: Reserved
	fdb	BadInt	;$FFAC: Reserved
	fdb	BadInt	;$FFAE: Reserved
	fdb	BadInt	;$FFB0: CAN transmit
	fdb	BadInt	;$FFB2: CAN receive
	fdb	BadInt	;$FFB4: CAN errors
	fdb	BadInt	;$FFB6: CAN wake-up
	fdb	BadInt	;$FFB8: FLASH
	fdb	BadInt	;$FFBA: Reserved
	fdb	BadInt	;$FFBC: Reserved
	fdb	BadInt	;$FFBE: Reserved
	fdb	BadInt	;$FFC0: Reserved
	fdb	BadInt	;$FFC2: Reserved
	fdb	BadInt	;$FFC4: CRG self-clock-mode
	fdb	BadInt	;$FFC6: CRG PLL Lock
	fdb	BadInt	;$FFC8: Reserved
	fdb	BadInt	;$FFCA: Reserved
	fdb	BadInt	;$FFCC: Reserved
	fdb	BadInt	;$FFCE: PORTJ
	fdb	BadInt	;$FFD0: Reserved
	fdb	BadInt	;$FFD2: ATD
	fdb	BadInt	;$FFD4: Reserved
	fdb	BadInt	;$FFD6: SCI Serial System
	fdb	BadInt	;$FFD8: SPI Serial Transfer Complete
	fdb	BadInt	;$FFDA: Pulse Accumulator Input Edge
	fdb	BadInt	;$FFDC: Pulse Accumulator Overflow
	fdb	BadInt	;$FFDE: Timer Overflow
	fdb	BadInt	;$FFE0: Standard Timer Channel 7
	fdb	BadInt  ;$FFE2: Standard Timer Channel 6
	fdb	BadInt	;$FFE4: Standard Timer Channel 5
	fdb	BadInt	;$FFE6: Standard Timer Channel 4
	fdb	BadInt	;$FFE8: Standard Timer Channel 3
	fdb	BadInt	;$FFEA: Standard Timer Channel 2
	fdb	BadInt	;$FFEC: Standard Timer Channel 1
	fdb	BadInt	;$FFEE: Standard Timer Channel 0
	fdb	BadInt	;$FFF0: Real Time Interrupt (RTI)
	fdb	BadInt	;$FFF2: IRQ (External Pin or Parallel I/O) (IRQ)
	fdb	BadInt	;$FFF4: XIRQ (Pseudo Non-Maskable Interrupt) (XIRQ)
	fdb	BadInt	;$FFF6: Software Interrupt (SWI)
	fdb	BadInt	;$FFF8: Illegal Opcode Trap ()
	fdb	start	;$FFFA: COP Failure (Reset) ()
	fdb	BadInt	;$FFFC: Clock Monitor Fail (Reset) ()
	fdb	start	;$FFFE: /RESET
  	end
