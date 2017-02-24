; Demo program for for Technological Arts HCS12DIP32 with Docking module
;
; LED 1 flashes at a rate of once per second
; LED 2 flashes at rate of twice that speed
;
#include Reg9s12c32.h

	org $4000	; start of program memory

startup_code
        sei			; Disable interrupts
	movb #$00,INITRG	; set registers to $0000 
	movb #$39, INITRM	; init RAM ($3800 - $3fff)
        lds #$3fce	    	; init stack
	cli			; enable interrupts
		
;;      The internal PLL clock lets us set the speed of the processor.
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
;;        Bus Clock = PLLCLK / 2 = 24 Mhz (for an OscFreq of 8 Mhz)
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
	bclr CLKSEL, #$80	 ; disengage PLL to system
	bset PLLCTL, #$40	 ; turn on PLL
	movb #$2, SYNR		 ; set PLL multiplier
	movb #$0, REFDV		 ; set PLL divider
	nop
	nop
	brclr CRGFLG,#$08,>*+0 ; while (!(crg.crgflg.bit.lock==1))
	bset CLKSEL,#$80	 ; engage PLL
	
;------------------------------------------------------------------
; User Program
;
; LED 1 flashes at a rate of once per second
; LED 2 flashes at rate of twice that speed
;
USER_START
	movb #$40, COPCTL	; COP off; RTI and COP stopped in BDM-mode
	movb  #$ff, DDRT	; make port T an output port

back:	bclr PORTT, #$1		; make pin 1 low
	bset PORTT, #$2		; make pin 2 high
	jsr	d_250ms
        bclr PORTT, #$2		; make pin 2 low, pin 1 stays low
	jsr	d_250ms
        bset PORTT, #$1		; make pin 1 high
        bset PORTT, #$2		; make pin 2 high
	jsr	d_250ms
        bclr PORTT, #$2		; make pin 2 low, pin 1 stays high
	jsr	d_250ms
	jmp	back

d_250ms: ldab	#250		; delay 250 ms
	 jmp	dly1

; upon coming here, b has the number of ms you want to delay
dly1:	ldy	#6000		; (6000 = 1ms @ 24,000 cycles)
dly:	dey			; 1 cycle
	bne	dly		; 3 cycles
	decb
	bne	dly1
	rts

BadInt			; handle unexpected interrupts...
	rti
	
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
	fdb	startup_code	;$FFFA: COP Failure (Reset) ()
	fdb	BadInt		;$FFFC: Clock Monitor Fail (Reset) ()
	fdb	startup_code	;$FFFE: /RESET
